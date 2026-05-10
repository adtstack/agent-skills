#!/bin/bash
# Import all 15 skills from adtstack/agent-skills and attach to an agent.
#
# Usage:
#   ./import-skills.sh                        # import only, no attach
#   ./import-skills.sh <agent-id>             # import + attach to agent
#   ./import-skills.sh <agent-id> --dry-run   # preview without executing
#
# Prerequisites: multica CLI installed and authenticated (multica login)

set -uo pipefail

REPO="https://github.com/adtstack/agent-skills/tree/main"
SKILLS=(
  brainstorming
  systematic-debugging
  writing-plans
  requesting-code-review
  test-driven-development
  finishing-a-development-branch
  using-git-worktrees
  dispatching-parallel-agents
  writing-skills
  subagent-driven-development
  executing-plans
  find-skills
  web-design-guidelines
  vercel-react-best-practices
  skill-creator
)

DRY_RUN=false
AGENT_ID=""

for arg in "$@"; do
  case "$arg" in
    --dry-run) DRY_RUN=true ;;
    *) AGENT_ID="$arg" ;;
  esac
done

if [[ -z "$AGENT_ID" ]]; then
  echo "No agent ID provided. Will import skills only (no attach)."
  echo "Usage: $0 [--dry-run] [<agent-id>]"
  echo ""
fi

if ! command -v multica &>/dev/null; then
  echo "Error: multica CLI not found. Install with: https://multica.ai/docs/cli"
  exit 1
fi

echo "=== Importing ${#SKILLS[@]} skills ==="
IMPORTED_IDS=()

for skill in "${SKILLS[@]}"; do
  URL="$REPO/$skill"
  if $DRY_RUN; then
    echo "[DRY RUN] multica skill import --url $URL"
    IMPORTED_IDS+=("dry-run")
    continue
  fi
  echo -n "  $skill... "
  RESULT=$(multica skill import --url "$URL" 2>&1 || true)
  SKILL_ID=$(echo "$RESULT" | { grep -o '"id":"[a-f0-9-]\{36\}"' || true; } | head -1 | cut -d'"' -f4)
  if [[ -n "$SKILL_ID" ]]; then
    IMPORTED_IDS+=("$SKILL_ID")
    echo "OK ($SKILL_ID)"
  elif echo "$RESULT" | grep -q "already exists"; then
    echo "EXISTS"
    IMPORTED_IDS+=("skip")
  else
    echo "FAILED"
    echo "    $RESULT" | head -2
    IMPORTED_IDS+=("skip")
  fi
done

OK_COUNT=0
for id in "${IMPORTED_IDS[@]}"; do
  [[ "$id" != "skip" && "$id" != "dry-run" ]] && ((OK_COUNT++)) || true
done
echo "Imported/Fetched: ${#IMPORTED_IDS[@]} total"

if [[ -n "$AGENT_ID" ]]; then
  ATTACH_IDS=()
  for id in "${IMPORTED_IDS[@]}"; do
    [[ "$id" != "skip" && "$id" != "dry-run" ]] && ATTACH_IDS+=("$id")
  done

  if $DRY_RUN; then
    echo "[DRY RUN] Would attach ${#ATTACH_IDS[@]} skills to agent $AGENT_ID"
  else
    IDS_CSV=$(IFS=,; echo "${ATTACH_IDS[*]}")
    echo "Attaching ${#ATTACH_IDS[@]} skills to agent $AGENT_ID..."
    multica agent skills set "$AGENT_ID" --skill-ids "$IDS_CSV"
    echo "Attached."
  fi
fi
