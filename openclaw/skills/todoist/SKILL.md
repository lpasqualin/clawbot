---
name: todoist
description: Manage tasks and projects in Todoist. Use when user asks about tasks, to-dos, reminders, or productivity.
homepage: https://todoist.com
metadata:
  clawdbot:
    emoji: "✅"
    requires:
      bins: ["todoist"]
      env: ["TODOIST_API_TOKEN"]
---

# Todoist Skill

**Always prefer the REST API over the CLI.** The `todoist` CLI has no access to completed tasks, unreliable filter support, and limited query capability. Use the REST API for all operations unless it is explicitly unavailable.

---

## Primary Method: REST API

Base URL: `https://api.todoist.com/api/v1`  
Auth header: `Authorization: Bearer $TODOIST_API_TOKEN`

### Key Endpoints

#### List active tasks
```
GET /tasks
```
Optional query params:
- `filter=<todoist-filter>` — Todoist filter syntax (see below)
- `project_id=<id>` — limit to a project

Examples:
```bash
# All active tasks
curl -s -H "Authorization: Bearer $TODOIST_API_TOKEN" \
  "https://api.todoist.com/api/v1/tasks"

# Overdue + today
curl -s -H "Authorization: Bearer $TODOIST_API_TOKEN" \
  "https://api.todoist.com/api/v1/tasks?filter=overdue%20%7C%20today"

# Tomorrow
curl -s -H "Authorization: Bearer $TODOIST_API_TOKEN" \
  "https://api.todoist.com/api/v1/tasks?filter=tomorrow"
```

#### Completed tasks (CLI cannot do this — REST API only)
```
GET /tasks?filter=completed
```
Or use the sync endpoint for a date range:
```bash
curl -s -H "Authorization: Bearer $TODOIST_API_TOKEN" \
  "https://api.todoist.com/api/v1/tasks/completed?since=<ISO8601>&limit=50"
```
Each result object has `.content` and `.completed_at`.

#### Create a task
```
POST /tasks
Content-Type: application/json

{ "content": "Task name", "due_string": "tomorrow", "priority": 1 }
```

#### Complete (close) a task
```
POST /tasks/{task_id}/close
```

#### List projects
```
GET /projects
```

### Filter Syntax Reference

| Filter | Meaning |
|---|---|
| `today` | Due today |
| `tomorrow` | Due tomorrow |
| `overdue` | Past due |
| `overdue \| today` | Overdue or due today |
| `p1` / `p2` / `p3` / `p4` | Priority level |
| `@label` | Tasks with label |
| `#project` | Tasks in project |

URL-encode filters when passing as query params (`\|` → `%7C`, space → `%20`).

---

## Last Resort: CLI (`todoist-ts-cli`)

Use the CLI **only** for simple add/done operations when the REST API is unavailable.  
**Do not use the CLI for:** completed tasks, filter-based queries, or anything requiring full task history.

```bash
todoist add "Task name" --due "tomorrow"   # add a task
todoist done <id>                          # complete a task
todoist tasks                              # list today + overdue (unreliable filters)
todoist search "keyword"                   # search active tasks
```

The CLI reads auth from `TODOIST_API_TOKEN` (same env var as REST API).

---

## Usage Examples

**"What tasks are due today?"**
```bash
curl -s -H "Authorization: Bearer $TODOIST_API_TOKEN" \
  "https://api.todoist.com/api/v1/tasks?filter=today"
```

**"What did I complete yesterday?"**
```bash
curl -s -H "Authorization: Bearer $TODOIST_API_TOKEN" \
  "https://api.todoist.com/api/v1/tasks/completed?since=$(date -u -d yesterday +%Y-%m-%dT00:00:00Z)&limit=50"
```

**"What did I complete today?"**
```bash
curl -s -H "Authorization: Bearer $TODOIST_API_TOKEN" \
  "https://api.todoist.com/api/v1/tasks/completed?since=$(date -u +%Y-%m-%dT00:00:00Z)&limit=50"
```

**"Show overdue tasks"**
```bash
curl -s -H "Authorization: Bearer $TODOIST_API_TOKEN" \
  "https://api.todoist.com/api/v1/tasks?filter=overdue"
```

**"Add 'call dentist' due tomorrow"**
```bash
curl -s -X POST -H "Authorization: Bearer $TODOIST_API_TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"content":"Call dentist","due_string":"tomorrow"}' \
  "https://api.todoist.com/api/v1/tasks"
```

**"Mark task 12345 as done"**
```bash
curl -s -X POST -H "Authorization: Bearer $TODOIST_API_TOKEN" \
  "https://api.todoist.com/api/v1/tasks/12345/close"
```
