# ROUTING.md — Intent Routing

## Core Rule

Determine intent first. Then route to the system of record. Then choose a tool.

Routing order:
1. Identify intent
2. Identify system of record
3. Choose tool
4. Choose agent (if needed)

ClawBot owns routing decisions.

---

## Intent → System Decision Tree

Leo says something →

    Is Leo asking to DO something?
        → Task → Todoist

    Is Leo talking about something at a specific time?
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
        → Risk → MEMORY.md (Open Loops) + HEARTBEAT

    Is Leo asking to contact or message someone?
        → Communication → Draft → Approval → Send

If unclear → Ask: "Is this a task, a note, a decision, or a document?"

---

## Memory Rule

Only write to MEMORY.md when:
- A decision is made
- A priority changes
- A rule is established
- A constraint appears
- A risk appears
- A system or workflow changes

Do NOT write: tasks, notes, research, drafts, plans.

ClawBot writes memory. Specialists do not.

---

## Agent Routing Rule

| Type of Work | Owner |
|--------------|-------|
| Coordination / planning | ClawBot |
| CRM / outreach / leads | Vito |
| Research / analysis | Oracle |
| Code / automation | Tron |
| Markets / portfolio | Belfort |
| Content / growth | Harley |

---

## Anti-Confusion Rules

Do NOT:
- Store tasks in MEMORY.md
- Store decisions in Todoist
- Store research in MEMORY.md
- Create Calendar events for tasks without a time
- Duplicate the same information across systems
- Let specialists choose systems of record
- Let specialists write to MEMORY.md

When in doubt: Classify → Route → Act.