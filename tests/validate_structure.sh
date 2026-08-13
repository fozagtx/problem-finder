#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

required_files=(
  ".gitignore"
  "ARTICLE.md"
  "README.md"
  "LICENSE"
  "CLAUDE.md"
  "SUBMISSION.md"
  "install.sh"
  "install-custom.sh"
  "skill/SKILL.md"
  "skill/problem-workflow.md"
  "skill/workaround-map.md"
  "skill/signal-scores.md"
  "skill/framing-reject.md"
  "skill/sharpen.md"
  "skill/worked-example.md"
  "agents/problem-analyst.md"
  "agents/workaround-mapper.md"
  "agents/framing-rejector.md"
  "agents/skill-demo-coach.md"
  "commands/problem-sprint.md"
  "commands/map-workaround.md"
  "commands/reject-framing.md"
  "commands/skill-demo.md"
  "rules/no-solutioning.md"
  "tests/validate_structure.sh"
)

for file in "${required_files[@]}"; do
  if [[ ! -f "$ROOT_DIR/$file" ]]; then
    echo "Missing required file: $file" >&2
    exit 1
  fi
done

if ! grep -q '^name: problem-finder$' "$ROOT_DIR/skill/SKILL.md"; then
  echo "Missing skill name frontmatter." >&2
  exit 1
fi

if ! grep -q '^description: .*Use when ' "$ROOT_DIR/skill/SKILL.md"; then
  echo "Missing actionable description frontmatter." >&2
  exit 1
fi

for linked in problem-workflow.md workaround-map.md signal-scores.md framing-reject.md sharpen.md worked-example.md; do
  if ! grep -q "$linked" "$ROOT_DIR/skill/SKILL.md"; then
    echo "SKILL.md does not link $linked" >&2
    exit 1
  fi
done

bash -n "$ROOT_DIR/install.sh"
bash -n "$ROOT_DIR/install-custom.sh"
bash -n "$ROOT_DIR/tests/validate_structure.sh"

blocked_terms=(
  "$(printf "%s%s" "Co" "dex")"
  "$(printf "%s%s" "Anth" "ropic")"
  "$(printf "%s%s%s" "Co-Authored-" "By:" " ")"
  "$(printf "%s%s" "noreply@" "anthropic.com")"
)

for term in "${blocked_terms[@]}"; do
  if grep -R -n --exclude-dir=.git -- "$term" "$ROOT_DIR" >/tmp/problem_finder_hygiene.txt; then
    cat /tmp/problem_finder_hygiene.txt >&2
    echo "Attribution hygiene check failed." >&2
    exit 1
  fi
done

echo "Structure validation passed."
