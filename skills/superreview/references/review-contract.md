# Native review contract

## Scope and evidence

Resolve scope in this order: explicit whole-project request, explicit file/folder/revision/range, dirty working tree, recent commits. Derive the default branch from repository refs, not a hardcoded assumption; distinguish a branch comparison from a single-commit review. Include staged, unstaged, added, deleted, and untracked files. Inspect renamed/deleted paths through the selected diff and its base revision.

Use `git status --short`, `git diff`, and `git ls-files` for change discovery; use `rg --files --hidden` plus targeted filesystem checks for explicit instruction targets. Git ignore status is a discovery signal, never an exclusion from an explicitly requested scope. Include ignored instructions when they are an explicit target or needed authority; avoid broad traversal of secrets, runtime state, generated output, and caches. Record excluded paths and reasons; do not silently discard requested files.

Freeze the selected diff or revisions and record relevant content hashes for untracked or ignored targets. Re-read cited lines before final validation; concurrent edits invalidate stale observations. Read reachable implementation and callers beyond the target only to establish behavior, reuse, or absence; those reads do not widen finding targets.

Run applicable existing build, lint, type, test, and validator commands once, using an isolated workspace where checks write generated files. Record command, working directory, revision, exit status, and useful output. Report unavailable checks as not run. Avoid dependency installs, external writes, releases, or fixes during review.

## Intent procedure

1. Collect the latest explicit user request, linked acceptance criteria, approved decisions, and applicable project policy. Read external issue or PR data only when available and authorized.
2. Build a compact requested-to-delivered map: requirement and source -> implementing path and behavior -> evidence -> delivered, partial, missing, or unknown.
3. Compare the delivered diff against that map: extra behavior, unrelated refactoring or dependencies, shared contracts, missing criteria, and unsupported completion claims.
4. For alleged absence, quote the criterion and search concepts and synonyms across implementation, wiring, and tests. An empty diff or one empty search is insufficient.
5. If no sanctioned baseline is discoverable, label it UNKNOWN. Do not assert unauthorized scope or under-delivery from guesses.
6. If a PR or closeout exists, compare its claims and validation with actual evidence. Review never edits closeout records.

## Passes and validation

Perform three distinct passes:

- Simplification and reuse: search existing modules, standard library, imported libraries, templates, and canonical contracts before proposing a new abstraction.
- Correctness and safety: examine regressions, contracts, errors, persistence, authentication, authorization, secrets, concurrency, and boundary behavior.
- Maintainability and clarity: assess ownership, unnecessary complexity, explicit contracts, discoverability, documentation drift, and meaningful tests.

When delegation is available and authorized, assign disjoint bounded file groups to matching project reviewers and independently validate material candidates. Otherwise perform a separate second verification pass and state that it was not independent agent validation.

Every finding must include a concrete trigger, observed behavior, evidence, reachable impact, priority, and the smallest adequate correction. Use priorities:

- P0: reachable outage, data loss, serious breach, or proven critical requirement failure.
- P1: significant incorrect behavior or boundary violation.
- P2: material maintenance, reuse, scope, or test gap.
- P3: localized low-impact improvement.

For each candidate, re-read cited code, check the trigger and callers, seek counterexamples and existing coverage, and verify requirement authority and impact. Mark it CONFIRMED, REJECTED with reason, or UNVALIDATED. Never silently drop an unvalidated material candidate or call an incomplete review clean.

The report records input, scope and revisions, depth, baseline, passes or agents, checks run and not run, requested-to-delivered coverage, confirmed findings sorted P0 through P3, unresolved candidates, rejected findings with reasons, exclusions, limitations, and suggested next actions.
