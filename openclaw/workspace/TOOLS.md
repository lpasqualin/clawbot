# TOOLS.md — Local Environment Reference

This file is a cheat sheet for this specific machine and setup.
No doctrine, no routing rules, no strategy — just environment facts.

---

## Machine

| Field | Value |
|---|---|
| Model | HP ProDesk 600 |
| OS | Ubuntu 24.04.4 LTS |
| Hostname | `leo-HP-ProDesk-600` |
| CPU | 6-core Intel |
| RAM | 32 GB |
| Storage | NVMe SSD |
| Timezone | America/New_York |
| Display | X11 (Wayland disabled) |

## Network

| Name | Address |
|---|---|
| Tailscale — ProDesk | 100.118.159.86 |
| Tailscale — Windows laptop | 100.78.65.107 |
| RustDesk ID | 379632253 |
| RustDesk relay | Self-hosted Docker (hbbs / hbbr) — currently DOWN |

## Users

| User | Notes |
|---|---|
| `leo-paz` | UID 1000, passwordless sudo, docker + ollama groups. Primary human user. |
| `clawbot` | Service account. Runs OpenClaw and all ClawBot services. |

## Paths

### Binaries
| Binary | Path |
|---|---|
| openclaw | `/home/clawbot/.npm-global/bin/openclaw` |
| gog CLI | `/home/clawbot/gogcli/bin/gog` (symlinked: `/usr/local/bin/gog`) |
| ollama | System PATH via `ollama.service` |

### Config and Data
| Item | Path |
|---|---|
| OpenClaw config | `/home/clawbot/.openclaw/openclaw.json` |
| OpenClaw workspace | `/home/clawbot/.openclaw/workspace/` |
| Skill overrides | `/home/clawbot/.openclaw/workspace/skills/<name>/SKILL.md` |
| Secrets (root-owned) | `/etc/openclaw.env` |
| Failover notify script | `/home/clawbot/.openclaw/failover-notify.sh` |
| Obsidian vault | `/home/leo-paz/obsidian-vault` |
| npm globals root | `/home/clawbot/.npm-global/` |

## Services

| Service | User | Port | Status |
|---|---|---|---|
| `openclaw.service` | clawbot | 18789 | Running |
| `ollama.service` | — | 11434 | Running |
| `postgresql` | — | 5432 | Running (`clawbot_mem_db`) |
| `clawbot-memory.service` | leo-paz | 9001 | Disabled (parked) |
| `rustdesk.service` | — | — | Running |
| Docker: `hbbs` / `hbbr` | — | — | Down (non-blocking) |

## Ollama Models

`qwen3:1.7b` · `qwen3:8b` · `glm4:9b` · `deepseek-r1:14b` · `gemma3:12b` ·
`nomic-embed-text`

## Accounts

### Google OAuth
| Account | Access |
|---|---|
| leo.clawbot.1@gmail.com | Full Workspace: Drive, Docs, Sheets, Gmail, Calendar, Contacts |
| YOUR_GOOGLE_ACCOUNT | Gmail, Calendar, Contacts only (read+write). No Drive/Docs/Sheets. |

### Telegram
| Field | Value |
|---|---|
| Bot | @L30_Clawbot |
| Leo's user ID | YOUR_TELEGRAM_ID |
| Leo's handle | @L30_paz |

## Obsidian

| Field | Value |
|---|---|
| Vault path | `/home/leo-paz/obsidian-vault` |
| REST API | `https://localhost:27124` (self-signed cert) |
| API key | Stored in `/etc/openclaw.env` |
| Access note | Requires Obsidian running in active GUI session (RustDesk/X11) |
| Folders | `00 Inbox/` · `01 Daily/` · `02 Projects/` (BBS, Siftwise, Agent OS, ClawBot) · `03 Operations/` (Admin, Finance, Health, Home) · `04 Assets/` (About-Leo, Digital Assets) |
