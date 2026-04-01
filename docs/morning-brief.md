# morning-brief.md — Morning Brief Doctrine

## Purpose

The morning brief is ClawBot's daily operational readout. It surfaces what is urgent, what is upcoming, and what risks are drifting — so the operator can start the day with a clear picture of where to focus.

It is delivered automatically via Telegram each morning and written to the Obsidian daily note.

The brief is a **read operation**, not a write operation. Nothing is stored as a result of running it. It synthesizes from existing systems.

---

## Sources

The brief pulls from:

1. **Todoist** — overdue tasks, tasks due today, high-priority items
2. **Google Calendar** — events today and in the next 24-48 hours
3. **MEMORY.md** — open loops, risks, and project priorities
4. **HEARTBEAT.md thresholds** — commitments, project drift, system health

---

## Structure

A good morning brief follows this order:

### 1. Today's Focus (Top 1-3 items)
The highest-leverage things to work on today. Derived from project priorities, deadlines, and open loops. Not a task list — a judgment call about what actually matters.

### 2. Urgent / Time-Sensitive
Items with hard deadlines today or tomorrow. Commitments due. External dependencies. Revenue-critical actions.

### 3. Calendar
Events today and any prep needed for tomorrow.

### 4. Open Loops Surfaced
Active risks or open loops from MEMORY.md that are approaching threshold. Not a full dump — only what has moved closer to requiring action.

### 5. One-Line System Status (optional)
If something in the system is degraded or abnormal, surface it. Otherwise, omit.

---

## Format Rules

- **Short by default.** If nothing is urgent, say so briefly.
- **Rank by importance**, not by date or alphabetical order.
- **No filler.** No "Good morning!" No trailing summaries.
- **Scannable.** Use headers and bullets. The operator reads this in 60 seconds.
- **No low-priority noise.** Backlog items with no due date don't belong in the brief.

---

## What NOT to Include

- Tasks with no due date and no urgency
- Research items with no near-term deadline
- Status updates on things the operator already knows about
- Anything that would have appeared in yesterday's brief unchanged

---

## Example Output Shape

```
**Morning Brief — [date]**

**Focus Today**
- [Top priority 1]
- [Top priority 2]

**Urgent**
- [Task A] — due today
- [External deadline B] — 48h window

**Calendar**
- [Event at time]

**Open Loops**
- [Risk X] — approaching threshold
```

---

## Delivery

- Channel: Telegram (primary)
- Also written to: Obsidian daily note (`01 Daily/YYYY-MM-DD.md`)
- Triggered: Scheduled cron job (morning window)
- Quiet periods: does not fire late at night unless something is genuinely urgent
