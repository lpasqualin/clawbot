# HEARTBEAT — Example Output

_This is an example of what a ClawBot heartbeat alert looks like. The heartbeat runs on a scheduled cycle and surfaces only items that meet threshold criteria defined in docs/heartbeat.md._

---

**ClawBot Heartbeat — 2026-03-31 09:00**

**Urgent**
- Follow-up with [client name] — commitment made 5 days ago, no update recorded. Deadline was yesterday.
- TSA PreCheck renewal — hard deadline in 8 days. No action recorded.

**Approaching Threshold**
- [Project A] — no activity logged in 12 days. Milestone in 2 weeks.
- [Open loop item] — in MEMORY.md since 2026-03-20. No resolution recorded.

**System**
- All systems nominal. Primary model active.

---

_Quiet heartbeat (nothing actionable):_

**ClawBot Heartbeat — 2026-03-30 09:00**

No items above threshold. Next scheduled brief: morning.

---

## Notes on Heartbeat Design

- Heartbeats do not store output — they are read operations
- Same item will not re-alert within 24 hours unless status changed
- Low-priority items are batched into the daily brief, not sent as standalone alerts
- Immediate escalation (no waiting for schedule) occurs for: missed external commitments, revenue-critical deadline passes, infrastructure failure blocking operator, irreversible action without confirmation

See `docs/heartbeat.md` for the full monitoring doctrine and thresholds.
