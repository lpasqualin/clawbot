# ROUTING.md — Intent and Routing Guide

## Core Rule

Each piece of information has exactly one system of record.
When Leo says something, the job is not to find a tool — it is to identify
intent, then route to the system that owns that type of information.

**Think in this order:**
1. What is Leo actually trying to accomplish?
2. Which system owns that type of information?
3. Then choose the appropriate tool to act on that system.

---

## Decision Flow

```
Leo says something →
    Is this a task or action item?       → Todoist
    Is this an event or time commitment? → Calendar
    Is this a decision or durable fact?  → MEMORY.md
    Is this a plan or long-form content? → Obsidian
    Is this a file or generated artifact? → Workspace
    Is this a request for status?        → Generate brief
    Is this a risk or overdue concern?   → Surface via HEARTBEAT rules
    Is this research?                    → Obsidian (02 Projects or 03 Operations)
    Is this a message to someone?        → Communication channel
```

---

## Intent Categories

### Task
**What it is:** Something Leo must do. Has a clear action and (optionally) a deadline.

**Recognize it when Leo says:**
- "Remind me to…"
- "I need to…"
- "Follow up on…"
- "Don't let me forget to…"
- "Add a task for…"
- "Ping [person] about…"

**System of record:** Todoist

**Do not:**
- Write tasks to MEMORY.md
- Write tasks to Obsidian as standalone notes
- Create Calendar events for open-ended tasks without a specific time

**Examples:**
- "Remind me to renew my subscription" → Todoist task with due date
- "Follow up with the client Thursday" → Todoist task due Thursday

---

### Event
**What it is:** Something happening at a specific time. Requires a place on the calendar.

**Recognize it when Leo says:**
- "I have a call…"
- "Schedule a meeting…"
- "Block time for…"
- "Put [X] on the calendar"
- "We're meeting on…"

**System of record:** Google Calendar

**Do not:**
- Create Calendar events for tasks without a specific time
- Duplicate events into MEMORY.md or Todoist unless there is follow-up work

**Examples:**
- "Block Thursday afternoon for deep work" → Calendar event
- "Call with client Friday at 2pm" → Calendar event + Todoist task only if prep work is needed

---

### Durable Memory
**What it is:** A fact, decision, preference, or constraint that must survive across sessions
and inform future behavior. Not a task. Not a plan. A fact that changes how ClawBot operates.

**Recognize it when Leo says:**
- "We decided…"
- "From now on…"
- "My preference is…"
- "The priority is…"
- "Remember that…"
- "Just so you know…"
- "That's been resolved / settled / locked"

**System of record:** MEMORY.md

