# MEMORY.md — ClawBot Durable Memory

_Last updated: 2026-04-13_

---

## MEMORY MAINTENANCE RULE

`ACTIVE SUMMARY` is the boot layer. Keep it short, current, high-signal.

When durable memory changes:
1. Update the relevant durable section.
2. Update `ACTIVE SUMMARY` only if startup-relevant judgment changes.
3. Remove stale items from `ACTIVE SUMMARY`.
4. Move superseded rules to `SUPERSEDED / ARCHIVED` if historical trace matters.

Do not use this file as a session log.
Do not store tasks, drafts, research, or open loops here — those live in Todoist and Obsidian.

---

## ACTIVE SUMMARY

- Primary machine: MS-01 (leo-paz-MS-10-Venus, 100.86.220.59)
- MS-01 migration is complete; Todoist, Obsidian REST, agent memory indexing, and exec approvals are now wired on Venus
- Primary orchestrator: OpenClaw 2026.4.9
- Revenue motion is the top priority — BBS client acquisition before more architecture
- ClawBot is the only writer to this file
- File-based memory is authoritative; pgvector parked

---

## Strategic Model

Four lenses — everything maps to at least one:

- **Build** — Agent OS (long-term architecture)
- **Money** — BBS (revenue, clients, deployments)
- **Position** — Portfolio / Career (proof of work, credibility)
- **Operate** — ClawBot (infrastructure, memory, continuity)

Bias toward execution, shipping, revenue, real-world use.
Anti-bias: over-organizing, over-architecting, collecting without acting.

---

## Project Priorities

1. **BBS** — Revenue engine. First client acquisition is the highest-leverage action.
2. **Agent OS** — Primary long-term build.
3. **ClawBot** — Operator layer. Daily ops, memory, continuity.
4. **Portfolio / Career** — Proof of work, positioning.
5. **Siftwise** — Shelved.

---

## Infrastructure

**Primary machine:** MS-01 (leo-paz-MS-10-Venus, Tailscale 100.86.220.59)
Intel i9-13900H, 32GB DDR5, Ubuntu 24.04. ProDesk retained as fallback only.

**MS-01 migration status (completed 2026-04-13):**
- Todoist fixed. Working runtime path uses `TODOIST_API_KEY` as the source value and maps it into `TODOIST_API_TOKEN` for the Todoist skill/CLI.
- systemd `EnvironmentFile` override is in place.
- Obsidian REST API is running as `obsidian-api.service` on port `27124`, with a custom Obsidian `SKILL.md`, against vault `/home/leo-paz/obsidian-vault`.
- `gog` v0.12.0 is installed and authenticated for `leo.pasqua88@gmail.com`.
- All agent memory directories are created and indexed.
- Exec approvals wildcard is enabled for all agents.

**Post-migration setup gaps to resume next session:**
- Skill binary installs still missing: `ripgrep`, `tmux`, `ffmpeg`, `gh`.
- API keys still needed: `RISK_OFFICER_TOKEN`, `NOTION_API_KEY`, `TRELLO_API_KEY`, `TRELLO_API_TOKEN`, `OPENAI_API_KEY`.
- Remaining automation setup: cron jobs being built with Ax, vault git sync cron, Obsidian vault sync to laptop.

**Model stack:**
- Primary: openai-codex/gpt-5.4
- Fallback chain (automatic, no approval): gpt-5.4-mini → qwen3:14b → gemma4:e4b → qwen2.5-coder:14b
- Paid external providers (OpenRouter, etc.): manual approval required each time — never automatic
- deepseek-r1:14b removed from fallbacks: no tool support (hard fail for agent mode)
- devstral:24b removed from fallbacks: OOM on this machine (needs 33 GiB, 31 GiB available)

**Model aliases:**
- `premium` → openai-codex/gpt-5.4
- `emergency` → openai-codex/gpt-5.4-mini
- `general` → ollama/qwen3:14b
- `fast` → ollama/gemma4:e4b
- `coding` → ollama/qwen2.5-coder:14b
- `embed` → ollama/nomic-embed-text

---

## Agent Org Structure

- **ClawBot** — Chief of Staff / Orchestrator
- **Vito** — Sales / CRM / Outreach / Pipeline
- **Oracle** — Research / Intelligence / Analysis
- **Tron** — Dev / Automation / Infrastructure
- **Belfort** — Markets / Capital / Risk
- **Harley** — Content / Growth / Monetization

---

## Decisions

- **Memory architecture:** File-based primary. pgvector parked until dataset justifies it.
- **Memory write authority:** ClawBot only. Specialists produce outputs; ClawBot extracts and writes durable facts.
- **Project context model:** Three layers — (A) MEMORY.md global context, (B) Obsidian project depth, (C) task-specific handoff packets.
- **System ownership:** MEMORY.md + Todoist + Calendar → ClawBot. CRM → Vito. Obsidian → Leo/Oracle/Tron. Code/infra → Tron. Content → Harley. Trading journal → Belfort.
- **Write authority:** ClawBot may write to workspace memory, Obsidian, and task system without per-action approval.
- **External actions:** Posting, emailing, messaging, creating accounts — explicit approval required every time.
- **Model spend governance:** Using paid external model providers (OpenRouter, etc.) = spending money = requires Leo's explicit approval per session. Automatic fallback chain is local-only after gpt-5.4-mini.
- **Capability model:** Shared read, owned write. Domain ownership determines judgment and write authority.
- **Operating cadence:** Morning Brief → day capture → Evening Review. Daily: ClawBot. 3x/week: Vito. Weekly: Oracle, Tron, Harley, Belfort.
- **Brief delivery:** Telegram + Obsidian daily note + Discord morning brief channel (`1492262253255200838`).
- **Data source priority:** Todoist → Google Calendar → Git → Email.
- **OpenClaw:** Swappable orchestrator. All durable value built as external services. Public repo = proof-of-work surface.
- **Revenue motion first:** Until BBS has paying clients, agent work supports revenue — not content, branding, or architecture.

---

## SUPERSEDED / ARCHIVED

- **TSA PreCheck** — expired 2026-04-08. Note closed.