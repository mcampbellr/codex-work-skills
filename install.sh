#!/usr/bin/env bash
set -euo pipefail

repo_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
agent=""
replace=false
list_only=false
declare -a selected=()

usage() {
  cat <<'EOF'
Usage: ./install.sh --agent codex|claude|both [options]

Options:
  --skill NAME   Install only this skill; repeat for multiple skills
  --replace      Back up an existing destination before installing
  --list         List bundled skills and exit
  -h, --help     Show this help
EOF
}

while (($#)); do
  case "$1" in
    --agent)
      [[ $# -ge 2 ]] || { echo "--agent requires a value" >&2; exit 2; }
      agent="$2"
      shift 2
      ;;
    --skill)
      [[ $# -ge 2 ]] || { echo "--skill requires a value" >&2; exit 2; }
      selected+=("$2")
      shift 2
      ;;
    --replace)
      replace=true
      shift
      ;;
    --list)
      list_only=true
      shift
      ;;
    -h|--help)
      usage
      exit 0
      ;;
    *)
      echo "Unknown option: $1" >&2
      usage >&2
      exit 2
      ;;
  esac
done

mapfile_portable() {
  while IFS= read -r line; do
    selected+=("$line")
  done
}

if [[ "$list_only" == true ]]; then
  find "$repo_dir/skills" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | sort
  exit 0
fi

case "$agent" in
  codex|claude|both) ;;
  *)
    echo "Choose --agent codex, claude, or both." >&2
    exit 2
    ;;
esac

if ((${#selected[@]} == 0)); then
  mapfile_portable < <(find "$repo_dir/skills" -mindepth 1 -maxdepth 1 -type d -exec basename {} \; | sort)
fi

declare -a roots=()
[[ "$agent" == codex || "$agent" == both ]] && roots+=("${CODEX_HOME:-$HOME/.codex}/skills")
[[ "$agent" == claude || "$agent" == both ]] && roots+=("${CLAUDE_HOME:-$HOME/.claude}/skills")

timestamp="$(date -u +%Y%m%dT%H%M%SZ)"

for skill in "${selected[@]}"; do
  [[ "$skill" =~ ^[a-z0-9-]+$ ]] || { echo "Invalid skill name: $skill" >&2; exit 2; }
  source_dir="$repo_dir/skills/$skill"
  [[ -f "$source_dir/SKILL.md" ]] || { echo "Unknown or invalid skill: $skill" >&2; exit 2; }

  for root in "${roots[@]}"; do
    mkdir -p "$root"
    destination="$root/$skill"
    if [[ -e "$destination" ]]; then
      if [[ "$replace" != true ]]; then
        echo "Refusing to overwrite $destination (use --replace)." >&2
        exit 1
      fi
      backup="${destination}.backup-${timestamp}"
      mv "$destination" "$backup"
      echo "Backed up $destination to $backup"
    fi
    cp -R "$source_dir" "$destination"
    echo "Installed $skill to $destination"
  done
done

echo "Restart your agent to reload installed skills."
