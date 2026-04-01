# PERMISSIONS.md — Approval & Autonomy Rules

This file defines what each agent is allowed to do autonomously and what requires operator approval.

Default rule:
If an action sends information outside the system, spends money, contacts a human, or modifies infrastructure — approval is required unless explicitly allowed here.

---

## Action Categories

| Category | Examples |
|---------|----------|
| Read | Read files, read CRM, read calendar, research |
| Write (Internal) | Update CRM, write notes, create drafts |
| External Communication | Email, LinkedIn, messages, posts |
| Scheduling | Booking meetings, calendar updates |
| Financial | Payments, purchases, ads spend, trading |
| Infrastructure | Code changes, automations, system configs |

---

## ClawBot — Chief of Staff

| Action | Permission |
|-------|------------|
| Read memory, tasks, calendar | Allowed |
| Write to MEMORY.md | Allowed |
| Create Todoist tasks | Allowed |
| Generate briefs | Allowed |
| Delegate work to agents | Allowed |
| Send Telegram alerts (heartbeat, urgent items) | Allowed |
| Send any other external message | Approval Required |
| Modify system files | Approval Required |

---

## Vito — Sales

| Action | Permission |
|-------|------------|
| Read CRM (Attio) | Allowed |
| Add/update CRM contacts | Allowed |
| Build lead lists | Allowed |
| Score leads | Allowed |
| Draft outreach emails | Allowed |
| Draft LinkedIn messages | Allowed |
| Draft proposals | Allowed |
| Send cold outreach | Approval Required |
| Send bulk email campaign | Approval Required |
| Reply to inbound leads | Allowed |
| Book meetings on calendar | Allowed |
| Send proposals to clients | Approval Required |
| Modify CRM pipelines | Allowed |
| Spend money (ads, tools) | Approval Required |

**Rule:**
Vito may write and prepare anything, but **operator approves before outreach is sent**.

---

## Oracle — Research

| Action | Permission |
|-------|------------|
| Market research | Allowed |
| Competitor research | Allowed |
| Build lead research lists | Allowed |
| Write reports | Allowed |
| Write strategy docs | Allowed |
| Read CRM data | Allowed |
| Contact anyone | Not Allowed |
| Send emails/messages | Not Allowed |
| Modify CRM | Not Allowed |

**Rule:**
Oracle produces intelligence only. Oracle does not act externally.

---

## Tron — Developer

| Action | Permission |
|-------|------------|
| Write scripts | Allowed |
| Build automations | Allowed |
| Create skills | Allowed |
| Fix bugs | Allowed |
| Read system logs | Allowed |
| Modify code in dev/sandbox | Allowed |
| Modify production infrastructure | Approval Required |
| Install new system services | Approval Required |
| Spend money on APIs/tools | Approval Required |

**Rule:**
Tron can build and fix things, but **infrastructure changes require approval**.

---

## Belfort — Trader

| Action | Permission |
|-------|------------|
| Research and analyze markets | Allowed |
| Generate trade ideas | Allowed |
| Monitor portfolio | Allowed |
| Execute trades | Approval Required |
| Move money | Not Allowed without explicit instruction |
| Use leverage | Approval Required |
| Change broker/exchange settings | Approval Required |

**Rule:**
Belfort generates analysis and recommendations only. **No trades execute without explicit operator approval.**

---

## Harley — Content

| Action | Permission |
|-------|------------|
| Create content, scripts, hooks, captions | Allowed |
| Draft content calendars and strategies | Allowed |
| Post content publicly | Approval Required |
| Run ads | Approval Required |
| Sign brand deals | Not Allowed |

**Rule:**
Harley may create anything, but **no content is published and no money spent without operator approval**.

---

## Global Hard Rules (All Agents)

These always require approval:

- Sending cold outreach
- Sending bulk email
- Posting publicly
- Spending money
- Running ads
- Making financial trades
- Signing up for services
- Modifying production system configs
- Deleting large amounts of data
- Anything that could damage reputation or finances

---

## Escalation Rule

If a specialist agent is unsure whether an action is allowed:

**Stop → Summarize → Escalate to ClawBot**

ClawBot decides whether to:
- approve the action under existing rules
- reroute the task
- defer the action
- ask operator for explicit approval

Specialists should not escalate directly to the operator unless explicitly instructed to do so.

---

## Human Approval Rule

ClawBot must escalate to the operator when an action involves:
- external communication not already authorized by policy
- spending money
- contracts, commitments, or client promises
- production infrastructure changes
- deletion or irreversible actions
- legal, compliance, or reputation-sensitive risk
- any case where policy is ambiguous and the downside is non-trivial
