# HEARTBEAT.md — Monitoring & Alert Doctrine

## Purpose

Heartbeat is ClawBot's monitoring and risk detection system.

Goal:
- High signal
- Low noise
- Alert only when action is required
- Surface risks before they become problems
- Keep [OPERATOR] informed of what actually matters

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
- Alert [OPERATOR] immediately

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
- If external commitment is overdue → Alert [OPERATOR]

---

### 2. Deadlines

Trigger:
- Deadline within 48 hours and task not complete
- Deadline missed

Action:
- Create/Update Todoist task
- Add to brief
- If external or revenue-critical → Alert [OPERATOR]

---

### 3. Neglected Tasks

Trigger:
- Overdue task with no update in 3+ days
- High-priority task idle for 7+ days

Action:
- Flag in brief under "Stalled / Needs Attention"
- Do NOT alert unless revenue-critical

---

### 4. Project Drift

Trigger:
- Active project with no progress in 14 days
- Milestone within 2 weeks with no recent activity

Action:
- Add to brief under "Project Drift"
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
- Add to brief under "Revenue Risk"
- If pipeline empty → Alert [OPERATOR]

---

### 6. System Health

Trigger:
- OpenClaw not running
- Primary model unavailable or failing
- Fallback chain activating
- Paid provider would be required as next fallback
- Cron job missed
- Integration failing repeatedly

Action:
- Attempt auto-retry once on the primary model
- If primary still failing → Alert [OPERATOR] immediately (use failover-notify script)
- If next fallback is a local/free model → continue automatically, include in next brief
- If next fallback is a paid provider (OpenRouter or other metered) → STOP, do not proceed, alert [OPERATOR] and request explicit approval before using
- Create task for the systems agent if fix required

**Model failover notification:**

| Situation | Action |
|---|---|
| Primary model down, local fallback next | Notify + continue |
| Primary model down, paid fallback next | Notify + STOP, wait for approval |
| All local fallbacks exhausted | Notify + STOP, wait for approval |

**Paid provider approval rule:** Any use of paid metered external providers requires explicit [OPERATOR] approval in that session. No silent paid failover. No exceptions.

---

### 7. Operational Failures

Trigger:
- Recurring job fails
- Automation produces no output
- Delivery fails (Telegram, Obsidian, etc.)

Action:
- Retry once
- If fails again → Task for systems agent
- Add to brief
- Alert [OPERATOR] only if blocking operations

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
- Add to brief under "Operations Drift"

---

## Alert Rules (Very Important)

Alert [OPERATOR] immediately only if:

- External commitment missed
- Revenue opportunity at risk
- Money involved
- Legal/compliance issue
- Reputation risk
- Production system down
- [OPERATOR] cannot operate normally
- Irreversible action taken or about to be taken

If [OPERATOR] cannot take action right now → Do NOT alert → Put in brief.

---

## Anti-Noise Rules

- Do not alert on the same issue twice in 24 hours
- Do not alert on low-priority tasks
- Do not alert on things already scheduled
- Do not alert on things [OPERATOR] already acknowledged
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
| Urgent | Alert [OPERATOR] |

Heartbeat does not do execution.
Heartbeat detects → ClawBot decides → System acts.

---

## Cron Constraints

Recurring jobs are constrained runs.

Rules:
- Default reasoning is LOW for routine cron jobs
- SUMMARY-style cron jobs may use MEDIUM if explicitly needed
- Cron jobs must not self-escalate to HIGH reasoning
- Load only the minimum context required
- Do not load MEMORY.md unless the job explicitly depends on it
- Do not widen scope or branch into adjacent work
- Maximum 1 retry for transient failure only
- Do not fall through to paid providers without [OPERATOR] approval
- If blocked by ambiguity or missing context: fail closed

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

High signal. Low noise. Actionable alerts only.
