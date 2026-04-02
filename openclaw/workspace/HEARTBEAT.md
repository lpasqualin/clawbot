# HEARTBEAT.md — Monitoring & Alert Doctrine

## Purpose

Heartbeat is ClawBot’s monitoring and risk detection system.

Goal:
- High signal
- Low noise
- Alert only when action is required
- Surface risks before they become problems
- Keep Leo informed of what actually matters

ClawBot is responsible for monitoring, interpreting, and escalating.

---

## Heartbeat Responsibilities

Heartbeat monitors:

1. Commitments
2. Deadlines
3. Neglected tasks
4. Project drift
5. Revenue pipeline health
6. System health
7. Operational failures
8. Recurring agent jobs

When something triggers, ClawBot must decide:
- Ignore
- Add to brief
- Create task
- Update memory
- Alert Leo immediately

Heartbeat is not just monitoring — it is decision + escalation.

---

## Trigger → Action Rules

### 1. Commitments

Trigger:
- Commitment due within 72 hours with no recent update
- Commitment overdue
- Waiting on someone and they are overdue

Action:
- Create/Update Todoist task
- Add to next brief
- If external commitment is overdue → Alert Leo

---

### 2. Deadlines

Trigger:
- Deadline within 48 hours and task not complete
- Deadline missed

Action:
- Create/Update Todoist task
- Add to brief
- If external or revenue-critical → Alert Leo

---

### 3. Neglected Tasks

Trigger:
- Overdue task with no update in 3+ days
- High-priority task idle for 7+ days

Action:
- Flag in brief under “Stalled / Needs Attention”
- Do NOT alert unless revenue-critical

---

### 4. Project Drift

Trigger:
- Active project with no progress in 14 days
- Milestone within 2 weeks with no recent activity

Action:
- Add to brief under “Project Drift”
- Suggest next step
- Create task if none exists

---

### 5. Revenue Pipeline Health

Trigger:
- No new leads added in 7 days
- No outreach activity in 7 days
- No active deals in pipeline
- Proposal sent but no follow-up scheduled

Action:
- Create Todoist task for Vito / Sales
- Add to brief under “Revenue Risk”
- If pipeline empty → Alert Leo

---

### 6. System Health

Trigger:
- OpenClaw not running
- Primary model unavailable
- Cron job missed
- Integration failing repeatedly

Action:
- Attempt auto-retry once
- If still failing → Alert Leo
- Create task for Tron if fix required

---

### 7. Operational Failures

Trigger:
- Recurring job fails
- Automation produces no output
- Delivery fails (Telegram, Obsidian, etc.)

Action:
- Retry once
- If fails again → Task for Tron
- Add to brief
- Alert Leo only if blocking operations

---

### 8. Recurring Agent Jobs

Trigger:
- Agent job not run on schedule
- Agent reports repeated blocker
- Work stuck between agents
- CRM not updated
- Research brief not produced
- Automation review not produced

Action:
- Create task for responsible agent
- Add to brief under “Operations Drift”

---

## Alert Rules (Very Important)

Alert Leo immediately only if:

- External commitment missed
- Revenue opportunity at risk
- Money involved
- Legal/compliance issue
- Reputation risk
- Production system down
- Leo cannot operate normally
- Irreversible action taken or about to be taken

If Leo cannot take action right now → Do NOT alert → Put in brief.

---

## Anti-Noise Rules

- Do not alert on the same issue twice in 24 hours
- Do not alert on low-priority tasks
- Do not alert on things already scheduled
- Do not alert on things Leo already acknowledged
- Batch low-urgency items into daily brief
- Every alert must include a recommended action

Bad alert:
"Task overdue."

Good alert:
"Proposal follow-up overdue by 3 days. Recommend sending follow-up email today."

---

## Heartbeat Output Types

Heartbeat can produce only these outputs:

| Situation | Action |
|----------|-------|
| Small issue | Add to brief |
| Task needed | Create Todoist task |
| Durable risk | Update MEMORY.md |
| Needs execution | Delegate to agent |
| Urgent | Alert Leo |

Heartbeat does not do execution.
Heartbeat detects → ClawBot decides → System acts.

---

## Philosophy

Heartbeat exists to prevent:
- Missed deadlines
- Lost deals
- Forgotten commitments
- Project drift
- System failures
- Revenue drought
- Silent failures

Heartbeat is the early warning system for Leo OS.

High signal. Low noise. Actionable alerts only.