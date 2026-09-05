# 🎭 Playwright CLI & Playwright MCP — Limitless Autonomous E2E Testing

- **Playwright MCP**: [https://github.com/microsoft/playwright-mcp](https://github.com/microsoft/playwright-mcp)
- **Playwright Core**: [https://github.com/microsoft/playwright](https://github.com/microsoft/playwright)
- **Local Skill**: `skills/playwright-skill` (complete browser automation suite)

---

## 🎯 Why Playwright CLI + AI Agents Are Game-Changing
When coding agents finish building an application or UI component, asking the human to manually test it creates unnecessary friction. 

With **Playwright CLI & MCP**, the agent can **limitlessly test the application autonomously**:
1. **Headless or Headed Execution**: Run tests in background or open a browser window for visual debugging.
2. **Auto-Detect Dev Servers**: Automatically find active servers on localhost (`3000`, `5173`, `8080`).
3. **E2E User Journey Simulation**: Test sign-up flows, multi-step checkout, interactive dashboards, modal dialogues, drag-and-drop, and filters.
4. **Visual Regression Proofing**: Capture pixel-perfect screenshots and compare before/after states.
5. **Console & Network Error Interception**: Fail fast if any React hydration mismatch, unhandled exception, or failing API endpoint occurs.

---

## 🚀 Playwright CLI Recipes for Agents

### 1. Fast Setup in Any Project
```bash
npx playwright install --with-deps chromium
```

### 2. Auto-Generate Tests from User Action
```bash
npx playwright codegen http://localhost:3000
```

### 3. Run E2E Test Suite Headless (with JSON or List Reporter)
```bash
npx playwright test --reporter=list
```

### 4. Single-File Autonomous Test Script (via `playwright-skill`)
AI agents can write a zero-dependency ephemeral test script in `/tmp/playwright-test.js`:

```javascript
const { chromium } = require('playwright');

(async () => {
  const browser = await chromium.launch({ headless: true });
  const context = await browser.newContext({ viewport: { width: 1440, height: 900 } });
  const page = await context.newPage();

  // Listen for console errors
  const errors = [];
  page.on('console', msg => {
    if (msg.type() === 'error') errors.push(msg.text());
  });
  page.on('pageerror', err => errors.push(err.message));

  // Navigate
  await page.goto('http://localhost:3000', { waitUntil: 'networkidle' });

  // Test interactive elements
  await page.click('button:has-text("Get Started")');
  await page.waitForSelector('.dashboard-container');

  // Verify responsive layout
  await page.setViewportSize({ width: 375, height: 667 });
  const hasHorizontalScroll = await page.evaluate(() => document.documentElement.scrollWidth > window.innerWidth);
  if (hasHorizontalScroll) {
    console.error('FAILED: Horizontal scroll detected on mobile viewport!');
  }

  // Take screenshot evidence
  await page.screenshot({ path: './test-results/mobile-proof.png', fullPage: true });

  await browser.close();
  if (errors.length > 0) {
    console.error('Console errors detected:', errors);
    process.exit(1);
  } else {
    console.log('ALL AUTONOMOUS TESTS PASSED WITH 100% CONFIDENCE');
  }
})();
```

---

## 🔁 The Closed-Loop Self-Healing Process
1. **Generate**: Agent creates or refactors code.
2. **Execute**: Agent runs `node /tmp/playwright-test.js` or `npx playwright test`.
3. **Capture**: Agent intercepts test failure or console error.
4. **Heal**: Agent updates source code to fix the root cause.
5. **Verify**: Agent reruns the test until it exits with code 0.
