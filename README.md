# 🛡️ AI Agents Skills Vault & Universal Disaster Recovery System

> **A single-source-of-truth, 1-click restore, and continuous upstream tracking system for 1,032+ AI coding agent skills across Antigravity (Gemini), Claude Code, Cursor, Codex, Windsurf, Devin, and OpenHands.**

[![Tracked Skills](https://img.shields.io/badge/Tracked%20Skills-1032+-brightgreen.svg)](#-master-skills-catalog)
[![Design Systems](https://img.shields.io/badge/DESIGN.md%20Tokens-161%20Brands-blue.svg)](#-brand-design-systems-catalog-design-systems)
[![1-Click Restore](https://img.shields.io/badge/Disaster%20Recovery-1--Click%20Restore-orange.svg)](#-1-click-disaster-recovery-restore)
[![Upstream Sync](https://img.shields.io/badge/Auto--Updater-1--Click%20Upstream%20Sync-purple.svg)](#-1-click-auto-updater--upstream-tracker)

---

## ⚡ Master Chat Initialization Prompt (Copy & Paste to Any New Chat)

> **Copy and paste this exact prompt at the start of any new chat session** in **Antigravity**, **Claude Code**, **Cursor**, **Codex**, **Windsurf**, **Devin**, or **ChatGPT**. It instantly activates awareness of your entire 1,032+ skill vault, 161 brand design systems, prebuilt UI component libraries, and clean-code engineering rules:

```text
You are an expert full-stack developer and elite UI/UX design engineer paired with me.

Before generating code or planning any architecture, be aware of my global system context, tools, and local skills vault:

1. LOCAL SKILLS VAULT (1,032+ Modular Skills):
   - Located at: E:\git_desktop\ai-agents-skills-vault\skills\ and ~/.gemini/config/skills/ (or ~/.agents/skills/, ~/.cursor/, ~/.claude/).
   - Always check and invoke relevant skills for any task (e.g. taste-skill, ui-ux-pro-max, impeccable, emil-design-eng, animate, ponytail, omni-context-rtk, addyosmani/agent-skills).

2. DESIGN SYSTEMS & ANTI-AI-SLOP DIRECTIVE:
   - Never generate generic, boring, or cookie-cutter UI ("AI slop").
   - You have access to 161 brand DESIGN.md specs at E:\git_desktop\ai-agents-skills-vault\design-systems\ (Stripe, Linear, Apple, Vercel, Supabase, GitHub, Raycast, etc.).
   - Whenever building UI, pick and strictly adhere to the best brand tokens (color palettes, typography, spacing, border radiuses, dark/light themes, elevation).
   - Leverage top-tier animation & component primitives:
     * Watermelon UI (ui.watermelon.sh) — Prebuilt dashboard components & modular blocks.
     * React Bits (reactbits.dev) — 134+ interactive cards, accordion galleries, spotlights, background beams.
     * Motion Primitives (motion-primitives.com) & Emil Kowalski skills — Spring physics, layout animations, micro-interactions.
     * Lenis (@studio-freight/lenis) + GSAP ScrollTrigger — Butter-smooth momentum scrolling and timeline reveals.
     * Shadcn UI & Radix Primitives — Accessible component foundations.

3. CLEAN ARCHITECTURE & TOKEN EFFICIENCY:
   - Follow Ponytail principles: keep code atomic, concise, and minimal; avoid bloated abstractions or speculative features.
   - Use OmniRoute & RTK patterns: reduce context noise and focus on high-signal output.
   - For web scraping, use Scrapling (d4vinci/Scrapling) or Playwright MCP over brittle parsers.
   - For free infrastructure and external APIs, consult Public APIs (public-apis/public-apis) and Free-for-dev (ripienaar/free-for-dev).

OPERATING INSTRUCTION:
Acknowledge this ecosystem in 1 concise sentence, identify the best skills and design systems relevant to my upcoming request, and then deliver production-ready, world-class code.
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

**This repository solves that forever.** It unifies all 953+ skills in one version-controlled Git repository with:
1. **1-Click Disaster Recovery** (`restore-skills.bat` / `restore-skills.ps1`) to rebuild your entire setup in seconds.
2. **1-Click Upstream Tracking & Git Sync** (`update-skills.bat` / `update-skills.ps1`) to pull the latest versions from upstream GitHub/npm sources and auto-commit changes.
3. **161 Brand Design Systems** (`design-systems/`) with ready-to-use `DESIGN.md` tokens for Stripe, Linear, Apple, Vercel, etc.
4. **Curated Awesome Tool References** (`references/`) covering Public APIs, Scrapling, LLM apps, free tiers, and browser automation.
5. **Instagram Post Carousel Archive** (`media/instagram_carousel/`) with 12 high-resolution slides extracted from the viral "10 GitHub Repos That Give You Superpowers" post.

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

### What It Restores Automatically:
- ✅ **Antigravity**: Restores all skills into `~/.gemini/config/skills`, rules into `~/.gemini/config/rules`, and MCP configuration into `~/.gemini/config/mcp_config.json`.
- ✅ **Agents CLI**: Restores all skills into `~/.agents/skills` and restores `~/.agents/.skill-lock.json` so `npx skills` recognizes all packages.
- ✅ **Cursor**: Restores skills into `~/.cursor/skills-cursor` and `~/.cursor/skills`.
- ✅ **Claude Code**: Restores skills into `~/.claude/skills`.
- ✅ **Codex**: Restores skills into `~/.codex/skills`.

---

## 🔄 1-Click Auto-Updater & Upstream Tracker

Never let your skills become stale or "dead". To pull the latest upstream releases and commit them:

### Option A: Double-Click (Windows Explorer)
Simply double-click:
```text
update-skills.bat
```

### Option B: PowerShell
```powershell
powershell -ExecutionPolicy Bypass -File .\update-skills.ps1
```

### What It Does:
1. **Fetches Upstream Packages**: Runs `npx skills update -g -y` to upgrade packages from Vercel Labs, Emil Kowalski, Leonxlnx, Neon, Sentry, Composio, etc.
2. **Updates Impeccable**: Runs `npx impeccable update` to refresh the design engine and lint rules.
3. **Pulls New Local Skills**: Detects any newly created skills in Antigravity or `.agents` and copies them into the vault.
4. **Rebuilds Catalog**: Executes `scripts/build_catalog.py` to regenerate `SKILLS_CATALOG.md`.
5. **Automated Git Commit**: Stages all changes and commits them with a timestamped message (e.g. `Auto-sync skills vault: 2026-09-05 10:30:00`).

---

## 🎨 Brand Design Systems Catalog (`design-systems/`)

The vault includes **161 curated brand design system definitions** in `DESIGN.md` format (analyzed from top brands):

- **Fintech & Payments**: Stripe, Revolut, Coinbase, Binance, Wise, Mastercard.
- **Developer Tools**: Linear, Vercel, Supabase, GitHub, Raycast, Resend, Sentry, ClickHouse.
- **Consumer Tech & Big Tech**: Apple, Tesla, Meta, SpaceX, IBM, Ferrari, Nike.
- **Productivity & Workspace**: Notion, Slack, Airtable, Miro, Cal.com, Webflow.

### How to use in any project:
Simply copy a brand's `DESIGN.md` file into your project root:
```bash
copy E:\git_desktop\ai-agents-skills-vault\design-systems\stripe\DESIGN.md .\DESIGN.md
```
Any coding agent (Antigravity, Claude, Cursor) reading your project will instantly adhere to the exact typography, color palettes, spacing, and micro-interactions of that brand.

---

## 📚 Featured Tools & References (`references/`)

| Reference Guide | Summary | Upstream Repo |
|---|---|---|
| [`public-apis.md`](references/public-apis.md) | Massive directory of free, public APIs for web and app MVPs | [public-apis/public-apis](https://github.com/public-apis/public-apis) |
| [`open-design.md`](references/open-design.md) | DeepSeek Harness Design Plugin & open-source Claude Design alternative | [nexu-io/open-design](https://github.com/nexu-io/open-design) |
| [`scrapling.md`](references/scrapling.md) | Undetectable, ultra-fast Python web scraper with adaptive selectors | [d4vinci/Scrapling](https://github.com/d4vinci/Scrapling) |
| [`awesome-llm-apps.md`](references/awesome-llm-apps.md) | Production-grade AI agent, RAG, and multimodal app templates | [shubhamsaboo/awesome-llm-apps](https://github.com/shubhamsaboo/awesome-llm-apps) |
| [`free-for-dev.md`](references/free-for-dev.md) | Massive list of SaaS/PaaS/IaaS with generous free developer tiers | [ripienaar/free-for-dev](https://github.com/ripienaar/free-for-dev) |
| [`ollama.md`](references/ollama.md) | Run local LLMs with OpenAI-compatible API endpoints | [ollama/ollama](https://github.com/ollama/ollama) |
| [`langflow.md`](references/langflow.md) | Visual canvas for multi-agent workflows and RAG pipelines | [langflow-ai/langflow](https://github.com/langflow-ai/langflow) |
| [`watermelon-ui.md`](references/watermelon-ui.md) | Prebuilt UI components and dashboard layouts | [WatermelonCorp/watermelon-platform](https://github.com/WatermelonCorp/watermelon-platform) |
| [`motion-primitives.md`](references/motion-primitives.md) | Framer Motion animation primitives & micro-interactions | [ibelick/motion-primitives](https://github.com/ibelick/motion-primitives) |
| [`playwright-mcp.md`](references/playwright-mcp.md) | MCP server for Playwright browser automation | [microsoft/playwright-mcp](https://github.com/microsoft/playwright-mcp) |
| [`agent-browser.md`](references/agent-browser.md) | Vercel Labs lightweight agentic browser automation runtime | [vercel-labs/agent-browser](https://github.com/vercel-labs/agent-browser) |

---

## 📸 Instagram Post Carousel Archive (`media/instagram_carousel/`)

All **12 high-resolution carousel slides** extracted from the viral post are safely stored in [`media/instagram_carousel/`](media/instagram_carousel/):

- `01_cover_10_github_repos.webp`: Cover ("10 GitHub Repos That Give You Superpowers")
- `02_01_public_apis.webp`: public-apis
- `03_02_awesome_mcp_servers.webp`: awesome-mcp-servers
- `04_03_open_design.webp`: open-design
- `05_04_awesome_llm_apps.webp`: awesome-llm-apps
- `06_05_awesome.webp`: awesome
- `07_06_scrapling.webp`: Scrapling
- `08_07_free_for_dev.webp`: free-for-dev
- `09_08_ollama.webp`: ollama
- `10_09_langflow.webp`: langflow
- `11_10_openhands.webp`: OpenHands
- `12_11_claude_prompts_outro.webp`: Claude Code Prompts Outro

---

## 🎬 Instagram Reels Featured Skills & Tools Archive (`media/reels/`)

Documented and archived in [`media/reels/`](media/reels/):
- **Reel 1 (@baptisteodonovan)**: UI UX Pro Max, Taste Skill, Awesome Claude Design, design-md-chrome, Motion Principles.
- **Reel 2 (@kevin.snippet)**: Lenis Smooth Scroll, GSAP Text Reveal & Timelines, React Bits component library.
- **Reel 3 (@david_knowsai)**: Ponytail (clean code), OmniRoute (smart routing & token budget), RTK / Omni-Context-RTK (90% terminal noise reduction), Graphify (71x context token compression), and 25 Addy Osmani software engineering agent skills.

---

## 📖 Master Skills Catalog

Check [`SKILLS_CATALOG.md`](SKILLS_CATALOG.md) for the complete, searchable directory of **953+ skills** organized across 10 major technical domains.

---

## 🔗 Connecting to GitHub (Optional Remote Backup)

To back up this repository to your remote GitHub account:
```bash
cd E:\git_desktop\ai-agents-skills-vault
git branch -M main
git remote add origin https://github.com/<YOUR_USERNAME>/<YOUR_REPO_NAME>.git
git push -u origin main
```
