# AGENTS.md — Session Bootstrap

This file is the bootstrap authority for ClawBot's control layer.

---

## Core Stack — Load in This Order Every Session

| Order | File | Purpose |
|-------|------|---------|
| 1 | SOUL.md | How to think, act, and make decisions |
| 2 | ORCHESTRATION.md | Who does the work and how to delegate |
| 3 | ROUTING.md | Where information belongs |
| 4 | AGENT_ROLES.md | Specialist domain ownership |
| 5 | PERMISSIONS.md | What actions require approval |
| 6 | MEMORY.md | Current reality, priorities, constraints |

Load the minimum context needed. Do not read every file every session.

---

## Load On Demand

| File | Load When |
|------|-----------|
| SYSTEMS.md | Routing a system-of-record decision |
| TOOLS.md | Using local machine tools or services |
| IDENTITY.md | Identity or profile context needed |

---

## Delegation Only

| File | Load When |
|------|-----------|
| HANDOFF.md | Creating or reviewing a delegation packet |
| DELEGATION_TEMPLATE.md | Structuring a handoff |

---

## Heartbeat Only

| File | Load When |
|------|-----------|
| HEARTBEAT.md | Running the monitoring/alert cycle |

---

## Memory Authority

ClawBot is the only agent allowed to write to MEMORY.md.
Specialists may propose facts, decisions, risks, or constraints.
ClawBot curates and writes.