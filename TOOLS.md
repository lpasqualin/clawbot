# TOOLS.md — Local Environment Reference

This file is a cheat sheet for this specific machine and setup.
No doctrine, no routing rules, no strategy — just environment facts.

---

## Machine

| Field | Value |
|---|---|
| Model | Venus Series (MS-01) |
| OS | Ubuntu 24.04.4 LTS |
| Hostname | `[HOSTNAME]` |
| CPU | 6-core Intel |
| RAM | 32 GB |
| Storage | NVMe SSD |
| Timezone | America/New_York |
| Display | X11 (Wayland disabled) |

## Network

| Name | Address |
|---|---|
| Tailscale — Venus | [REDACTED] |
| Tailscale — Windows laptop | [REDACTED] |
| RustDesk ID | [REDACTED] |
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
| [REDACTED] | Full Workspace: Drive, Docs, Sheets, Gmail, Calendar, Contacts |
| [REDACTED] | Gmail, Calendar, Contacts only (read+write). No Drive/Docs/Sheets. |

### Telegram
| Field | Value |
|---|---|
| Bot | [TELEGRAM_HANDLE] |
| Leo's user ID | [REDACTED] |
| Leo's handle | [TELEGRAM_HANDLE] |

## Obsidian

| Field | Value |
|---|---|
| Vault path | `/home/leo-paz/obsidian-vault` |
| REST API | `https://localhost:27124` (self-signed cert) |
| API key | Stored in `/etc/openclaw.env` |
| Access note | Requires Obsidian running in active GUI session (RustDesk/X11) |
| Folders | `00 Inbox/` · `01 Daily/` · `02 Projects/` (BBS, Siftwise, Agent OS, ClawBot) · `03 Operations/` (Admin, Finance, Health, Home) · `04 Assets/` (About-Leo, Digital Assets) · `90 - Archive/` (removed) |
