# heartbeat.md — Monitoring Doctrine

_Source: workspace/HEARTBEAT.md_

## Purpose

This file defines what ClawBot monitors, what warrants alerting the operator, and
what should be ignored. The goal is high signal and low noise. Alerts should
feel important when they arrive — not routine, not exhausting.

---

## What ClawBot Monitors

### Commitments
Things the operator has promised to deliver, or is waiting on from others.

Alert when:
- A commitment to an external party has no recent update and is within 72 hours
- A commitment is past due with no completion or deferral recorded
- Something the operator is waiting on is overdue from the other party

Ignore:
- Internal commitments already noted as in-progress
- Items explicitly deferred or snoozed

### Deadlines
Hard dates attached to tasks, deliverables, or events.

Alert when:
- A hard deadline is within 48 hours and the task is not marked complete
- A deadline passes without completion or explicit deferral
- A deadline is approaching for a revenue-critical or external-facing item

Ignore:
- Soft deadlines on low-priority items with no dependencies
- Recurring deadlines that are consistently handled without intervention

### Neglected Tasks
Tasks that exist but are not being touched.

Alert when:
- An overdue task has had no update in 3+ days
- A high-priority task has been idle for 7+ days
- An open loop from a prior session has no resolution after 5 days

Ignore:
- Tasks explicitly deferred or moved to a future date
- Low-priority backlog items with no due date

### Project Drift
Active projects showing no forward motion.

Alert when:
- A project identified as active shows no recorded progress in 14 days
- A project has open tasks but none have been touched in 10+ days
- A deadline or milestone on an active project is within 2 weeks with no recent activity

Ignore:
- Projects explicitly parked or deprioritized
- Projects in a known waiting state (e.g., waiting on external input)

### System Health
ClawBot's own infrastructure.

Alert when:
- The gateway fails to start or crashes
- The primary model is unavailable and the fallback chain is active
- A scheduled cron job has not run within its expected window
- An integration the operator depends on is returning repeated errors

Ignore:
- Transient failures that auto-recover within one retry cycle
- Non-critical service degradation that does not affect operator workflows

### Operational Failures
Failures in automated workflows or output pipelines.

Alert when:
- A cron job fails or produces no output when output is expected
- A skill or integration fails on 2+ consecutive attempts
- Delivery to an output channel fails

Ignore:
- Single transient errors that resolve without intervention
- Failures in optional or experimental workflows

---

## Alert Thresholds Summary

| Category | Alert trigger | Silence rule |
|---|---|---|
| Commitments | 72h to due, or overdue | Explicitly deferred |
| Deadlines | 48h to due, or past due | Low priority + no dependencies |
| Neglected tasks | 3 days overdue with no update | Deferred or snoozed |
| Project drift | 14 days no activity | Parked or waiting state |
| System health | Startup failure, model down, cron missed | Auto-recovered |
| Operational failures | 2+ consecutive failures | Single transient error |

---

## Anti-Noise Rules

- Do not re-alert on the same item within 24 hours unless status has changed.
- Do not surface low-priority items unless they are severely overdue (7+ days).
- Do not send alerts that have no implied action. If the operator cannot do anything
  about it right now, it is not an alert — it is noise.
- Batch low-urgency observations into the daily brief rather than sending
  them as standalone alerts.
- Never alert on events that resolved before the alert would be sent.

---

## Escalation

Escalate immediately — do not wait for the next brief — when:

- A commitment to an external party is missed with no communication sent
- A revenue-critical deadline passes without completion
- A ClawBot infrastructure failure blocks the operator's ability to receive briefings
  or send messages
- An irreversible action was taken or is about to be taken without confirmation

Escalation means: send a message immediately, state the issue clearly, and
propose one concrete next action.

---

## What Counts as Important Enough to Alert

A useful test: would the operator, seeing this alert, feel it was worth the interruption?
If the answer is "probably not," batch it or drop it.

Alert-worthy:
- Time-sensitive — the window to act is closing
- Externally visible — someone else is affected
- Revenue-relevant — money, opportunity, or client relationship at stake
- Infrastructure-blocking — the operator cannot operate without this working

Batch or skip:
- Informational with no required action
- Already known and in-progress
- Recoverable with no urgency

---

_Update this file when monitoring priorities change — not when tools change._
