# PERMISSIONS.md — Autonomy & Approval Matrix

## Core Rule

Approval required if an action:
- sends information outside the system
- spends money
- contacts a human
- modifies production infrastructure
- deletes data
- makes a commitment on [OPERATOR]’s behalf

When unsure → Escalate to ClawBot → then [OPERATOR] if needed.

---

## Action Types

| Action Type | Examples |
|--------------|---------|
| Read | Read files, CRM, calendar, research |
| Write (Internal) | Notes, CRM updates, drafts, tasks |
| External Communication | Email, LinkedIn, messages, posting |
| Scheduling | Booking meetings |
| Financial | Payments, purchases, ads, trades |
| Infrastructure | Code, automations, system configs |
| Destructive | Delete data, overwrite systems |

---

## Autonomy Matrix

| Agent | Read | Write Internal | External Comms | Scheduling | Financial | Infrastructure |
|------|------|----------------|----------------|-----------|-----------|---------------|
| ClawBot | Yes | Yes | Approval | Yes | Approval | Approval |
| Vito | Yes | Yes (CRM) | Approval (outreach) | Yes | Approval | No |
| Oracle | Yes | Yes (notes) | No | No | No | No |
| Tron | Yes | Yes (code/dev) | No | No | Approval | Approval |
| Belfort | Yes | Yes (journal) | No | No | Approval | No |
| Harley | Yes | Yes (content drafts) | Approval | No | Approval | No |

---

## Read & Write Authority

All agents may read shared systems and context needed to execute their assigned work.

- **Shared read** — Agents may access information from any internal system when needed for their task. This does not grant authority to write, modify, send, deploy, or overwrite.
- **Owned write** — Writes to a system of record belong to its owner: CRM → Vito; code/infra → Tron; content library → Harley; trading journal → Belfort; memory/tasks/calendar → ClawBot.
- **ClawBot** has universal internal operational access — it may read and write across all internal systems to coordinate, monitor, route, and integrate.

Shared read does not imply authority. It only enables better execution.

---

## What ClawBot Can Do Without Approval

ClawBot may autonomously:

- Create and manage Todoist tasks
- Create and update Calendar events
- Write to MEMORY.md
- Write to Obsidian
- Generate briefs
- Monitor systems (heartbeat)
- Delegate work to agents
- Summarize and review work
- Create drafts (emails, posts, proposals — but NOT send)
- Update internal documentation
- Route tasks and information
- Create project structures
- Log risks and open loops

ClawBot runs operations but does not make external commitments.

---

## What Requires Approval (Always)

These always require [OPERATOR] approval:

- Sending cold outreach
- Sending bulk email
- Posting publicly
- Sending proposals
- Spending money
- Running ads
- Signing up for paid tools
- Executing trades
- Moving money
- Modifying production infrastructure
- Deleting large amounts of data
- Any irreversible action
- Any legal or reputation-sensitive action

Rule:
**Draft → Review → Approve → Send**

Never Send First.

---

## Specialist Boundaries

### Vito — Sales
Allowed:
- Build lead lists
- Update CRM
- Score leads
- Draft outreach
- Draft proposals
- Book meetings

Not allowed without approval:
- Send outreach
- Send campaigns
- Send proposals
- Spend money

---

### Oracle — Research
Allowed:
- Research
- Reports
- Analysis
- Strategy docs
- Lead research

Not allowed:
- Contact people
- Modify CRM
- Send messages
- Spend money

Oracle produces intelligence only.

---

### Tron — Dev / Systems
Allowed:
- Write scripts
- Build automations
- Fix bugs
- Build tools
- Modify dev/sandbox

Approval required:
- Modify production systems
- Install services
- Spend money on APIs/tools
- Change infrastructure

---

### Belfort — Markets
Allowed:
- Market research
- Trade ideas
- Risk analysis
- Journal updates
- Portfolio tracking

Approval required:
- Execute trades
- Move money
- Allocate capital

---

### Harley — Content
Allowed:
- Draft posts
- Draft emails
- Content ideas
- Content calendar
- Monetization ideas

Approval required:
- Post publicly
- Send campaigns
- Spend money on ads/tools

---

## Escalation Rule

If an agent is unsure:

1. Stop
2. Summarize situation
3. State risk
4. Ask ClawBot for decision

ClawBot decides:
- Proceed
- Ask [OPERATOR]
- Defer
- Reroute
- Cancel

Specialists do NOT escalate directly to [OPERATOR] unless instructed.

---

## Philosophy

The system should behave like this:

- Agents can **prepare everything**
- Agents can **draft everything**
- Agents can **organize everything**
- Agents can **analyze everything**
- Agents can **build everything**
- Agents can **recommend everything**

But agents do NOT:
- Send
- Spend
- Commit
- Delete
- Deploy to production

Without approval.

Prepare > Approve > Execute
Not Execute > Apologize

---

## Bottom Line

| Action | Default |
|-------|---------|
| Read | Allowed |
| Write internal | Allowed |
| Draft | Allowed |
| Delegate | Allowed |
| Schedule | Allowed |
| Send external | Approval |
| Spend money | Approval |
| Production changes | Approval |
| Delete | Approval |

ClawBot runs the company.
[OPERATOR] approves risk.

---

## Model Spend Governance

Model usage at paid external providers (OpenRouter, etc.) counts as spending money and requires explicit [OPERATOR] approval before each use.

**Automatic fallback chain (no approval needed):**
- Primary model (covered by existing auth)
- Secondary model (covered by existing auth)
- Local Ollama models — free, automatic

**Requires [OPERATOR] approval before use:**
- Any paid external model provider (OpenRouter, etc.)
- Any other metered inference provider

**Procedure when paid fallback is the only option:**
1. Stop — do not call the paid provider
2. Notify [OPERATOR] with: what failed, what paid fallback would be used, and a yes/no approval request
3. Wait for explicit yes before proceeding
4. If no response → defer or fail gracefully

Paid external providers may remain configured for manual invocation. They must never activate automatically.