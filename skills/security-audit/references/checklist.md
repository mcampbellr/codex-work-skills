# Security audit checklist

Apply only relevant sections.

## Identity and access

- Authentication state, token lifecycle, session invalidation, MFA and recovery paths
- Authorization at every server-side object and action boundary
- Tenant isolation, role changes, administrative paths, and confused-deputy flows
- CSRF, CORS, cookie flags, redirects, and origin assumptions

## Input, output, and execution

- Injection into SQL, shells, templates, paths, headers, logs, and interpreters
- Deserialization, file upload, archive extraction, MIME handling, and SSRF
- XSS and unsafe rendering across browser, email, PDF, Markdown, and rich text
- Validation differences between client, API, worker, and persistence layers

## Data and cryptography

- Sensitive data collection, transport, storage, retention, logs, backups, and deletion
- Secret sourcing and rotation; never print secret values
- Approved primitives, key management, randomness, nonce or IV use, and password hashing
- Privacy boundaries and accidental disclosure through errors, analytics, or caches

## Business logic and resilience

- Replay, race conditions, duplicate requests, idempotency, limits, and state transitions
- Payment, entitlement, approval, refund, and account-recovery invariants
- Fail-open behavior, resource exhaustion, queue abuse, and unsafe retries
- Audit trail integrity and security-event observability

## Supply chain and deployment

- Lockfiles, version pins, install scripts, registries, provenance, and dependency scope
- CI permissions, artifact integrity, release authority, branch protection assumptions
- Container privileges, network exposure, IAM, storage policies, and environment separation
- Debug modes, default credentials, sample data, public buckets, and overly broad secrets

## Validation standard

A finding needs a reachable path, a missing or ineffective control, a meaningful impact, and evidence from the actual target. If any element is unknown, label the candidate unverified and state what evidence would resolve it.
