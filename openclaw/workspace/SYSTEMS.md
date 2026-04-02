# SYSTEMS.md — System of Record and Routing

## Purpose

This file defines where information belongs.

When new information appears, classify it and route it to exactly one
authoritative system. Do not duplicate information across systems.

ClawBot is responsible for routing information correctly.

---

## Primary Systems of Record

| Information Type | System | Owner |
|------------------|--------|-------|
| Tasks / Action items | Todoist | ClawBot |
| Events / Time commitments | Google Calendar | ClawBot |
| Durable facts / Decisions | MEMORY.md | ClawBot |
| Project knowledge / Notes | Obsidian | Leo + Oracle + Tron |
| Contacts / Pipeline | CRM (Attio) | Vito |
| Code / Scripts / Infra | Codebase | Tron |
| Trading / Portfolio | Trading Journal | Belfort |
| Content / Assets | Content Library | Harley |
| Temporary work | Workspace | Task owner |

---

## Decision Tree (Routing Rule)

When information appears, classify it:

1. Does this require someone to do something?
   → Todoist

2. Does this happen at a specific time?
   → Google Calendar

3. Is this a decision, rule, priority, constraint, or important fact?
   → MEMORY.md

4. Is this research, planning, documentation, notes, or project material?
   → Obsidian

5. Is this temporary work, draft output, or an intermediate file?
   → Workspace

6. Is this a contact, company, or sales opportunity?
   → CRM

7. Is this code, automation, or infrastructure?
   → Codebase

8. Is this trading or portfolio related?
   → Trading Journal

9. Is this content or marketing material?
   → Content Library

If something fits multiple categories:
- Store the **action** in Todoist
- Store the **event** in Calendar
- Store the **decision** in MEMORY.md
- Store the **details** in Obsidian

Do not duplicate full information across systems.
Store once, reference elsewhere if needed.

---

## System Definitions

### Todoist — Tasks
Use for:
- Tasks
- To-dos
- Follow-ups
- Delegated items
- Anything Leo must do or decide

Do NOT use for:
- Events with specific times
- Durable facts
- Long notes

---

### Google Calendar — Events
Use for:
- Meetings
- Calls
- Appointments
- Time-blocked work
- Deadlines with a specific time

Do NOT use for:
- General tasks
- Notes
- Durable information

---

### MEMORY.md — Durable Memory
Use for:
- Decisions
- Priorities
- Constraints
- Preferences
- Risks
- Role definitions
- Important relationships
- System architecture decisions

Do NOT use for:
- Tasks
- Events
- Long documents
- Research
- Drafts

ClawBot is the only writer to MEMORY.md.

---

### Obsidian — Project Knowledge
Use for:
- Project plans
- Research
- Strategy
- Architecture
- Meeting notes
- Case studies
- Documentation
- Daily and weekly notes

Obsidian is the canonical home for project depth.

Do NOT use for:
- Tasks
- Quick facts
- Calendar events

---

### Workspace — Temporary Work
Use for:
- Scratch work
- Draft exports
- Intermediate files
- Experiments
- Generated outputs

Anything important must be moved to a real system of record.

Workspace is temporary.

---

### CRM — Sales Pipeline
Use for:
- Contacts
- Companies
- Leads
- Pipeline stages
- Follow-up state
- Sales notes

Owned by Vito.

---

### Codebase — Technical Systems
Use for:
- Scripts
- Automations
- Integrations
- Infrastructure configs
- Technical documentation

Owned by Tron.

---

### Trading Journal
Use for:
- Trades
- Portfolio tracking
- Risk analysis
- Trade notes

Owned by Belfort.

---

### Content Library
Use for:
- Content ideas
- Posts
- Scripts
- Assets
- Funnels
- Email content

Owned by Harley.

---

## Anti-Duplication Rules

- Do not store tasks in MEMORY.md.
- Do not store events in MEMORY.md.
- Do not store long notes in MEMORY.md.
- Do not store tasks in Obsidian.
- Do not store durable facts in Todoist.
- Do not leave important information in Workspace.
- Every piece of information should have **one** system of record.

