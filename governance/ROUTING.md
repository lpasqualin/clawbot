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

When [OPERATOR] says something, classify it:

[OPERATOR] says something →
    Is [OPERATOR] asking to DO something?
        → Task → Todoist

    Is [OPERATOR] talking about something happening at a specific time?
        → Event → Calendar

    Is [OPERATOR] stating a decision, rule, preference, constraint, or fact?
        → Durable Memory → MEMORY.md

    Is [OPERATOR] asking to write, plan, document, research, or think deeply?
        → Long-form → Obsidian

    Is [OPERATOR] asking to generate, export, or create a file?
        → Artifact → Workspace

    Is [OPERATOR] asking for status, priorities, or what to work on?
        → Brief / Status → Read systems, do not store

    Is [OPERATOR] identifying a risk, drift, or something to monitor?
        → Risk → MEMORY.md (Open Loops) + HEARTBEAT monitoring

    Is [OPERATOR] asking to contact or message someone?
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
Routing correctly keeps the system clean.

---

## Task Classes

Every task must be classified before execution.

| Class | Description | Reasoning | Tool Scope |
|-------|-------------|-----------|-----------|
| CRUD | Create/update/delete in a system | low | one system only |
| LOOKUP | Read/check information | low | read-only, single system |
| ROUTING | Decide where work goes | low | no tools |
| SUMMARY | Condense or summarize content | medium | source only |
| PLANNING | Break down work or next steps | medium | optional |
| DEBUGGING | Investigate failures or issues | high | logs + relevant tools |
| DEEP_WORK | Strategy, architecture, complex reasoning | high | selective |

---

## Tool Scope Rule

Only expose tools required for the classified task.

- Do NOT load the full toolset
- Do NOT use multiple systems for CRUD
- Do NOT expand tool usage mid-task

Examples:
- Todoist task → only Todoist tools
- Calendar lookup → only Calendar read
- Debugging → logs + system tools only

More tools = more confusion.

---

## Classification Stability Rule

Classify once before execution.

- Do NOT silently upgrade task class mid-run
- Do NOT escalate from CRUD → DEEP_WORK automatically

If task appears more complex than expected:
- STOP
- Report mismatch
- Ask or retry with correct class

---

## One-System Rule (CRUD)

CRUD tasks must operate on ONE system only.

- Do NOT chain actions across systems
- Do NOT "also update" other systems unless explicitly asked

Example:
"Create Todoist task" → only Todoist
NOT → Todoist + Calendar + Memory

---

## Failure Rule

If correct tool, system, or classification is unclear:

- Do NOT compensate by expanding scope
- Do NOT load more tools or context
- STOP and ask a focused question

---

When in doubt: Classify → Route → Act.

If ambiguity materially affects correctness, safety, or external impact:
→ ask [OPERATOR]

If system, tool, or classification is unclear:
→ STOP, do not expand scope or context