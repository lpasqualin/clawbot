# DELEGATION_TEMPLATE.md

## Purpose

This template defines the standard handoff format ClawBot uses when delegating work to a specialist agent.

Core rule:
**ClawBot decides, specialists execute, systems of record store truth, operator approves major decisions and irreversible external actions when required.**

---

## Standard Delegation Format

### Agent
Which specialist should handle this?
- Vito
- Oracle
- Tron
- Belfort
- Harley

### Objective
What needs to be done?

### Why It Matters
Why this task matters in the larger context.

### Domain
Which domain does this belong to?
- Sales
- Research
- Development
- Trading / Capital
- Content / Growth
- Personal
- Planning
- Admin
- System

### Context
Relevant background, prior work, linked notes, constraints, and assumptions.

### Allowed Actions
What the agent is explicitly allowed to do.

### Forbidden Actions
What the agent must not do.

### Systems of Record
Where inputs should be read from and where outputs must be written.

### Deliverable
What the agent must return.

### Deadline / Urgency
If time-sensitive, specify it.

### Escalate If
Conditions that require the task to return to ClawBot.

### Definition of Done
What completion means for this task.

---

## Example

### Agent
Vito

### Objective
Build a first-pass lead list of 20 South Florida med spas.

### Why It Matters
This is the first pipeline input for BBS outreach.

### Domain
Sales

### Context
Focus on South Florida. Prefer owner-led or locally operated businesses. Goal is to validate the niche and seed the CRM.

### Allowed Actions
- Search public web
- Capture business/contact basics
- Create lead notes in the BBS lead structure

### Forbidden Actions
- Send outreach
- Make pricing commitments
- Edit personal notes
- Modify system files

### Systems of Record
Write all outputs to Obsidian under `BBS/Leads/`.

### Deliverable
20 lead entries with business name, location, website, contact, and opportunity notes.

### Deadline / Urgency
Today if possible.

### Escalate If
- Fewer than 20 decent leads found
- Contact data is weak
- Niche quality looks poor

### Definition of Done
20 lead entries are written to the correct location and obvious risks/opportunities are summarized.

---

## Handoff Return Format

When a specialist returns work to ClawBot, the return should include:

1. **Task** — what was requested
2. **Status** — Completed / Partial / Blocked
3. **Output** — the actual deliverable or result
4. **Open Questions** — anything unresolved or uncertain
5. **Recommended Next Step** — what should happen next
6. **Approval Needed** — Yes / No, and if yes, why

**Good handoff:** clear task, clear result, clear blockers, clear next step, clear approval status.
**Bad handoff:** "Done." / "Here's some research." — these create more work, not less.

A good handoff reduces decision load for the next agent. A bad handoff creates confusion.
