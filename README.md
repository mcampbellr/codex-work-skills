# Codex Work Skills

A small, portable skill pack for evidence-based code review, security work, and production triage.

## Included skills

- `superreview` — deep, read-only review of a change set. Vendored from Brewcode under MIT.
- `security-audit` — threat-aware source and configuration audit with evidence-backed findings.
- `dependency-risk-audit` — dependency, lockfile, supply-chain, license, and update-risk review.
- `incident-triage` — read-only incident diagnosis focused on containment, evidence, and handoff.

## Install

Clone this repository, then install for Codex, Claude Code, or both:

```bash
git clone https://github.com/mcampbellr/codex-work-skills.git
cd codex-work-skills
./install.sh --agent both
```

By default the installer copies every skill and refuses to overwrite an existing skill. Use
`--skill NAME` more than once to install a subset. Use `--replace` to move an existing skill to a
timestamped backup before installing the new copy.

```bash
./install.sh --agent codex --skill superreview --skill security-audit
./install.sh --agent claude --replace
./install.sh --list
```

Restart the agent after installation so it reloads the skill inventory.

## Update

```bash
git pull --ff-only
./install.sh --agent both --replace
```

The installer never reads credentials and the repository contains no secrets or machine-specific
configuration.

## License

Original content in this repository is MIT licensed. `superreview` retains its upstream MIT
copyright; see [THIRD_PARTY_NOTICES.md](THIRD_PARTY_NOTICES.md).
