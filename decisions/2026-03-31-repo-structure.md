# Decision: Public Repo Structure — 2026-03-31

## What Changed

The clawbot public repo was restructured from a flat set of synthesized documentation files into a structured reference mirror that promotes actual non-sensitive workspace files.

## Previous State

The repo contained six flat markdown files:
- `ARCHITECTURE.md`
- `AGENT_FLEET.md`
- `GOVERNANCE.md`
- `SKILLS.md`
- `MEMORY_PHILOSOPHY.md`
- `OPERATIONS.md`

These were useful but were synthesized summaries rather than the actual source files ClawBot and Ax read.

## New State

The repo now follows a structured layout:

```
clawbot/
├── governance/        — Promoted from real workspace files (sanitized)
│   ├── SOUL.md
│   ├── ROUTING.md
│   ├── PERMISSIONS.md
│   ├── AGENT_ROLES.md
│   ├── ORCHESTRATION.md
│   └── DELEGATION_TEMPLATE.md
├── docs/
│   ├── architecture.md
│   ├── memory-system.md
│   ├── morning-brief.md
│   ├── heartbeat.md
│   ├── todoist-structure.md
│   └── agent-fleet/
│       ├── vito.md
│       ├── oracle.md
│       ├── tron.md
│       ├── belfort.md
│       └── harley.md
├── examples/
│   ├── HEARTBEAT.example.md
│   ├── openclaw.example.json
│   └── MEMORY.example.md
├── decisions/
│   └── 2026-03-31-repo-structure.md   ← this file
├── README.md
├── SKILLS.md                           ← kept in root
└── .gitignore
```

## Three-Repo Model

This restructure clarified the separation between three repos:

| Repo | What it contains |
|------|-----------------|
| `agent-os` | Framework and product: portable spec, capability taxonomy, adapter contracts |
| `clawbot` (this repo) | Public operating doctrine and reference mirror: governance, agent definitions, operational philosophy |
| `clawbot-runtime` (private) | Actual live runtime: host-specific config, secrets, service definitions |

The `clawbot` public repo is the source-of-truth for doctrine. The `clawbot-runtime` private repo is the source-of-truth for the live instance.

## Why

**Principle:** The public repo should contain what Claude and Ax would actually want to read for reference, not rewritten summaries.

Promoted from real workspace files (sanitized):
- `governance/SOUL.md` ← `workspace/SOUL.md`
- `governance/ROUTING.md` ← `workspace/ROUTING.md`
- `governance/PERMISSIONS.md` ← `workspace/PERMISSIONS.md` + Belfort/Harley from GOVERNANCE.md
- `governance/AGENT_ROLES.md` ← `workspace/AGENT_ROLES.md` + Belfort/Harley
- `governance/ORCHESTRATION.md` ← `workspace/ORCHESTRATION.md`
- `governance/DELEGATION_TEMPLATE.md` ← `workspace/DELEGATION_TEMPLATE.md`
- `docs/heartbeat.md` ← `workspace/HEARTBEAT.md`
- `docs/memory-system.md` ← `MEMORY_PHILOSOPHY.md`
- `docs/agent-fleet/vito.md` ← `workspace-vito/SOUL.md`
- `docs/agent-fleet/oracle.md` ← `workspace-oracle/SOUL.md`
- `docs/agent-fleet/tron.md` ← `workspace-tron/SOUL.md`
- `docs/agent-fleet/belfort.md` ← `workspace-belfort/SOUL.md`
- `docs/agent-fleet/harley.md` ← `workspace-harley/SOUL.md`

Synthesized (no real source file exists):
- `docs/morning-brief.md`
- `docs/todoist-structure.md`
- `docs/architecture.md` (expanded from ARCHITECTURE.md)
- `examples/HEARTBEAT.example.md`
- `examples/MEMORY.example.md`
- `examples/openclaw.example.json`

Absorbed and deleted (content migrated):
- `ARCHITECTURE.md` → `docs/architecture.md`
- `AGENT_FLEET.md` → `docs/agent-fleet/*.md`
- `GOVERNANCE.md` → `governance/PERMISSIONS.md`
- `MEMORY_PHILOSOPHY.md` → `docs/memory-system.md`
- `OPERATIONS.md` → `governance/ORCHESTRATION.md`, `docs/morning-brief.md`, `docs/heartbeat.md`

## Sanitization Rules Applied

- No Telegram user IDs, handles, or bot tokens
- No IP addresses
- No email addresses
- No API keys or auth tokens
- No local filesystem paths (converted to `<runtime-path>/...` placeholders)
- No hostnames or machine identifiers
- Doctrine, routing logic, governance rules, and operational philosophy preserved
