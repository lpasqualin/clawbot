# todoist-structure.md — Task System Doctrine

_Derived from workspace/SYSTEMS.md and governance/ROUTING.md_

## Purpose

Todoist is the system of record for all tasks and action items. This file explains when to use Todoist, how tasks should be structured, and what does not belong there.

---

## When to Use Todoist

Use Todoist for:
- Tasks Leo must do — anything with a clear action
- Follow-ups and reminders
- Delegated items to track
- Action items with or without due dates
- Anything Leo said "remind me to" or "don't let me forget"

Do not use Todoist for:
- Events with a specific time (→ Google Calendar)
- Durable facts or decisions (→ MEMORY.md)
- Long-form plans or strategies (→ Obsidian)
- Reference material

---

## Task Classification

When something comes in, the first question is: **does this require action?**

If yes → Todoist.
If it's time-bound → also Calendar.
If it's a fact or decision → MEMORY.md only, not Todoist.

---

## Routing Examples

| What Leo says | Where it goes |
|---|---|
| "Remind me to follow up with the client" | Todoist task with due date |
| "Don't let me forget to renew X" | Todoist task with due date |
| "Call with client Friday at 2pm" | Calendar event + Todoist task only if prep work needed |
| "We decided to focus on BBS first" | MEMORY.md (decision) — NOT Todoist |
| "Write a plan for outreach" | Obsidian note — NOT Todoist (the plan is the deliverable) |
| "I'm worried about the deadline slipping" | MEMORY.md open loops — surface in brief |

---

## Priority and Due Dates

- Tasks with hard deadlines get explicit due dates.
- Tasks without a hard deadline should still have an expected completion horizon if possible.
- High-priority tasks are those tied to revenue, external commitments, or project momentum.
- Low-priority backlog items do not belong in the daily brief unless they are overdue.

---

## Integration with ClawBot

ClawBot reads Todoist to:
- Generate the morning brief (overdue + due today)
- Surface neglected high-priority items in heartbeat checks
- Identify what to focus on when the operator asks "what should I be working on?"

ClawBot can create tasks in Todoist autonomously. It cannot mark tasks complete or delete tasks without instruction.

---

## Anti-Patterns

- **Do not duplicate tasks across Todoist and MEMORY.md.** Todoist is for tasks. MEMORY.md is for facts.
- **Do not create tasks for things that are actually documents or plans.** A plan is not a task.
- **Do not create tasks for risks without a concrete action.** Risks belong in MEMORY.md open loops.
- **Do not pad the brief with backlog items.** Only surface tasks that are relevant right now.
