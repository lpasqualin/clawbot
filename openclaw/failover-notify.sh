#!/bin/bash
# ClawBot startup health check + failover monitor
# Sends one health summary on boot, then watches for FailoverError in logs.

OPENCLAW=/home/clawbot/.npm-global/bin/openclaw
LOGDIR=/tmp/openclaw
NOTIFYLOG=/home/clawbot/.openclaw/failover-notify.log
CHAT_ID=YOUR_TELEGRAM_ID
RETRY_SECS=30

log() { echo "[$(date '+%Y-%m-%d %H:%M:%S')] $*" >> "$NOTIFYLOG"; }

send() {
    "$OPENCLAW" message send \
        --channel telegram \
        --target "$CHAT_ID" \
        --message "$1" \
        >> "$NOTIFYLOG" 2>&1
}

# --- Startup health check ---
log "ClawBot monitor started (PID $$)"

# Memory: file-based
if [[ -f /home/clawbot/.openclaw/workspace/MEMORY.md ]]; then
    MEMORY_STATUS="✅ MEMORY.md (file)"
else
    MEMORY_STATUS="❌ MEMORY.md missing"
fi

# Active model from config
ACTIVE_MODEL=$(grep -o '"agent model: [^"]*"' "${LOGDIR}/openclaw-$(date '+%Y-%m-%d').log" 2>/dev/null | tail -1 | sed 's/"agent model: //;s/"//')
[[ -z "$ACTIVE_MODEL" ]] && ACTIVE_MODEL="unknown"

# Ollama
OLLAMA_COUNT=$(curl -s http://localhost:11434/api/tags 2>/dev/null | grep -o '"name"' | wc -l)
if [[ "$OLLAMA_COUNT" -gt 0 ]]; then
    OLLAMA_STATUS="✅ ${OLLAMA_COUNT} models"
else
    OLLAMA_STATUS="❌ Offline"
fi

# Telegram channel — check paired.json on disk (openclaw CLI unavailable from backgrounded process)
log "DEBUG: checking Telegram"
TELEGRAM_PAIRED=/home/clawbot/.openclaw/credentials/telegram-pairing.json
if [[ -s "$TELEGRAM_PAIRED" ]]; then
    TELEGRAM_STATUS="✅ Connected"
    log "DEBUG: telegram paired.json present ($(wc -c < "$TELEGRAM_PAIRED") bytes)"
else
    TELEGRAM_STATUS="⚠️ Check needed"
    log "DEBUG: telegram paired.json missing or empty"
fi

# Cron jobs — count unique UUIDs across cron data files (CLI unavailable from backgrounded process)
log "DEBUG: checking Cron"
CRON_DIR=/home/clawbot/.openclaw/cron
if [[ -d "$CRON_DIR/jobs" ]]; then
    CRON_COUNT=$(ls "$CRON_DIR/jobs"/*.json 2>/dev/null | wc -l)
elif [[ -f "$CRON_DIR/jobs.json" ]]; then
    CRON_COUNT=$(python3 -c "import json; data=json.load(open('$CRON_DIR/jobs.json')); print(len(data) if isinstance(data,list) else len(data.get('jobs',data)))" 2>/dev/null || echo 0)
else
    CRON_COUNT=0
fi
log "DEBUG: cron jobs found: $CRON_COUNT"
if [[ "$CRON_COUNT" -gt 0 ]]; then
    CRON_STATUS="✅ ${CRON_COUNT} active"
else
    CRON_STATUS="⚠️ None active"
fi

# Obsidian REST API
if curl -sk https://localhost:27124/ > /dev/null 2>&1; then
    OBSIDIAN_STATUS="✅ Online"
else
    OBSIDIAN_STATUS="❌ Offline"
fi

# Tailscale
TS_IP=$(ip addr show tailscale0 2>/dev/null | grep -oP '(?<=inet )\d+\.\d+\.\d+\.\d+')
if [[ -n "$TS_IP" ]]; then
    TAILSCALE_STATUS="✅ ${TS_IP}"
else
    TAILSCALE_STATUS="❌ Down"
fi

# Disk free on /
DISK_FREE=$(df -h / | awk 'NR==2 {print $4}')
DISK_STATUS="${DISK_FREE} free"

BOOT_TIME=$(date '+%Y-%m-%d %H:%M:%S')

send "🤖 ClawBot Online — $(hostname)
🧠 Model: ${ACTIVE_MODEL}
💾 Memory: ${MEMORY_STATUS}
🤖 Ollama: ${OLLAMA_STATUS}
📱 Telegram: ${TELEGRAM_STATUS}
⏰ Cron: ${CRON_STATUS}
📓 Obsidian: ${OBSIDIAN_STATUS}
🌐 Tailscale: ${TAILSCALE_STATUS}
💿 Disk: ${DISK_STATUS}
🕐 Boot: ${BOOT_TIME}"

# --- Failover monitor ---
LAST_MODEL=""
LAST_TIME=0

follow_logfile() {
    local logfile
    logfile="${LOGDIR}/openclaw-$(date '+%Y-%m-%d').log"
    if [[ ! -f "$logfile" ]]; then
        log "Log file not found: $logfile — waiting..."
        sleep "$RETRY_SECS"
        return
    fi
    log "Tailing: $logfile"
    tail -n 0 -f "$logfile" 2>>"$NOTIFYLOG" | \
    while IFS= read -r line; do
        echo "$line" | grep -q "FailoverError" || continue
        model=$(echo "$line" | grep -oP 'Unknown model: \K[^\s"]+' || echo "unknown")
        now=$(date +%s)
        if [[ "$model" == "$LAST_MODEL" && $(( now - LAST_TIME )) -lt 60 ]]; then
            continue
        fi
        LAST_MODEL="$model"
        LAST_TIME="$now"
        ts=$(date '+%Y-%m-%d %H:%M:%S')
        log "FailoverError detected: model=${model}"
        send "⚠️ Model Failover — $(hostname)
❌ Primary failed: ${model}
⏬ Falling back to next in chain.
🕐 ${ts}"
    done
    log "tail -f ended for $logfile — will check for date rollover"
}

while true; do
    follow_logfile
    sleep "$RETRY_SECS"
done
