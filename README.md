# ClawBot

**A live, self-hosted multi-agent operator stack running on OpenClaw.**

ClawBot is a personal AI chief-of-staff and operator system. It runs five specialized agents — ClawBot (orchestrator), Vito (sales), Oracle (research), Tron (developer), and a rotating cast of specialists — each with defined roles, permissions, and escalation paths. Real operations. Real governance. Not a demo.

---

## What Is This?

ClawBot is the running instance of a governed multi-agent system. It handles daily operations: task management, research, outreach, system development, and market analysis. The orchestrator (ClawBot) routes work to the right specialist based on intent, domain, and risk level — without the operator having to manage agent selection.

This repo documents the architecture, agent fleet, governance rules, and operational philosophy of a system that is actually running.

## Why Does It Exist?

Most AI "agent" projects are either demos or framework explorations. ClawBot is neither. It exists to run real operations for a single operator, 24/7, on a self-hosted Linux machine. The design priorities are:

- **Correctness over cleverness** — every action that touches an external system goes through a governance check
- **Operator trust is earned** — specialists cannot escalate directly to the operator; they route through the orchestrator
- **Continuity across sessions** — the workspace .md files are the persistent state; agents read them at startup
- **File memory over database memory** — intentional, durable, readable

## What Makes It Interesting?

- **Five-agent fleet** with distinct roles, capability boundaries, and escalation paths
- **Formal governance layer** — permission policy covers every action category from `pure_read` to `irreversible_mutation`
- **Routing doctrine** — ClawBot's ORCHESTRATION.md defines when to delegate vs. handle directly, how to package handoffs, and what the output review standard is
- **Skills as tools** — agents have access to a skill library covering CRM, outreach, research, dev tooling, crypto data, and more
- **File-based memory** — durable operational context persists in markdown files that survive runtime swaps and agent restarts
- **Built on OpenClaw** — a lightweight, self-hosted LLM gateway running locally with a fallback model chain

## Current State

Running in production on a self-hosted Ubuntu 24.04 machine. Five agents active. ClawBot handles daily ops; specialist agents are invoked by delegation. Governance, routing, and handoff standards are enforced at the orchestrator level.

The architecture is intentionally documented here rather than embedded only in runtime config — so the design is legible to anyone reading the code.

## How to Explore This Repo

```
clawbot/
├── README.md            # This file — what ClawBot is and why it exists
├── ARCHITECTURE.md      # System design, model stack, runtime overview
├── AGENT_FLEET.md       # Each agent: role, capabilities, boundaries
├── GOVERNANCE.md        # Permission policy, escalation rules, hard limits
├── SKILLS.md            # Skill library: tools each agent can use
├── MEMORY_PHILOSOPHY.md # Why file-based memory, how continuity works
└── OPERATIONS.md        # Routing doctrine, heartbeat, handoff standards
```

Start at `AGENT_FLEET.md` to understand who does what.
Then read `GOVERNANCE.md` to understand what requires approval.
Then read `OPERATIONS.md` for the orchestration doctrine.

The runtime config, secrets, and host-specific setup live in a private repo (`clawbot-runtime`).
