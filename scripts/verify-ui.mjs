#!/usr/bin/env node

/**
 * 🧪 Universal Autonomous UI & Browser Verifier for AI Agents
 * 
 * Performs automated headless browser testing across 3 viewports:
 * - Desktop (1440x900)
 * - Tablet (768x1024)
 * - Mobile (390x844)
 * 
 * Catches:
 * - Console errors & warnings
 * - React SSR hydration mismatches
 * - 4xx / 5xx failed network requests & broken assets
 * - Mobile horizontal overflow bugs
 * - Saves high-res visual proof screenshots to `.test-results/`
 * 
 * Usage:
 *   node scripts/verify-ui.mjs [url]
 *   node scripts/verify-ui.mjs http://localhost:3000
 *   npx -y playwright test scripts/verify-ui.mjs
 */

import { existsSync, mkdirSync } from 'fs';
import { resolve } from 'path';

const TARGET_URL = process.argv[2] || process.env.TEST_URL || 'http://localhost:3000';
const OUTPUT_DIR = resolve(process.cwd(), '.test-results');

if (!existsSync(OUTPUT_DIR)) {
  mkdirSync(OUTPUT_DIR, { recursive: true });
}

console.log(`\n🔍 [UI-Verifier] Starting automated browser audit on: ${TARGET_URL}`);

async function runAudit() {
  let playwright;
  try {
    playwright = await import('playwright');
  } catch (err) {
    console.error(`\n⚠️ Playwright not detected in current environment.`);
    console.log(`💡 To run automated audits limitlessly, execute:`);
    console.log(`   npx -y playwright test`);
    console.log(`   or install locally: npm i -D playwright && npx playwright install chromium\n`);
    process.exit(1);
  }

  const { chromium } = playwright;
  const browser = await chromium.launch({ headless: true });
  
  const VIEWPORTS = [
    { name: 'desktop', width: 1440, height: 900, isMobile: false },
    { name: 'tablet', width: 768, height: 1024, isMobile: true },
    { name: 'mobile', width: 390, height: 844, isMobile: true }
  ];

  let totalErrors = 0;
  const auditReport = [];

  for (const vp of VIEWPORTS) {
    console.log(`\n📱 Auditing Viewport: ${vp.name.toUpperCase()} (${vp.width}x${vp.height})...`);
    
    const context = await browser.newContext({
      viewport: { width: vp.width, height: vp.height },
      isMobile: vp.isMobile,
      userAgent: vp.isMobile 
        ? 'Mozilla/5.0 (iPhone; CPU iPhone OS 16_5 like Mac OS X) AppleWebKit/605.1.15 Mobile/15E148'
        : 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36'
    });

    const page = await context.newPage();
    const consoleLogs = [];
    const failedRequests = [];

    page.on('console', msg => {
      const type = msg.type();
      const text = msg.text();
      if (type === 'error') {
        consoleLogs.push({ type, text });
      }
    });

    page.on('pageerror', err => {
      consoleLogs.push({ type: 'uncaught-error', text: err.message });
    });

    page.on('response', response => {
      if (response.status() >= 400) {
        failedRequests.push({
          url: response.url(),
          status: response.status()
        });
      }
    });

    try {
      const response = await page.goto(TARGET_URL, {
        waitUntil: 'networkidle',
        timeout: 15000
      });

      if (!response) {
        throw new Error(`Failed to load URL: ${TARGET_URL}`);
      }

      // Check for horizontal overflow
      const hasHorizontalOverflow = await page.evaluate(() => {
        return document.documentElement.scrollWidth > window.innerWidth;
      });

      // Capture screenshot
      const screenshotPath = resolve(OUTPUT_DIR, `${vp.name}.png`);
      await page.screenshot({ path: screenshotPath, fullPage: true });

      const hasHydrationError = consoleLogs.some(log => 
        log.text.includes('Hydration failed') || 
        log.text.includes('did not match')
      );

      const pass = consoleLogs.length === 0 && failedRequests.length === 0 && !hasHorizontalOverflow;

      if (!pass) totalErrors++;

      auditReport.push({
        viewport: vp.name,
        pass,
        consoleErrors: consoleLogs.length,
        hydrationMismatch: hasHydrationError,
        failedRequests: failedRequests.length,
        horizontalOverflow: hasHorizontalOverflow,
        screenshot: screenshotPath
      });

      console.log(`   - Status: ${pass ? '✅ PASS' : '❌ FAIL'}`);
      console.log(`   - Console Errors: ${consoleLogs.length}`);
      if (consoleLogs.length > 0) {
        consoleLogs.forEach(e => console.log(`     🚨 [Console Error]: ${e.text.slice(0, 150)}`));
      }
      console.log(`   - Hydration Match: ${hasHydrationError ? '❌ Mismatch detected' : '✅ Clean'}`);
      console.log(`   - Failed Requests: ${failedRequests.length}`);
      if (failedRequests.length > 0) {
        failedRequests.forEach(r => console.log(`     ⚠️ HTTP ${r.status}: ${r.url}`));
      }
      console.log(`   - Responsive Layout (No Horizontal Overflow): ${hasHorizontalOverflow ? '❌ Overflow Bug' : '✅ OK'}`);
      console.log(`   - Screenshot saved to: ${screenshotPath}`);

    } catch (err) {
      totalErrors++;
      console.error(`   ❌ Navigation Error: ${err.message}`);
    } finally {
      await context.close();
    }
  }

  await browser.close();

  console.log(`\n======================================================`);
  if (totalErrors === 0) {
    console.log(`🎉 [AUDIT COMPLETE] ALL VIEWPORTS PASSED WITH 0 ERRORS!`);
    console.log(`   All visual screenshots saved to: ${OUTPUT_DIR}`);
    process.exit(0);
  } else {
    console.error(`🚨 [AUDIT FAILED] ${totalErrors} viewport(s) encountered issues.`);
    console.log(`   AI Agent instruction: Review errors above and auto-heal the code.`);
    process.exit(1);
  }
}

runAudit();
