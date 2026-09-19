# Project Memory & Context Continuity

> **Purpose**: Maintains continuity across AI agent sessions. Preserves critical architectural decisions, caveats, and active state so new sessions pick up seamlessly without context amnesia.

---

## 📅 Session Metadata
- **Last Updated**: [YYYY-MM-DD HH:MM]
- **Current Development Phase**: Phase 1 — Environment & Project Setup
- **Active Task**: #1.1 Initialize repository and framework configuration

---

## 🎯 Current Status & Recent Milestones
- [x] Initialized project documentation structure under `docs/`.
- [ ] Working on Next.js setup with TypeScript and Tailwind CSS.
- [ ] Database schema definition in progress.

---

## 🧠 Architectural Decisions Log (ADR)
| Date | Decision Made | Rationale | Alternatives Considered |
|---|---|---|---|
| [Date] | Adopted 6-file documentation structure under `docs/` | Enforces single source of truth and stops AI context drift | Flat ad-hoc prompts (caused drift) |
| [Date] | Use Next.js 15 App Router with Server Actions | Simplifies client/server boundary and reduces API boilerplate | Dedicated Express backend |
| [Date] | Use Graphify for codebase indexing | Compresses AST dependency graph up to 71x for prompt efficiency | Dumping raw source files |

---

## ⚠️ Important Caveats & Known Gotchas
- Always run `graphify .` after modifying file structure or imports.
- Do not introduce client-side state hooks in layout components to prevent SSR hydration mismatches.
- Ensure all entity IDs use branded types defined in `src/types/`.
