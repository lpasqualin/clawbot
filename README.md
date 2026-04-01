# ClawBot

**A live, self-hosted multi-agent operator stack running on OpenClaw.**

ClawBot is a personal AI chief-of-staff and operator system. It runs six specialized agents — ClawBot (orchestrator), Vito (sales), Oracle (research), Tron (developer), Belfort (trader), and Harley (content) — each with defined roles, permissions, and escalation paths. Real operations. Real governance. Not a demo.

---

## What Is This?

ClawBot is the running instance of a governed multi-agent system. It handles daily operations: task management, research, outreach, system development, market analysis, and content strategy. The orchestrator (ClawBot) routes work to the right specialist based on intent, domain, and risk level — without the operator having to manage agent selection.

This repo is the **public reference mirror** for ClawBot's non-sensitive operating system: the actual governance files, agent definitions, and operational doctrine that the system runs on — sanitized for public sharing.

## Why Does It Exist?

Most AI "agent" projects are either demos or framework explorations. ClawBot is neither. It exists to run real operations for a single operator, 24/7, on a self-hosted Linux machine. The design priorities are:

- **Correctness over cleverness** — every action that touches an external system goes through a governance check
- **Operator trust is earned** — specialists cannot escalate directly to the operator; they route through the orchestrator
- **Continuity across sessions** — the workspace .md files are the persistent state; agents read them at startup
- **File memory over database memory** — intentional, durable, readable

## What Makes It Interesting?

- **Six-agent fleet** with distinct roles, capability boundaries, and escalation paths
- **Formal governance layer** — permission policy covers every action category; enforced by the orchestrator
- **Routing doctrine** — ORCHESTRATION.md defines when to delegate vs. handle directly, how to package handoffs, and what the output review standard is
- **Skills as tools** — agents have access to a skill library covering CRM, outreach, research, dev tooling, crypto data, and more
- **File-based memory** — durable operational context persists in markdown files that survive runtime swaps and agent restarts
- **Built on OpenClaw** — a lightweight, self-hosted LLM gateway running locally with a deterministic fallback model chain

## How to Explore This Repo

```
clawbot/
├── governance/                  # The actual operational doctrine files
│   ├── SOUL.md                  # ClawBot's identity and core principles
│   ├── ORCHESTRATION.md         # Full delegation and routing doctrine
│   ├── ROUTING.md               # Intent classification and system-of-record routing
│   ├── PERMISSIONS.md           # Per-agent permission matrix and approval rules
│   ├── AGENT_ROLES.md           # Role boundaries for each specialist
│   └── DELEGATION_TEMPLATE.md   # Standard handoff format
│
├── docs/
│   ├── architecture.md          # System design, model stack, runtime overview
│   ├── memory-system.md         # Why file-based memory, how continuity works
│   ├── morning-brief.md         # Morning brief doctrine and format
│   ├── heartbeat.md             # Monitoring thresholds and alert rules
│   ├── todoist-structure.md     # Task system routing and anti-patterns
│   └── agent-fleet/             # Each agent's identity and operational definition
│       ├── vito.md              # Sales & Revenue
│       ├── oracle.md            # Research & Intelligence
│       ├── tron.md              # Developer / Automation / Systems
│       ├── belfort.md           # Trader / Capital Allocator
│       └── harley.md            # Content & Monetization
│
├── examples/
│   ├── openclaw.example.json    # Sanitized config shape for OpenClaw
│   ├── MEMORY.example.md        # MEMORY.md format template
│   └── HEARTBEAT.example.md     # Example heartbeat output
│
├── decisions/
│   └── 2026-03-31-repo-structure.md  # Why this repo is structured as it is
│
├── SKILLS.md                    # Skill library by agent
└── .gitignore
```

**Where to start:**
- Start at `governance/SOUL.md` to understand what ClawBot is at the core.
- Read `governance/ORCHESTRATION.md` for the routing and delegation doctrine.
- Read `governance/PERMISSIONS.md` to understand what requires approval.
- Read `docs/agent-fleet/` to understand who does what.

## Three-Repo Model

| Repo | What it contains |
|------|-----------------|
| `agent-os` | Framework/product: portable spec, capability taxonomy, adapter contracts |
| `clawbot` (this repo) | Public doctrine mirror: governance, agent definitions, operational philosophy |
| `clawbot-runtime` (private) | Live runtime: host config, secrets, service definitions |

The `clawbot-runtime` private repo contains the host-specific OpenClaw configuration, secrets management, and service definitions that are not suitable for public documentation.

## Current State

Running in production on a self-hosted Ubuntu machine. Six agents active. ClawBot handles daily ops; specialist agents are invoked by delegation. Governance, routing, and handoff standards are enforced at the orchestrator level.

The architecture is intentionally documented here rather than embedded only in runtime config — so the design is legible to anyone reading the code.
