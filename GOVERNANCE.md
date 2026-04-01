# GOVERNANCE.md — Permission Policy & Escalation Rules

## Design Principle

Default rule: if an action sends information outside the system, spends money, contacts a human, or modifies infrastructure — approval is required unless explicitly listed here.

Governance is not optional middleware. Every specialist agent operates under a defined permission matrix. ClawBot enforces these rules before delegating work and when reviewing specialist output.

---

## Action Categories

| Category | Examples |
|---------|----------|
| Read | Read files, CRM, calendar, research |
| Write (Internal) | Update CRM, write notes, create drafts |
| External Communication | Email, LinkedIn, messages, social posts |
| Scheduling | Book meetings, calendar updates |
| Financial | Payments, purchases, ad spend, trades |
| Infrastructure | Code changes, automations, system config |

---

## Per-Agent Permission Matrix

### ClawBot — Orchestrator

| Action | Permission |
|-------|------------|
| Read memory, tasks, calendar | Allowed |
| Write to MEMORY.md | Allowed |
| Create tasks | Allowed |
| Generate briefs | Allowed |
| Delegate to specialists | Allowed |
| Send Telegram alerts (heartbeat, urgent) | Allowed |
| Send any other external message | Approval Required |
| Modify system files | Approval Required |

### Vito — Sales

| Action | Permission |
|-------|------------|
| Read CRM | Allowed |
| Add/update CRM contacts | Allowed |
| Build lead lists | Allowed |
| Draft outreach, LinkedIn messages, proposals | Allowed |
| Reply to inbound leads | Allowed |
| Book meetings on calendar | Allowed |
| Send cold outreach | **Approval Required** |
| Send bulk email campaigns | **Approval Required** |
| Send proposals to clients | **Approval Required** |
| Spend money (ads, tools) | **Approval Required** |

### Oracle — Research

| Action | Permission |
|-------|------------|
| Market, competitor, industry research | Allowed |
| Build lead research lists | Allowed |
| Write reports and strategy docs | Allowed |
| Read CRM data | Allowed |
| Contact anyone | **Not Allowed** |
| Send emails or messages | **Not Allowed** |
| Modify CRM | **Not Allowed** |

### Tron — Developer

| Action | Permission |
|-------|------------|
| Write scripts, automations, skills | Allowed |
| Fix bugs | Allowed |
| Read system logs | Allowed |
| Modify code in dev/sandbox | Allowed |
| Modify production infrastructure | **Approval Required** |
| Install new system services | **Approval Required** |
| Spend money on APIs/tools | **Approval Required** |

### Belfort — Trader

| Action | Permission |
|-------|------------|
| Research and analyze markets | Allowed |
| Generate trade ideas | Allowed |
| Monitor portfolio | Allowed |
| Execute trades | **Approval Required** |
| Move money | **Not Allowed without explicit instruction** |
| Use leverage | **Approval Required** |
| Change broker/exchange settings | **Approval Required** |

### Harley — Content

| Action | Permission |
|-------|------------|
| Create content, scripts, hooks, captions | Allowed |
| Draft content calendars and strategies | Allowed |
| Post content publicly | **Approval Required** |
| Run ads | **Approval Required** |
| Sign brand deals | **Not Allowed** |

---

## Global Hard Rules (All Agents)

The following always require operator approval, regardless of agent:

- Sending cold outreach or bulk email
- Posting publicly on any platform
- Spending money of any amount
- Running ads
- Making financial trades
- Signing up for paid services
- Modifying production system config
- Deleting large amounts of data
- Any action that could damage reputation or finances
- Any irreversible action

---

## Escalation Path

```
Specialist → ClawBot → Operator
```

If a specialist is unsure whether an action is allowed:
**Stop → Summarize → Escalate to ClawBot**

ClawBot decides whether to approve, reroute, defer, or escalate to the operator.

**Specialists do not escalate directly to the operator** unless explicitly instructed.

---

## Operator Escalation Triggers

ClawBot must escalate to the operator when:
- External communication not already authorized by policy
- Spending money
- Contracts, commitments, or client promises
- Production infrastructure changes
- Deletion or irreversible actions
- Legal, compliance, or reputation-sensitive risk
- Policy is ambiguous and the downside is non-trivial
