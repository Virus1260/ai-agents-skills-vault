---
name: open-code-review
description: Automated enterprise-grade hybrid code review using Alibaba Open Code Review. Combines deterministic pipeline rules (NPE, thread-safety, XSS, SQLi) with LLM agent line-level comments. Use when user asks to "review my code", "audit git diff", "run code review", "check security in PR", or "evaluate staged changes".
metadata:
  author: alibaba
  version: "1.0.0"
  argument-hint: "[--staged | --branch <branch> | <file>]"
---

# Alibaba Open Code Review (`ocr`)

Enterprise-grade code review tool combining deterministic static rules with context-aware LLM agents.

## When to Use

Use this skill whenever:
- The user requests a code review on modified or staged files.
- Auditing a git branch or Pull Request before merging.
- Checking for Null Pointer Exceptions (NPE), concurrency race conditions, or memory leaks.
- Scanning for security vulnerabilities (SQL Injection, XSS, insecure deserialization, leaked tokens).
- Performing automated QA during pre-commit hooks.

## Quick Execution

### 1. Review Working Tree / Staged Changes
```bash
# Review current working tree changes
npx -y @alibaba-group/open-code-review review

# Review only staged changes before commit
npx -y @alibaba-group/open-code-review review --staged
```

### 2. Review Against Base Branch
```bash
# Review diff against main
npx -y @alibaba-group/open-code-review review --branch main
```

### 3. Review Single Target File
```bash
npx -y @alibaba-group/open-code-review review --file path/to/file.ts
```

## Review Standards & Rule Verification

The deterministic engine enforces:
1. **NPE Safety**: Ensure nullable values are guarded before access.
2. **Thread Safety**: Detect unlocked shared state in multi-threaded code.
3. **Security Vulnerabilities**: Check parameter binding for SQL, sanitize HTML/DOM output, prevent command injection.
4. **Line-Level Accuracy**: Ensure comments map to exact line numbers in the diff without positional drift.

## Agent Workflow

When invoked:
1. Identify the target files or git diff (`git status`, `git diff`).
2. Run `@alibaba-group/open-code-review` or apply the deterministic ruleset.
3. Group findings by Severity: `[CRITICAL]`, `[WARNING]`, `[SUGGESTION]`.
4. Provide immediate, exact diff fixes for any identified flaw.
