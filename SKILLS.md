# SKILLS.md — Skill Library

Skills are markdown-defined tool packages. Each skill provides an agent with instructions, schemas, and prompts for a specific capability. Skills are loaded from the shared workspace library and can be overridden per agent.

---

## ClawBot (Orchestrator) Skills

| Skill | Description |
|-------|-------------|
| `tavily` | Web search via Tavily API |
| `todoist` | Task management — read, create, update tasks |
| `gog` (Google Workspace) | Google Drive, Docs, Sheets, Gmail, Calendar, Contacts |
| `obsidian` | Read/write to Obsidian vault via REST API |
| `cmc-api-crypto` | CoinMarketCap crypto data |
| `cmc-api-market` | CoinMarketCap market data |
| `cmc-api-onchain-data` | CoinMarketCap on-chain data |
| Weather | Open-Meteo weather data |

---

## Vito (Sales) Skills

| Skill | Description |
|-------|-------------|
| `apollo` | Lead prospecting and contact enrichment |
| `attio` | CRM — contact and pipeline management |
| `attio-cli` | CLI interface for Attio operations |
| `linkedin` | LinkedIn outreach and research |
| `imap-smtp-email` | Email send/receive |
| `brw-cold-outreach-sequence` | Cold outreach sequence builder |
| `outreach-compliance-check` | Pre-send compliance check (required before any outreach) |
| `closing-deals` | Deal closing frameworks |
| `coordinate-meeting` | Meeting scheduling and coordination |
| `email-marketing` | Email campaign support |
| `lead-scorer` | Lead scoring criteria and logic |
| `lead-magnets` | Lead magnet design |
| `landing-page-roast` | Landing page critique |
| `marketing-strategy-pmm` | PMM-level marketing strategy |
| `norman-manage-clients` | Client management workflows |
| `word-docx` | Document generation |
| `markdown-exporter` | Export markdown to other formats |
| `office-document-editor` | Edit Office documents |

---

## Oracle (Research) Skills

| Skill | Description |
|-------|-------------|
| `competitor-analysis` | Structured competitor research |
| `market-research` | Market sizing, trends, and analysis |

---

## Tron (Developer) Skills

| Skill | Description |
|-------|-------------|
| `api-tester` | API endpoint testing |
| `architecture-patterns` | Software architecture reference |
| `atris` | Internal system tooling |
| `deep-debugging` | Systematic debugging methodology |
| `docker` | Docker operations |
| `git-essentials` | Git workflows |
| `indirect-prompt-injection` | Security review for prompt injection risks |
| `playwright-mcp` | Browser automation via Playwright |
| `quack-code-review` | Code review methodology |
| `security-audit-toolkit` | Security audit procedures |
| `skill-creator-2` | Create new skills for the system |
| `ssh-essentials` | SSH operations |
| `sysadmin-handbook` | System administration reference |
| `webhook-send` | Outbound webhook dispatch |

---

## Notes

- Skills are `.md` files defining tool behavior, schema, and constraints
- The `outreach-compliance-check` skill is non-negotiable for Vito — it must pass before any outreach is sent
- Skills can be overridden per-agent by placing a modified `SKILL.md` in the agent's `skills/<name>/` directory
- The shared skill library is maintained in the main ClawBot workspace
