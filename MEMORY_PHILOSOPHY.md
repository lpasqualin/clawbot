# MEMORY_PHILOSOPHY.md — Why File-Based Memory

## The Design Choice

ClawBot uses file-based memory instead of a vector database or cloud memory service. This was a deliberate architectural decision, not a limitation.

A custom memory service (PostgreSQL + pgvector) was built and deployed alongside ClawBot. It was disabled. The reason: file memory is simpler, more durable, more inspectable, and sufficient for a single-operator system.

---

## How It Works

Every agent starts each session fresh — no cross-session state in the runtime context window. Continuity is maintained by reading workspace files at session startup.

**Three layers of memory:**

### 1. Session Logs — `memory/YYYY-MM-DD.md`
Raw daily logs. What happened, what was decided, what changed. Written during the session. Read at the start of subsequent sessions for recent context. These are the operational notebook.

### 2. Curated Long-Term Memory — `MEMORY.md`
Distilled facts, decisions, and preferences that must survive indefinitely. This is the agent's equivalent of long-term memory. It's maintained by the agent: session logs are reviewed periodically and relevant facts are promoted to `MEMORY.md`. Outdated facts are removed. It's not a log — it's a curated index.

### 3. Workspace Reference Files
Stable operational files that don't change often but must be readable at startup: `SOUL.md` (identity and doctrine), `USER.md` (operator context), `ROUTING.md`, `PERMISSIONS.md`, etc. These are the agent's standing instructions.

---

## Why Not a Vector Database?

For a single operator with a small number of agents, the overhead of vector search is not justified. The memory surface is small enough that structured markdown files — read at session start — are both faster to access and easier to maintain.

Vector databases are useful for:
- Large knowledge bases with fuzzy retrieval needs
- Multi-user systems where per-user context needs isolation
- Real-time semantic search across thousands of entries

ClawBot's memory doesn't require any of these. The operator knows what's in the files. The agent can read them. No retrieval complexity needed.

---

## The Continuity Contract

Because agents wake up fresh each session, the workspace files *are* the agent's memory. This creates an important design constraint:

**If it's not written to a file, it doesn't persist.**

This makes memory explicit. There are no hidden state accumulations. If something important happens, it gets written. If a decision is made, it goes to `MEMORY.md`. If context is needed for tomorrow, it goes in the session log.

The agents are trained to uphold this contract: write it down, or it's gone.

---

## Memory Hierarchy (Per Agent)

```
SOUL.md          → Who I am. Read every session.
USER.md          → Who I'm serving. Read every session.
MEMORY.md        → What I know long-term. Read in main sessions.
memory/today.md  → What happened recently. Read at startup.
```

Specialists maintain their own memory. The orchestrator (ClawBot) maintains the master operational memory and consolidates signals from specialist work into its own `MEMORY.md`.

---

## Memory Maintenance

Periodic memory maintenance is built into the heartbeat cycle:
1. Read recent session logs
2. Identify what's worth keeping long-term
3. Update `MEMORY.md` with distilled facts
4. Remove outdated entries

This is not automated — it's agent-driven, with the agent making judgment calls about what to keep. The result is a memory that reflects operational reality rather than a raw append-only log.
