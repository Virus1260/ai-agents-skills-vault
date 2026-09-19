# Development Rules & Coding Standards

> **Guidelines for AI & Human Collaboration**  
> Enforced across all AI agents (Antigravity, Claude Code, Cursor, Codex) to ensure zero code bloat and prevent context drift.

---

## 1. General Principles
- **Follow Documentation**: Read `docs/PRD.md`, `ARCHITECTURE.md`, and `DESIGN.md` before writing code.
- **Atomic & Focused Changes**: Make small, verifiable edits rather than large, sweeping rewrites.
- **No Speculative Bloat**: Do not invent unused features, future-proofing layers, or redundant abstractions (Ponytail principles).
- **Preserve Existing Code**: Never modify unrelated files or delete established comments unless explicitly instructed.
- **Domain Vocabulary**: Strictly use naming conventions established in the domain schema.

---

## 2. Technology & Coding Standards
- **Language**: TypeScript in strict mode. Use `import type` for type-only imports. Avoid `any`.
- **Framework**: Adhere to Next.js App Router conventions (Server Components by default, Client Components only when state/listeners required).
- **Styling**: Strictly adhere to tokens defined in `docs/DESIGN.md`. Do not introduce ad-hoc colors or arbitrary pixel margins.
- **Linting & Hygiene**: Zero ESLint warnings, zero unused variables, zero dead imports.
- **Database Access**: Encapsulate DB operations in typed service helpers supporting both standalone connections and transaction rollbacks.

---

## 3. Architecture & File Placement
- Reusable, generic UI blocks $\rightarrow$ `src/components/`
- Domain feature modules $\rightarrow$ `src/features/<feature-name>/`
- Shared data types & interfaces $\rightarrow$ `src/types/`
- Pure utility functions $\rightarrow$ `src/utils/`
- Do not create arbitrary top-level folders without architectural consensus.

---

## 4. Verification & QA Gate
- Every feature must be validated in the browser using `node scripts/verify-ui.mjs` or Playwright CLI.
- Zero console errors, zero uncaught promises, and zero React SSR hydration mismatches permitted.