**Do not:**
- Write durable decisions only to Obsidian (they won't be seen at session start)
- Write decisions as Todoist tasks
- Duplicate into multiple places — MEMORY.md is the single source

**Examples:**
- "We decided to focus on BBS first" → Decisions section of MEMORY.md
- "I'm not taking on new freelance clients until Q3" → Preferences or Decisions in MEMORY.md
- "The enrollment window closes in April" → Open Loops / Risks in MEMORY.md

---

### Long-Form Knowledge / Planning
**What it is:** Something that requires structure, depth, or narrative. Plans, strategies,
research, meeting notes, architecture docs, workflows.

**Recognize it when Leo says:**
- "Write a plan for…"
- "Draft a strategy for…"
- "Document how…"
- "Take notes on…"
- "Write up…"
- "Create an outline for…"

**System of record:** Obsidian

**Folder routing:**
- Has an outcome and a timeline → `02 Projects/`
- Ongoing life or business management → `03 Operations/`
- Reference material → `04 Assets/`
- Unsure → `00 Inbox/`

**Do not:**
- Write long-form content into MEMORY.md (it degrades retrieval quality)
- Create Todoist tasks for things that are actually documents
- Leave plans in Workspace when they should be persisted

**Examples:**
- "Write a plan for med spa outreach" → Obsidian `02 Projects/BBS/`
- "Document the ClawBot architecture" → Obsidian `02 Projects/ClawBot/`
- "Save notes from today's call" → Obsidian `01 Daily/` or relevant project folder

---

### File / Artifact
**What it is:** A generated file, export, draft, script, or intermediate output that
does not yet have a permanent home.

**Recognize it when Leo says:**
- "Generate a…"
- "Export…"
- "Create a draft of…"
- "Save this as a file"
- "Write a script that…"

**System of record:** Workspace (promote to Obsidian or another system if it should persist)

**Do not:**
- Leave files in Workspace that are actually finished documents (move to Obsidian)
- Save files to Workspace when they belong in a permanent system of record

**Examples:**
- "Generate a CSV of open tasks" → Workspace, offer to export
- "Write a draft proposal for [client]" → Workspace draft, then Obsidian once reviewed

---

### Status / Briefing
**What it is:** A request to understand current state — what is happening, what is overdue,
what needs attention. Not a request to store anything.

**Recognize it when Leo says:**
- "What should I be working on?"
- "Give me a briefing"
- "What's on my plate?"
- "What did I miss?"
- "Anything urgent?"
- "Catch me up"

**System of record:** None — this is a read operation. Pull from Todoist, Calendar,
MEMORY.md, and HEARTBEAT rules, then synthesize.

**Do not:**
- Store the output of a brief as a durable memory entry
- Create tasks based on a briefing unless Leo explicitly asks
- Pad the brief with low-priority items

**Output format:** Surface what is urgent or time-sensitive first, then upcoming,
then open loops. Keep it scannable.

---

### Risk / Monitoring
**What it is:** Something that could go wrong, drift, expire, or be missed.
Not a task to be done immediately — a condition to be watched.

**Recognize it when Leo says:**
- "I'm worried about…"
- "Don't let [X] slip"
- "That could be a problem"
- "Keep an eye on…"
- "That deadline is coming up"
- "I haven't heard back from…"

**System of record:** MEMORY.md (Open Loops / Risks section). Alert policy in HEARTBEAT.md.

**Do not:**
- File risks as Todoist tasks unless there is a concrete action to take now
- Ignore risks that surface during briefings — surface them explicitly

**Examples:**
- "I haven't landed a BBS client yet" → already in Open Loops; surface in briefings
- "A critical service is still down" → Infrastructure risk in MEMORY.md; monitor

---

### Research
**What it is:** Gathering, synthesizing, or analyzing information to inform a decision
or plan. Output is knowledge, not an action item.

**Recognize it when Leo says:**
- "Look into…"
- "Find out…"
- "What do you know about…"
- "Research…"
- "Compare…"
- "What are the options for…"

**System of record:** Obsidian if the output should persist; Workspace if temporary.

**Do not:**
- Store research summaries in MEMORY.md unless they produce a durable decision
- Create Todoist tasks for research unless there is a specific deliverable

**Examples:**
- "Research med spa CRM options" → draft in Workspace, move to Obsidian `02 Projects/BBS/` if kept
- "What's the renewal process for X?" → answer inline; update MEMORY.md deadline if relevant

---

### Communication
**What it is:** A message to be sent to another person or external system.

**Recognize it when Leo says:**
- "Send [person]…"
- "Reply to…"
- "Message…"
- "Email…"
- "Let [person] know…"

**System of record:** The communication channel (email, Telegram, etc.)

**Do not:**
- Send without Leo's explicit approval (per MEMORY.md Decisions)
- Copy outbound messages into MEMORY.md unless they represent a commitment

**Examples:**
- "Send the proposal to the client" → requires explicit approval; draft first
- "Message the team about the deadline" → requires explicit approval

---

## Ambiguous Requests — How to Decide

**"Remind me to call John"**
→ Task. Intent is to not forget an action. Route to Todoist with due date if given,
or ask for one. Do not add to MEMORY.md.

**"We decided to focus on BBS first"**
→ Durable Memory. This is a strategic decision that should inform future prioritization.
Route to MEMORY.md Decisions. If there is a plan behind it, also create an Obsidian note
in `02 Projects/BBS/` — but the decision itself lives in MEMORY.md.

**"Write a plan for med spa outreach"**
→ Long-Form Knowledge. Intent is to produce a structured document. Route to Obsidian
`02 Projects/BBS/`. Do not create a Todoist task for the plan itself (the writing is
the action, not a task to track separately unless Leo needs to review it later).

**"Save this somewhere"**
→ Classify first. Ask: what is "this"? If it's a decision → MEMORY.md. If it's a
document or plan → Obsidian. If it's a file → Workspace. If truly unclear, route to
Obsidian `00 Inbox/` and tell Leo where it went.

**"What should I be working on?"**
→ Status / Briefing. Pull from Todoist (overdue + due today), Calendar (today/tomorrow),
MEMORY.md (open loops, project priorities), and HEARTBEAT thresholds. Synthesize and
rank by urgency and strategic weight. Do not store the output.

**"Anything I'm missing?"**
→ Risk / Monitoring + Briefing. Check MEMORY.md Open Loops, HEARTBEAT thresholds,
and Todoist for overdue or idle high-priority items. Surface gaps, not just tasks.
The question is asking for blind spots, not a task list.

---

_Update this file when routing logic changes — not when tasks or projects change._
