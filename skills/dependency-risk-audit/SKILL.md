---
name: dependency-risk-audit
description: Audit dependency manifests, lockfiles, registries, install scripts, licenses, and update exposure without changing versions. Use for explicit supply-chain reviews, upgrade planning, or pre-release dependency checks.
---

# Dependency risk audit

Perform a read-only audit. Do not update packages, regenerate lockfiles, install dependencies, execute package lifecycle scripts, or contact private registries unless the user explicitly authorizes that action.

Identify every package ecosystem in scope and its authoritative manifest and lockfile. Check for unlocked direct dependencies, floating container or action tags, duplicate versions, abandoned packages, unexpected registry sources, install hooks, vendored binaries, excessive runtime dependencies, and dependency confusion or typosquatting exposure.

Use the package manager's existing audit command only when it is non-mutating and dependencies are already available. Verify time-sensitive vulnerability and maintenance claims against primary sources such as the relevant advisory database, package registry, or upstream repository. Record the advisory identifier, affected range, installed version, reachability evidence, fix availability, and source date.

Separate findings into:

- confirmed reachable vulnerability;
- vulnerable package with unproven reachability;
- supply-chain or reproducibility weakness;
- license or policy concern;
- upgrade risk and compatibility work.

For each item, cite the manifest or lockfile location and recommend the smallest safe next step. Do not claim that an audit command proves exploitability, or that a clean advisory result proves the dependency tree is safe. State registries, platforms, optional dependencies, generated artifacts, or private sources that were not inspected.
