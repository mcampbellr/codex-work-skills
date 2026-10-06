---
name: superreview
description: Review a change set or explicit project scope for intent, correctness, safety, reuse, and maintainability; independently validate findings and produce one report without applying fixes.
---

# Superreview

Use the native review workflow in [references/review-contract.md](references/review-contract.md). This skill authorizes review and report artifacts only: never edit reviewed code, instructions, agents, skills, or configuration, including this skill itself. Suggest corrections separately.

Resolve the requested scope before work. Explicit paths, exclusions, revisions, and user narrowing win. Default to staged + unstaged + untracked changes; with a clean tree review the last two commits, falling back to one or the root commit. QUICK is the default; requests for depth, completeness, pre-merge, or release review select EXTENDED. Depth changes effort, never scope or mutation authority. Announce the concrete scope, depth, baseline, checks, and expected report.

Read applicable `AGENTS.md` instructions and their referenced rules explicitly. Reuse project check commands and live native reviewer roles. Do not create agent definitions or require a specific custom reviewer role.

Review in order: simplification/reuse assessment, correctness/safety, then maintainability/clarity. At both depths compare requested and delivered behavior using the intent procedure in the contract. EXTENDED adds bounded domain reviews and independent validation of every candidate; QUICK retains concrete evidence and independent validation for material findings and states its narrower coverage.

Write one deduplicated report at `.codex/reports/<YYYYMMDD-HHMMSS_superreview>/REPORT.md`, including findings, validation, checks, intent coverage, and limitations. Summarize the actionable result in the conversation language. Report missing checks/roles and incomplete validation explicitly; zero findings with missing coverage is not a clean review.
