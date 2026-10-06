---
name: security-audit
description: Perform a read-only, evidence-based security audit of application code, infrastructure, configuration, or a change set. Use for explicit security reviews, threat-focused pre-release checks, or investigation of suspected vulnerabilities; do not use as a substitute for ordinary code review.
---

# Security audit

Audit the user-selected scope without changing product code, configuration, credentials, external systems, or findings. Read applicable repository instructions first. Resolve the exact target and trust boundaries before scanning.

Read [references/checklist.md](references/checklist.md) and select only the checks relevant to the technologies and exposed paths in scope. Prefer concrete data flows and reachable attack paths over generic checklists. Treat scanner output as leads that require source-level validation.

## Workflow

1. Establish the asset, entry points, actors, privilege boundaries, sensitive data, deployment assumptions, and explicit exclusions.
2. Inspect application code, configuration, infrastructure, dependencies, tests, and relevant call sites. Avoid opening known secret stores unless the user explicitly placed them in scope; report their presence without printing values.
3. Run existing non-mutating security checks when available. Do not install tools, update dependencies, exploit production systems, send traffic to third parties, or create accounts without explicit authorization.
4. Validate each candidate by proving the input path, missing or broken control, reachable sink, preconditions, and impact. Seek counterexamples and compensating controls.
5. Report findings first, ordered by severity. Distinguish confirmed vulnerabilities, hardening opportunities, scanner false positives, and unverified risks.

Each confirmed finding includes severity, CWE or OWASP mapping when genuinely applicable, affected path and line, attack scenario, evidence, impact, confidence, and the smallest viable remediation. Never include live secrets, exploit payloads that create unnecessary risk, or claims unsupported by the inspected code.

Use Critical only for reachable catastrophic impact such as broad compromise, material data loss, or authentication bypass. Use High for significant exploitable boundary failures, Medium for constrained but meaningful weaknesses, and Low for limited hardening gaps. State coverage gaps and checks not run; absence of findings is not proof of security.