---

## Core Principle

ClawBot’s job is not to store information.

ClawBot’s job is to **put information in the system where it will be used**.

Correct routing is more important than storing more information.

---

---

## Routing Judgment Rules (When Something Doesn’t Fit Cleanly)

These rules allow ClawBot to use judgment instead of rigid classification
when information does not clearly fit one category.

### 1. Route by where the information will be used — not where it was created.

Examples:
- Research results → Obsidian
- Decision from research → MEMORY.md
- Tasks from research → Todoist
- Meeting outcomes → Obsidian (notes) + Todoist (actions) + MEMORY.md (decisions if any)

Always separate:
- **Thinking** → Obsidian
- **Decisions** → MEMORY.md
- **Actions** → Todoist
- **Time commitments** → Calendar

---

### 2. MEMORY.md stores decisions and operational reality — not thinking.

Write to MEMORY.md only when something changes how Leo operates.

Write to MEMORY.md when:
- A decision is made
- A priority changes
- A constraint appears
- A rule is established
- A risk appears
- A workflow becomes standard
- An important relationship is established
- A system architecture decision is made

If the information helps Leo **think**, it goes to Obsidian.  
If the information changes how Leo **operates**, it goes to MEMORY.md.

**Obsidian = thinking.**  
**MEMORY.md = decisions and reality.**

---

### 3. Todoist is for commitments. Calendar is for time commitments.

Use this rule:

| If Leo must… | System |
|--------------|--------|
| Do something | Todoist |
| Be somewhere at a time | Calendar |
| Do something at a specific time | Todoist + Calendar |

---

### 4. Obsidian Structure and Usage

Obsidian is the system for project knowledge, planning, research,
documentation, and long-form thinking.

#### Vault Structure

| Folder | Purpose |
|-------|--------|
| 00 Inbox | Quick capture, rough notes, ideas |
| 01 Daily | Daily notes, meeting notes, logs |
| 02 Projects | Project plans, research, architecture, strategy |
| 03 Operations | Admin, finance, home, health, life operations |
| 04 Assets | About Leo, digital assets, reference material |

#### When To Write Where

| Type of Information | Location |
|---------------------|----------|
| Idea / brain dump | 00 Inbox |
| Meeting notes | 01 Daily |
| Project research | 02 Projects |
| Project plan | 02 Projects |
| Strategy | 02 Projects |
| Documentation | 02 Projects or 03 Operations |
| SOP / workflow | 03 Operations |
| Personal admin | 03 Operations |
| Reference material | 04 Assets |

Obsidian contains **depth and context**, not tasks and not durable decisions.

---

### 5. Workspace Is Temporary

Workspace is for:
- Draft exports
- Generated files
- Scratch work
- Intermediate outputs
- Experiments

Anything important must be moved to:
- Obsidian (knowledge)
- MEMORY.md (decisions)
- Codebase (technical systems)
- CRM (contacts)
- Content Library (content assets)

Workspace should not contain permanent information.

---

### 6. Information Lifecycle Rule

Most information follows this lifecycle:

| Stage | System |
|------|--------|
| Idea | Obsidian |
| Research | Obsidian |
| Plan | Obsidian |
| Decision | MEMORY.md |
| Tasks | Todoist |
| Scheduled time | Calendar |
| Execution output | Workspace → then moved |
| Results / Notes | Obsidian |
| Lessons / Rules | MEMORY.md |

ClawBot should think in terms of **lifecycle**, not just storage.

---

### 7. When Unsure, Classify Like This

Ask:

> Is this a **task**, a **time**, a **decision**, or a **document**?

Then route:

| Type | System |
|------|--------|
| Task | Todoist |
| Time | Calendar |
| Decision | MEMORY.md |
| Document | Obsidian |
| Contact | CRM |
| Code | Codebase |
| Temporary | Workspace |

---

### 8. Final Routing Principle

ClawBot’s job is not to store more information.

ClawBot’s job is to **put information in the system where it will be used and maintained**.

Correct routing > more notes.

---

_Update this file when a new system is added or routing rules change — not when projects change._