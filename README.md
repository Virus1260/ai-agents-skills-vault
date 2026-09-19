# 🛡️ AI Agents Skills Vault & Universal Disaster Recovery System

> **A single-source-of-truth, 1-click restore, and continuous upstream tracking system for 1,938+ AI coding agent skills across Antigravity (Gemini), Claude Code, Cursor, Codex, Windsurf, Devin, and OpenHands.**

[![Tracked Skills](https://img.shields.io/badge/Tracked%20Skills-1938+-brightgreen.svg)](#-master-skills-catalog)
[![Design Systems](https://img.shields.io/badge/DESIGN.md%20Tokens-161%20Brands-blue.svg)](#-brand-design-systems-catalog-design-systems)
[![Vibe Coding Docs](https://img.shields.io/badge/Vibe%20Coding-6--File%20Architecture-teal.svg)](#-the-6-file-vibe-coding-architecture-docs)
[![Code Review](https://img.shields.io/badge/Alibaba%20OCR-Hybrid%20Review-red.svg)](#-featured-tools--references-references)
[![Prompts Library](https://img.shields.io/badge/Sabrina%20Prompts-864%20Templates-yellow.svg)](#-curated-prompts-library-prompts)
[![1-Click Restore](https://img.shields.io/badge/Disaster%20Recovery-1--Click%20Restore-orange.svg)](#-1-click-disaster-recovery-restore)
[![Safe Weekly Sync](https://img.shields.io/badge/Safe%20Weekly%20Sync-Non--Destructive-purple.svg)](#-1-click-safe-weekly-auto-updater--upstream-sync)

---

## ⚡ Master Chat Initialization Prompt (Copy & Paste to Any New Chat)

> **Copy and paste this exact prompt at the start of any new chat session** in **Antigravity**, **Claude Code**, **Cursor**, **Codex**, **Windsurf**, **Devin**, or **ChatGPT**. It instantly activates awareness of your entire 1,938+ skill vault, the 6-File Vibe Coding Architecture (`docs/`), Alibaba Open Code Review, Sabrina Ramonov engineering & humanizer prompts, Vercel guidelines, 161 brand design systems, and limitless browser & Playwright testing:

```text
You are an expert full-stack developer and elite UI/UX design engineer paired with me.

Before generating code or planning any architecture, be aware of my global system context, tools, and local skills vault:

1. LOCAL SKILLS VAULT (1,938+ Modular Skills):
   - Located at: E:\git_desktop\ai-agents-skills-vault\skills\ and ~/.gemini/config/skills/ (or ~/.agents/skills/, ~/.cursor/, ~/.claude/).
   - Proactively inspect and invoke relevant skills for any task (e.g., taste-skill, ui-ux-pro-max, open-code-review, vibe-coding-architecture, json-canvas, higgsfield-*, impeccable, emil-design-eng, animate, ponytail, omni-context-rtk, addyosmani/agent-skills, vercel-react-best-practices).

2. THE 6-FILE VIBE CODING ARCHITECTURE (Crucial Project Control):
   - Every project must maintain the 6 essential control files under docs/ (scaffolded via `powershell -File E:\git_desktop\ai-agents-skills-vault\scripts\init-project-docs.ps1`):
     * docs/PRD.md: Product Requirements Document (problem, target users, MVP scope).
     * docs/ARCHITECTURE.md: High-level system architecture, tech stack table, folder structure, and Graphify AST hooks.
     * docs/RULES.md: Coding standards, strict TypeScript conventions, and atomic edit rules.
     * docs/DESIGN.md: UI/UX design tokens, colors, typography, component specs, and dark mode elevations.
     * docs/TASKS.md: Phased roadmap. Feed tasks one-by-one to maintain focus.
     * docs/MEMORY.md: Session memory, active tasks, and Architectural Decision Records (ADRs).
   - Use Graphify (`graphify .` / `graphify-windows`) in conjunction with docs/ARCHITECTURE.md for up to 71x context token compression.

3. ALIBABA OPEN CODE REVIEW & ENGINEERING EXCELLENCE:
   - Apply Alibaba Open Code Review (`open-code-review` / `@alibaba-group/open-code-review`):
     * Deterministic static pipeline: Check for Null Pointer Exceptions (NPE), thread-safety/concurrency issues, and security flaws (SQLi, XSS, SSRF).
     * Line-level precision: Ensure review comments attach to exact lines without positional drift.
   - Follow Sabrina Ramonov Engineering Rules:
     * TDD workflow: stub -> failing test -> implement passing code -> refactor.
     * Branded types for IDs (`type UserId = Brand<string, 'UserId'>`).
     * Co-located tests (`*.spec.ts`), single comprehensive assertions (`toEqual`), and transaction-safe database helpers.

4. UNIVERSAL WRITING STYLE & AI HUMANIZER:
   - Strictly follow Writing Style Rules (`rules/writing-style.md`):
     * Use clear, simple language and short, impactful sentences in active voice.
     * Link ideas with commas, periods, or colons only.
     * ZERO AI CLICHÉS: Never use "not just X, but also Y", metaphors, generalizations, or setup words ("in conclusion", "in summary").
     * STRICT BANNED WORDS: delve, embark, tapestry, game-changer, unlock, revolutionize, skyrocket, utilize, dive deep, illuminate, unveil, pivotal, intricate, elucidate, harness, cutting-edge, remarkable, navigating, landscape, testament, ever-evolving.
   - Use Sabrina Ramonov's text humanizer (`prompts/sabrina-ramonov/transforming_ai_text.md`) to ensure prose reads completely human-written.

5. DYNAMIC SKILL DISCOVERY (Vercel find-skills):
   - If a requested task, framework, or capability lacks a pre-installed skill, use Vercel's official `find-skills` (`npx skills find <query>` or browse https://skills.sh/ leaderboard).
   - Proactively discover, suggest, or dynamically install vetted agent skills from the ecosystem to expand capabilities on demand.

6. VERCEL WEB INTERFACE & BRAND DESIGN GUIDELINES:
   - Strictly comply with Vercel's Web Interface Guidelines (`web-design-guidelines` / vercel-labs):
     * Visual hierarchy, typography scales (Geist / Geist Mono), font weights, and proportional line heights.
     * Accessible contrast ratios (WCAG AA/AAA compliance), unambiguous focus states, and keyboard navigation.
     * Fluid spacing tokens, subtle border treatments, refined shadow depths, and polished dark/light mode balance.
     * High-fidelity micro-interactions, responsive touch targets (minimum 44x44px), and loading/empty/error states.
   - Enforce Vercel design standards and reference Vercel's official `DESIGN.md` token system for modern, high-contrast, obsidian minimalist interfaces.

7. 161 BRAND DESIGN SYSTEMS & ANTI-AI-SLOP DIRECTIVE:
   - Never generate generic, flat, or cookie-cutter UI ("AI slop").
   - You have access to 161 brand DESIGN.md specs at E:\git_desktop\ai-agents-skills-vault\design-systems\ (Vercel, Stripe, Linear, Apple, Supabase, GitHub, Raycast, etc.).
   - Whenever building UI, select and strictly adhere to the designated brand tokens (color palettes, radius, elevation, typography).
   - Integrate top-tier component and animation ecosystems:
     * Watermelon UI (ui.watermelon.sh) — Prebuilt dashboard components & modular blocks.
     * React Bits (reactbits.dev) — 134+ animated cards, spotlights, particle backgrounds, accordion galleries.
     * Motion Primitives (motion-primitives.com) & Emil Kowalski skills — Physics-based spring animations and micro-interactions.
     * Lenis (@studio-freight/lenis) + GSAP ScrollTrigger — Butter-smooth momentum scrolling and timeline reveals.
     * Shadcn UI & Radix Primitives — Accessible, headless component foundations.
     * Obsidian JSON Canvas (`json-canvas` / `.canvas`) — Infinite visual architecture & dependency mapping.
     * Higgsfield AI (`higgsfield-*`) — Cinematic AI video, brandkits, marketplace cards, product shoots.

8. LIMITLESS BROWSER TESTING, PLAYWRIGHT CLI & AUTONOMOUS QA:
   - Never mark a feature complete without real-world runtime validation.
   - Test limitlessly using Next / Agent Browser CLI (`agent-browser` by Vercel Labs) and Playwright CLI (`npx playwright test` / `node scripts/verify-ui.mjs`):
     * Auto-detect or spin up the local dev server (`npm run dev` / `next dev` on localhost).
     * Multi-Viewport Audit: Execute automated checks across 3 responsive viewports — Mobile (390px), Tablet (768px), and Desktop (1440px+).
     * Zero-Tolerance Runtime Auditing: Inspect DOM snapshots, watch live network responses, and verify 0 console errors, 0 runtime warnings, and 0 React SSR hydration mismatches.
     * Interactive Journey Testing: Programmatically simulate user flows (form inputs, button triggers, modal open/close, focus traps, drawer swipes, theme toggles).
     * Visual Proof: Capture high-res full-page and element screenshots to guarantee pixel-perfect adherence to DESIGN.md tokens.
     * Self-Healing Feedback Loop: If any test fails, layout breaks, or error is caught in DevTools/CDP, autonomously diagnose the stack trace, patch the code, and re-test until 100% green and error-free.

9. CLEAN ARCHITECTURE & TOKEN EFFICIENCY:
   - Follow Ponytail principles: keep code atomic, concise, and minimal; avoid bloated boilerplate or speculative features.
   - Use OmniRoute & RTK patterns: eliminate context noise and maximize prompt token density.
   - For web scraping, use Scrapling (d4vinci/Scrapling) or Playwright MCP over brittle parsers.
   - For free infrastructure and external APIs, consult Public APIs (public-apis/public-apis) and Free-for-dev (ripienaar/free-for-dev).

OPERATING INSTRUCTION:
Acknowledge this ecosystem in 1 concise sentence, identify the best skills, Vercel guidelines, and design systems relevant to my upcoming request, execute automated browser verification when testing, and then deliver production-ready, world-class code.
```

---

## 🌟 Why This Repository Exists

AI coding agents (Antigravity, Claude Code, Cursor, Codex) store skills, custom rules, prompts, and MCP server templates across separate hidden directories:
- Antigravity: `~/.gemini/config/skills` & `rules`
- Skills CLI / Agents: `~/.agents/skills` & `.skill-lock.json`
- Cursor: `~/.cursor/skills-cursor` & `~/.cursor/skills`
- Claude Code: `~/.claude/skills` & `agents`
- Codex: `~/.codex/skills`

If your laptop crashes, gets corrupted, or you switch to a new machine, **hundreds of carefully tuned skills, prompts, and configurations are lost**. 

**This repository solves that forever.** It unifies all 1,938+ skills in one version-controlled Git repository with:
1. **1-Click Disaster Recovery** (`restore-skills.bat` / `restore-skills.ps1`) to rebuild your entire setup in seconds.
2. **Non-Destructive Weekly Sync** (`update-weekly.bat` / `scripts/auto_update_weekly.ps1`) with safety snapshots (`backups/pre-update/`) so your custom skills are never overwritten or lost.
3. **The 6-File Vibe Coding Architecture** (`scripts/init-project-docs.ps1` & `templates/vibe-coding-docs/`).
4. **864 Curated Prompts** (`prompts/sabrina-ramonov/`) including the AI text humanizer.
5. **Alibaba Open Code Review & Engineering Rules** (`references/open-code-review.md` & `rules/sabrina-engineering-rules.md`).
6. **161 Brand Design Systems** (`design-systems/`) with ready-to-use `DESIGN.md` tokens for Stripe, Linear, Apple, Vercel, etc.
7. **Autonomous Playwright UI Verifier** (`scripts/verify-ui.mjs`) for headless multi-viewport browser testing.
8. **Instagram Reels Archive** (`media/reels/`) with 4 fully transcribed and documented reels.

---

## 📁 The 6-File Vibe Coding Architecture (`docs/`)

As demonstrated in Instagram Reel 4 (`@avani.codes`), every well-structured AI coding project should have 6 control files inside `docs/`:

```text
your-project/
├── docs/
│   ├── PRD.md              # Product requirements, problem statement, MVP features
│   ├── ARCHITECTURE.md     # High-level architecture, tech stack table, folder structure, Graphify hooks
│   ├── RULES.md            # Coding standards, TypeScript rules, atomic edit constraints
│   ├── DESIGN.md           # Color palette, typography scales, component standards, dark mode
│   ├── TASKS.md            # Phased roadmap, priority levels, status tracking (feed 1-by-1 to AI)
│   └── MEMORY.md           # Session memory, active tasks, Architectural Decision Records (ADRs)
└── src/
```

### 1-Click Project Scaffolding
To instantly generate this structure in any project:
```powershell
powershell -ExecutionPolicy Bypass -File E:\git_desktop\ai-agents-skills-vault\scripts\init-project-docs.ps1 -TargetDir "C:\path\to\your\project"
```

---

## 🔄 1-Click Safe Weekly Auto-Updater & Upstream Sync

To pull the latest upstream releases safely without destroying your custom skills or local database:

### Option A: Double-Click (Windows Explorer)
Simply double-click:
```text
update-weekly.bat
```

### Option B: PowerShell
```powershell
powershell -ExecutionPolicy Bypass -File .\scripts\auto_update_weekly.ps1
```

### What It Does (Non-Destructive Guarantee):
1. **Safety Snapshot**: Automatically backs up current catalogs and configs to `backups/pre-update/<timestamp>/`.
2. **Fetches Upstream Packages**: Runs `npx skills update -g -y` to upgrade packages from Vercel Labs, Emil Kowalski, Leonxlnx, Neon, Sentry, Composio, etc.
3. **Updates Impeccable**: Runs `npx impeccable update` to refresh the design engine and lint rules.
4. **Merges Local Skills**: Detects newly created skills in Antigravity or `.agents` and safely copies them into the vault.
5. **Rebuilds Catalog**: Executes `scripts/build_catalog.py` to regenerate `SKILLS_CATALOG.md`.
6. **Automated Git Commit**: Stages all changes and commits them with a timestamped message.

---

## 🚀 1-Click Disaster Recovery (Restore)

When setting up a **new laptop**, **fresh OS**, or restoring accidentally deleted skills:

### Option A: Double-Click (Windows Explorer)
Simply double-click:
```text
restore-skills.bat
```

### Option B: PowerShell
```powershell
powershell -ExecutionPolicy Bypass -File .\restore-skills.ps1
```

---

## 🧪 Limitless Automated Testing & UI Verification (`scripts/verify-ui.mjs`)

To ensure web apps, Next.js sites, and UI components built by AI agents work flawlessly without manual intervention:

```bash
# Run automated multi-viewport, console error & layout audit
node scripts/verify-ui.mjs http://localhost:3000
```

### What It Audits Automatically:
1. **Multi-Viewport Audit**: Tests across Mobile (390x844 iPhone), Tablet (768x1024 iPad), and Desktop (1440x900 MacBook).
2. **Console Sentinel**: Traps unhandled JavaScript exceptions, runtime errors, and Next.js SSR hydration mismatches (`Text content did not match server-rendered HTML`).
3. **Network Watchdog**: Catches 404/500 broken assets, missing images, and failed API endpoints.
4. **Layout Overflow Check**: Programmatically catches unintended horizontal scrollbars on mobile screens (`scrollWidth > innerWidth`).
5. **Visual Proof**: Captures full-page screenshots into `.test-results/` for instant design inspection.
6. **Agent Self-Healing Loop**: Exits with clean code 0 on pass, or returns detailed diagnostics on failure so AI agents can auto-heal and re-test until completely green.

---

## 🎨 Brand Design Systems Catalog (`design-systems/`)

The vault includes **161 curated brand design system definitions** in `DESIGN.md` format (analyzed from top brands):
- **Fintech & Payments**: Stripe, Revolut, Coinbase, Binance, Wise, Mastercard.
- **Developer Tools**: Linear, Vercel, Supabase, GitHub, Raycast, Resend, Sentry, ClickHouse.
- **Consumer Tech & Big Tech**: Apple, Tesla, Meta, SpaceX, IBM, Ferrari, Nike.
- **Productivity & Workspace**: Notion, Slack, Airtable, Miro, Cal.com, Webflow.

---

## 📚 Featured Tools & References (`references/`)

| Reference Guide | Summary | Upstream Repo |
|---|---|---|
| [`open-code-review.md`](references/open-code-review.md) | Alibaba hybrid deterministic (NPE, thread-safety, SQLi) + LLM code review | [alibaba/open-code-review](https://github.com/alibaba/open-code-review) |
| [`higgsfield-ai.md`](references/higgsfield-ai.md) | Fault-tolerant GPU orchestration & AI video/creative agent skills | [higgsfield-ai/higgsfield](https://github.com/higgsfield-ai/higgsfield) |
| [`obsidianmd.md`](references/obsidianmd.md) | JSON Canvas infinite spatial format, headless sync, and plugin APIs | [obsidianmd/jsoncanvas](https://github.com/obsidianmd/jsoncanvas) |
| [`public-apis.md`](references/public-apis.md) | Massive directory of free, public APIs for web and app MVPs | [public-apis/public-apis](https://github.com/public-apis/public-apis) |
| [`open-design.md`](references/open-design.md) | DeepSeek Harness Design Plugin & open-source Claude Design alternative | [nexu-io/open-design](https://github.com/nexu-io/open-design) |
| [`scrapling.md`](references/scrapling.md) | Undetectable, ultra-fast Python web scraper with adaptive selectors | [d4vinci/Scrapling](https://github.com/d4vinci/Scrapling) |
| [`awesome-llm-apps.md`](references/awesome-llm-apps.md) | Production-grade AI agent, RAG, and multimodal app templates | [shubhamsaboo/awesome-llm-apps](https://github.com/shubhamsaboo/awesome-llm-apps) |
| [`free-for-dev.md`](references/free-for-dev.md) | Massive list of SaaS/PaaS/IaaS with generous free developer tiers | [ripienaar/free-for-dev](https://github.com/ripienaar/free-for-dev) |
| [`watermelon-ui.md`](references/watermelon-ui.md) | Prebuilt UI components and dashboard layouts | [WatermelonCorp/watermelon-platform](https://github.com/WatermelonCorp/watermelon-platform) |
| [`motion-primitives.md`](references/motion-primitives.md) | Framer Motion animation primitives & micro-interactions | [ibelick/motion-primitives](https://github.com/ibelick/motion-primitives) |
| [`agent-browser.md`](references/agent-browser.md) | Vercel Labs lightweight agentic browser automation runtime | [vercel-labs/agent-browser](https://github.com/vercel-labs/agent-browser) |

---

## 📝 Curated Prompts Library (`prompts/`)

Includes **864 specialized prompts** from Sabrina Ramonov (`prompts/sabrina-ramonov/`):
- **AI Text Humanizer** ([`transforming_ai_text.md`](prompts/sabrina-ramonov/transforming_ai_text.md)): Transforms AI text to read authentically human, bypassing AI detectors and eliminating clichés.
- **Security Engineering**: [`write_semgrep_rule.md`](prompts/sabrina-ramonov/write_semgrep_rule.md), [`write_nuclei_template_rule.md`](prompts/sabrina-ramonov/write_nuclei_template_rule.md).
- **Architecture & Visualizations**: Markmap data visualizers, Mermaid diagrams, PR summaries, and diff analyzers.

---

## 🎬 Instagram Reels Featured Skills & Tools Archive (`media/reels/`)

Documented and archived in [`media/reels/`](media/reels/):
- **Reel 1 (@baptisteodonovan)**: UI UX Pro Max, Taste Skill, Awesome Claude Design, design-md-chrome, Motion Principles.
- **Reel 2 (@kevin.snippet)**: Lenis Smooth Scroll, GSAP Text Reveal & Timelines, React Bits component library.
- **Reel 3 (@david_knowsai)**: Ponytail (clean code), OmniRoute (smart routing & token budget), RTK / Omni-Context-RTK (90% terminal noise reduction), Graphify (71x context token compression), and 25 Addy Osmani software engineering agent skills.
- **Reel 4 (@avani.codes)**: The 6 Essential Vibe Coding Files under `docs/` (`PRD.md`, `ARCHITECTURE.md`, `RULES.md`, `DESIGN.md`, `TASKS.md`, `MEMORY.md`), full transcript, frame-by-frame breakdown, and Graphify workflow.

---

## 📖 Master Skills Catalog

Check [`SKILLS_CATALOG.md`](SKILLS_CATALOG.md) for the complete, searchable directory of **1,938+ skills** organized across 10 major technical domains.
