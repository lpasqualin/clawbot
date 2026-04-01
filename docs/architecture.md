# architecture.md — ClawBot System Design

## Overview

ClawBot runs on OpenClaw, a self-hosted LLM gateway. The system consists of a primary orchestrator agent (ClawBot) and five specialist agents, each with a dedicated workspace, skill set, and identity files. All agents are configured via markdown-based workspace files that define identity, behavior, tools, and memory rules.

The entire stack runs on a single self-hosted Linux machine. No cloud services are required for operation; cloud APIs (OpenAI, Anthropic, OpenRouter) are used for model inference only. All inference can fall back to locally running Ollama models with zero external connectivity.

---

## Runtime

**Gateway:** OpenClaw (self-hosted)
- Manages agent sessions, tool dispatch, channel I/O, and scheduling
- Runs as a background systemd service on the local machine
- Exposes a WebSocket gateway for agent communication
- Provides built-in agent directories, routing hooks, and dispatch mechanics

---

## Model Stack

Primary model with a deterministic fallback chain:

| Priority | Model |
|----------|-------|
| 1 (primary) | GPT-5.4 via OpenAI Codex |
| 2 | Claude Sonnet 4.6 via OpenRouter |
| 3 | Gemini 3.1 Pro via OpenRouter |
| 4 | GPT-5.4-mini via OpenAI Codex |
| 5 | DeepSeek V3 via OpenRouter |
| 6 | qwen3.5:9b (Ollama) |
| 7 | qwen3:8b (Ollama) |
| 8 | gemma3:12b (Ollama) |
| 9 | qwen3:4b (Ollama) |
| 10 | gemma3:4b (Ollama) |
| 11 | qwen3.5:0.8b (Ollama) |

Ollama models serve as the final failover tier — the system remains operational with no external connectivity.

---

## Agent Layout

```
ClawBot (Orchestrator / Chief of Staff)
├── Vito        — Sales & Revenue
├── Oracle      — Research & Intelligence
├── Tron        — Developer / Automation / Systems
├── Belfort     — Trader / Capital Allocator
└── Harley      — Content & Monetization
```

ClawBot is the front door. All operator requests enter through ClawBot. ClawBot decides whether to handle directly or delegate to a specialist. See `governance/ORCHESTRATION.md` for the full delegation doctrine.

---

## Agent Workspaces

Each agent has an isolated workspace directory containing:

```
workspace-<agent>/
├── SOUL.md        # Role definition, behavioral rules, decision doctrine
├── USER.md        # Operator context — who the agent is serving and how
├── AGENTS.md      # Session bootstrap instructions
├── TOOLS.md       # Tool access and skill configuration
├── HEARTBEAT.md   # Proactive monitoring checklist (optional)
├── memory/        # Session logs and durable context
└── skills/        # Agent-specific skill overrides
```

The main ClawBot orchestrator workspace additionally contains:
- `ROUTING.md` — intent classification and system-of-record routing
- `PERMISSIONS.md` — per-agent permission policy
- `AGENT_ROLES.md` — specialist role boundaries
- `HANDOFF.md` — inter-agent handoff contract
- `ORCHESTRATION.md` — delegation doctrine and routing decision model
- `SYSTEMS.md` — system-of-record definitions (tasks, calendar, memory, files)
- `MEMORY.md` — curated long-term memory index

The public versions of these governance files live in `governance/` in this repo.

---

## Channel

Primary operator interface: Telegram bot
- Operator sends requests; ClawBot responds
- Heartbeat alerts delivered via Telegram
- DM policy: per-channel-peer

---

## Memory Architecture

See `docs/memory-system.md` for the full design. Short version:

- File-based, not database-backed (by design)
- Session logs written to `memory/YYYY-MM-DD.md`
- Curated long-term memory maintained in `MEMORY.md`
- Each agent manages its own memory; the orchestrator maintains the master index
- Memory survives runtime restarts, model swaps, and session resets

Three layers per agent:
1. `SOUL.md` — identity and doctrine (read every session)
2. `MEMORY.md` — curated long-term facts (read in main sessions)
3. `memory/YYYY-MM-DD.md` — recent session logs (read at startup)

---

## Skills

Agents have access to a shared skill library plus agent-specific overrides. Skills are markdown-defined tool packages that provide the agent with instructions, schemas, and prompts for a specific capability (CRM, outreach, web search, dev tooling, etc.).

Skills load from:
- Shared workspace library (main ClawBot workspace)
- Agent-specific overrides (`workspace-<agent>/skills/<name>/SKILL.md`)

See `SKILLS.md` for the full list.

---

## Scheduling

Cron-style jobs run on OpenClaw's scheduler. Typical scheduled operations:
- Heartbeat checks (inbox, calendar, risks)
- Task triage runs
- Morning briefs
- Proactive monitoring cycles

---

## Systems of Record

| Information type | System |
|---|---|
| Tasks and action items | Todoist |
| Events and time commitments | Google Calendar |
| Durable facts and decisions | MEMORY.md |
| Long-form knowledge and plans | Obsidian |
| Temporary work and drafts | Workspace |

Each piece of information has exactly one system of record. See `governance/ROUTING.md` for the full routing doctrine.

---

## Relationship to Agent OS

ClawBot is the first agent defined against the [Agent OS](https://github.com/lpasqualin/agent-os) chassis. The architectural constitution, capability taxonomy, and adapter contract design in Agent OS were developed partly to formalize what ClawBot's runtime already required. ClawBot is the proof-of-concept for the portable spec model.

- **Agent OS** — the framework/product: portable spec, capability taxonomy, adapter contracts
- **clawbot** (this repo) — public operating doctrine and reference mirror: governance files, agent definitions, operational philosophy
- **clawbot-runtime** (private) — the actual live runtime: host-specific config, secrets, service definitions

The `clawbot-runtime` private repo contains the host-specific OpenClaw configuration, secrets management, and service definitions that are not suitable for public documentation.
