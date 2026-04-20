---
name: obsidian
description: Work with Obsidian vaults (plain Markdown notes) via the Local REST API.
homepage: https://help.obsidian.md
metadata:
  {
    "openclaw":
      {
        "emoji": "💎",
      },
  }
---
# Obsidian
Obsidian vault at <vault-path> accessible via Local REST API.

## REST API Access
Base URL: https://localhost:27124
Auth header: Authorization: Bearer <apiKey from skill config>
TLS: self-signed cert, use NODE_TLS_REJECT_UNAUTHORIZED=0 or -k with curl.

## Key Endpoints
- List vault files: GET /vault/
- Read a note: GET /vault/{path}
- Create/update note: PUT /vault/{path}
- Append to note: POST /vault/{path}
- Search: GET /search/simple/?query=...

## Notes
- Obsidian desktop must be running for the REST API to respond.
- Vault structure: *.md files (plain Markdown), .obsidian/ (config), attachments.
- Vault structure: 00 Inbox/ · 01 Daily/ · 02 Projects/ (BBS, Siftwise, Agent OS, ClawBot) · 03 Operations/ (Admin, Finance, Health, Home) · 04 Assets/ (About-Leo, Digital Assets)
