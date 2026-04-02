# ROUTING.md — Intent Routing Decision Tree

## Core Rule

Do not choose a tool first.
Determine intent first, then route to the system of record.

All routing decisions follow this order:
1. Identify intent
2. Identify system of record
3. Then choose tool
4. Then choose agent (if needed)

ClawBot owns routing decisions.

---

## Intent → System Decision Tree

When Leo says something, classify it:

Leo says something →
    Is Leo asking to DO something?
        → Task → Todoist

    Is Leo talking about something happening at a specific time?
        → Event → Calendar

    Is Leo stating a decision, rule, preference, constraint, or fact?
        → Durable Memory → MEMORY.md

    Is Leo asking to write, plan, document, research, or think deeply?
        → Long-form → Obsidian

    Is Leo asking to generate, export, or create a file?
        → Artifact → Workspace

    Is Leo asking for status, priorities, or what to work on?
        → Brief / Status → Read systems, do not store

    Is Leo identifying a risk, drift, or something to monitor?
        → Risk → MEMORY.md (Open Loops) + HEARTBEAT monitoring

    Is Leo asking to contact or message someone?
        → Communication → Draft → Approval → Send

If unclear → Ask:
"Is this a task, a note, a decision, or a document?"

---

## System of Record Rules

| Type | System |
|------|-------|
| Task | Todoist |
| Event | Calendar |
| Durable fact/decision | MEMORY.md |
| Long-form knowledge | Obsidian |
| Temporary file | Workspace |
| CRM data | CRM (Attio) |
| Code / scripts | Codebase |
| Trading records | Trading journal |
| Content assets | Content library |

Never store the same thing in multiple systems unless there is a clear reason.

---

## Task vs Event Rule

If it has a specific time → Calendar  
If it is something to do → Todoist  
If it has a time AND requires work → Calendar + Todoist

Example:
Meeting Friday at 2 → Calendar
Prepare slides for meeting → Todoist

---

## Memory Rule

Only write to MEMORY.md when:
- A decision is made
- A priority changes
- A rule is established
- A constraint appears
- A risk appears
- A deadline must not be forgotten
- A system or workflow changes

Do NOT write:
- Tasks
- Notes
- Research
- Drafts
- Plans

ClawBot writes memory. Specialists do not.

---

## Agent Routing Rule

After routing to a system, decide who executes:

| Type of Work | Owner |
|---------------|------|
| Coordination / planning | ClawBot |
| CRM / outreach / leads | Vito |
| Research / analysis | Oracle |
| Code / automation | Tron |
| Markets / portfolio | Belfort |
| Content / growth | Harley |

ClawBot decides. Specialists execute.

---

## Anti-Confusion Rules

Do NOT:
- Store tasks in MEMORY.md
- Store decisions in Todoist
- Store plans in Workspace
- Store research in MEMORY.md
- Create Calendar events for tasks without a time
- Duplicate the same information across systems
- Let specialists choose systems of record
- Let specialists write to MEMORY.md

When in doubt:
Classify → Route → Then act.

Routing mistakes create system chaos.
Routing correctly keeps Leo OS clean.