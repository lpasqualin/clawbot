# Memory Skill

Persistent memory for ClawBot. Backed by a local FastAPI service at `http://localhost:9001` with pgvector semantic search. Use this skill to store facts that should survive across sessions, recall context from prior conversations, and suppress outdated memories.

---

## Actions

### remember

Store a new memory. Always run `recall` first to check for near-duplicates before writing.

**Endpoint:** `POST http://localhost:9001/write_event`

**Required fields:**

| Field | Type | Allowed values |
|---|---|---|
| `category` | string | `preference`, `decision`, `project_fact`, `task_outcome`, `entity` |
| `content` | string | Plain text. Two sentences maximum. |
| `scope` | string | `clawbot`, `bbs`, `siftwise`, `personal`, `global` |
| `confidence` | string | `high`, `medium`, `low` |
| `source` | string | `telegram_chat`, `cron_morning_brief`, `cron_afternoon`, `cron_night`, `manual`, `system_event` |

**Optional fields:**

| Field | Type | Description |
|---|---|---|
| `supersedes_id` | integer | ID of the memory this replaces. Use when updating a stale fact. |
| `importance` | string | `low`, `medium`, `high`. Defaults to medium if omitted. |

**Response:** `{ "status": "ok", "id": <integer> }`

**Example:**
```json
POST http://localhost:9001/write_event
{
  "category": "preference",
  "content": "Leo prefers concise morning briefs without filler. He skips pleasantries and wants bullet points.",
  "scope": "personal",
  "confidence": "high",
  "source": "telegram_chat",
  "importance": "high"
}
```

---

### recall

Semantic search over stored memories. Returns ranked results by similarity. Suppressed memories are excluded by default.

**Endpoint:** `POST http://localhost:9001/search`

**Fields:**

| Field | Type | Default | Description |
|---|---|---|---|
| `query` | string | required | Natural language search query |
| `top_k` | integer | 5 | Number of results to return |
| `category` | string | null | Filter by category (optional) |
| `scope` | string | null | Filter by scope (optional) |
| `include_suppressed` | boolean | false | Set true to include forgotten memories |

**Response:** `{ "results": [ { "id", "source", "category", "scope", "confidence", "content", "importance", "suppressed" }, ... ] }`

**Example:**
```json
POST http://localhost:9001/search
{
  "query": "Leo's preferences for morning updates",
  "top_k": 5,
  "category": "preference",
  "scope": "personal"
}
```

---

### forget

Suppress a memory by ID. Does not delete — the record remains queryable with `include_suppressed: true`. Use when a fact is stale or was stored in error.

**Endpoint:** `POST http://localhost:9001/forget`

**Fields:**

| Field | Type | Description |
|---|---|---|
| `id` | integer | Memory ID returned by `remember` or found via `recall` |

**Response:** `{ "status": "ok", "id": <integer>, "suppressed": true }`

**Example:**
```json
POST http://localhost:9001/forget
{ "id": 42 }
```

---

## Write Rules

### When to write

- A user states an explicit preference ("I want X", "I prefer Y", "always do Z").
- A decision is made that affects future behavior ("we decided to use Postgres instead of SQLite for this project").
- A project fact emerges that ClawBot would otherwise need to re-derive ("Siftwise uses FastAPI; the main config is at /home/leo-paz/siftwise/config.py").
- A task outcome should inform future cron behavior ("Leo's morning brief is too long; he asked to cut it to 5 bullets").
- An entity is introduced that will recur ("Farah is Leo's spouse").
- The user says "remember this" or "don't forget".

### When NOT to write

- Purely ephemeral context: current weather, today's task list, transient session state.
- Information already verifiable from the codebase, config files, or CLAUDE.md.
- Inferences with low confidence that were not confirmed by the user.
- Conversational filler: greetings, acknowledgments, "thanks".
- Anything the user explicitly says is temporary or one-off.
- Duplicate of a memory that already exists (check first via `recall`).

---

## Recall Triggers

### Recall before acting on these

- User references a person by name (check entity memories for context).
- User mentions a project by name (check project_fact memories for scope/constraints).
- User asks to adjust a cron brief format or behavior (check prior task_outcome memories).
- User asks "do you remember", "what did I say about", or "last time we discussed".
- Any task that involves a preference-sensitive output (tone, length, format).
- Before writing a new memory — always search the same category+scope to prevent duplicates.

### Do NOT recall for these

- Simple factual lookups (weather, time, math).
- Tasks explicitly scoped to the current session only.
- Requests where the user provides all context inline.
- High-frequency cron tool calls where latency matters and no preference context is needed.

---

## Duplicate Prevention

Before writing any memory, call `recall` with the same `category` and `scope` and a query derived from the content. If a result exists with distance < 0.15 (semantically near-identical), do not write — either update the existing memory using `supersedes_id` or call `forget` on the old ID first and then write the replacement. Never store two memories that say the same thing in different words.

---

## Obsidian Routing

Two sentences or fewer describing a fact, preference, or decision → **Memory service** (`remember`). Anything longer — structured notes, research outputs, meeting summaries, multi-paragraph context — → **Obsidian vault** via the `obsidian` skill. Memory is for recall-indexable atoms; Obsidian is for human-readable documents.
