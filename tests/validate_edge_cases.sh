#!/usr/bin/env bash
set -euo pipefail

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
FAIL=0

fail() {
  echo "$1" >&2
  FAIL=1
}

python3 -m json.tool "$ROOT_DIR/evals/edge-cases.json" >/dev/null
python3 -m json.tool "$ROOT_DIR/evals/ai-for-x.json" >/dev/null
python3 -m json.tool "$ROOT_DIR/evals/triggers.json" >/dev/null

skill_lines="$(wc -l < "$ROOT_DIR/skill/SKILL.md" | tr -d ' ')"
if (( skill_lines > 200 )); then
  fail "skill/SKILL.md is $skill_lines lines; must stay under 200."
fi

for heading in \
  "**Original framing:**" \
  "**Who does the work:**" \
  "**Current workarounds:**" \
  "**Signal scores:**" \
  "**Rejected obvious framings:**" \
  "**Ranked sharpened problems:**"
do
  if ! grep -qF "$heading" "$ROOT_DIR/skill/sharpen.md"; then
    fail "sharpen.md missing report heading: $heading"
  fi
  if ! grep -qF "$heading" "$ROOT_DIR/skill/edge-cases.md"; then
    fail "edge-cases.md suspect report missing heading: $heading"
  fi
done

if ! grep -q 'problem-workflow.md' "$ROOT_DIR/skill/SKILL.md" || ! grep -q 'sharpen.md' "$ROOT_DIR/skill/SKILL.md"; then
  fail "Full-run routing must name problem-workflow.md and sharpen.md."
fi

if ! grep -q 'edge-cases.md' "$ROOT_DIR/skill/SKILL.md"; then
  fail "SKILL.md does not link edge-cases.md"
fi

if ! grep -q 'report template is not optional' "$ROOT_DIR/skill/SKILL.md"; then
  fail "SKILL.md must say the report template is not optional."
fi

for q in \
  "Whose hands are on the mess" \
  "What do they already do that day" \
  "Who would have to change a rule"
do
  if ! grep -q "$q" "$ROOT_DIR/skill/workaround-map.md"; then
    fail "workaround-map.md missing doer question: $q"
  fi
done

if ! grep -q 'Do not invent workarounds' "$ROOT_DIR/skill/workaround-map.md"; then
  fail "workaround-map.md must forbid inventing workarounds."
fi

if ! grep -q 'No solution section' "$ROOT_DIR/skill/sharpen.md"; then
  fail "sharpen.md must forbid a solution section."
fi

if ! grep -q 'stay inside the #1' "$ROOT_DIR/skill/sharpen.md"; then
  fail "sharpen.md must lock after-report follow-ups to #1."
fi

missing_ids="$(python3 - <<'PY' "$ROOT_DIR"
import json, re, sys
from pathlib import Path
root = Path(sys.argv[1])
text = (root / "skill/edge-cases.md").read_text()
table_ids = re.findall(r"\|\s*(E\d{2})\s*\|", text)
if table_ids != [f"E{i:02d}" for i in range(1, 31)]:
    print("edge-cases.md IDs are not E01-E30 in order: " + ",".join(table_ids))
evals = json.loads((root / "evals/edge-cases.json").read_text())
eval_ids = [item["id"] for item in evals["evals"]]
if eval_ids != [f"E{i:02d}" for i in range(1, 31)]:
    print("evals/edge-cases.json IDs are not E01-E30 in order: " + ",".join(eval_ids))
ai = json.loads((root / "evals/ai-for-x.json").read_text())
x_ids = [item["id"] for item in ai["evals"]]
if x_ids != [f"X{i:02d}" for i in range(1, 11)]:
    print("evals/ai-for-x.json IDs are not X01-X10: " + ",".join(x_ids))
if len(ai["evals"]) != 10:
    print("ai-for-x suite must contain 10 prompts")
triggers = json.loads((root / "evals/triggers.json").read_text())
if len(triggers["should_trigger"]) < 10:
    print("triggers should_trigger must have at least 10 prompts")
if len(triggers["near_miss"]) < 8:
    print("triggers near_miss must have at least 8 prompts")
PY
)"

if [[ -n "$missing_ids" ]]; then
  fail "$missing_ids"
fi

if (( FAIL != 0 )); then
  echo "Edge-case validation failed." >&2
  exit 1
fi

echo "Edge-case validation passed."
