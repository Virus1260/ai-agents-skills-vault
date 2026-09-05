# 🌐 Agent Browser — Vercel Labs Autonomous Browser Client

- **Repository**: [https://github.com/vercel-labs/agent-browser](https://github.com/vercel-labs/agent-browser)
- **Description**: Lightweight, agentic browser automation runtime for coding agents to navigate, test, and extract data autonomously without requiring human intervention.

---

## 🎯 Key Capabilities
- **Local Dev Server Auto-Detection**: Connects directly to Next.js / Vite / Remix dev servers on `localhost:3000`, `localhost:5173`, etc.
- **Autonomous User Flows**: Navigates routes, clicks buttons, types into inputs, triggers form submissions, and interacts with modals and dropdowns.
- **Console & Network Interception**: Listens to `console.error`, unhandled promise rejections, React hydration errors, and 4xx/5xx network failures in real time.
- **Responsive Viewport Testing**: Dynamically resizes to Mobile (375x667), Tablet (768x1024), and Desktop (1440x900) to detect layout breaks, text clipping, and overflow issues (`scrollWidth > innerWidth`).
- **Screenshot Evidence**: Captures full-page and element-level screenshots for multimodal verification.

---

## 🛠️ Usage Patterns for AI Coding Agents

### 1. Dev Server Health & Route Smoke Test
```bash
# Agent navigates to local route and captures DOM status + HTTP code
agent-browser navigate "http://localhost:3000" --wait-until "networkidle"
```

### 2. Interactive Flow Validation (Clicking & Form Submissions)
```bash
agent-browser click "button[type='submit']"
agent-browser fill "input[name='email']" "test@example.com"
agent-browser assert-text ".status-badge" "Success"
```

### 3. Responsive Layout Check
```bash
# Mobile breakpoint check
agent-browser viewport 375 667
agent-browser screenshot ./screenshots/mobile-view.png

# Desktop breakpoint check
agent-browser viewport 1440 900
agent-browser screenshot ./screenshots/desktop-view.png
```

### 4. Closed-Loop Self-Healing
If `agent-browser` detects a React hydration mismatch or console error:
1. Agent reads the exact error and stack trace from the output.
2. Identifies the offending file and line.
3. Fixes the issue immediately.
4. Reruns `agent-browser` to confirm the fix with 100% confidence.
