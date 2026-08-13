# Problem Finder

An AI agent skill for builders who need to turn a messy startup idea, hackathon prompt, or "what should I build" question into a worker-backed problem before anyone starts solutioning.

It forces worker identification, workaround mapping, signal scoring, obvious-framing rejection, and one-sentence problem synthesis.

## What It Helps With

| Area | Outcome |
|---|---|
| Problem restatement | Rewrite the idea from the person doing the work, not the person buying software |
| Workaround mapping | List what people already do today; flag framings with no felt pain |
| Signal scoring | Score fragmentation, incentive misalignment, incumbent neglect, and who bears the cost |
| Framing rejection | Kill obvious, feel-safe, razor-thin problems by default |
| Problem sharpening | Output 2-3 ranked one-sentence problems naming worker, workaround, and structural gap |
| Hackathon intake | Stop "AI for X" and marketplace brainstorms before they become the demo |
| Edge-case lock | Buyer-only personas, empty pain, skip-to-stack, and after-report rebundles cannot bypass the report |
| Method demo | Show the discovery pass working on a live prompt, using the market-woman example |

## How it works

- A pitch cannot become a build until the worker, workaround, and structural gap are explicit.
- Built for people who solution by reflex. Discovery runs first.
- `skill/SKILL.md` routes to focused files only when needed.
- Install scripts copy local Markdown files into a selected skills directory.
- The repo includes agents, commands, rules, validation, and a live worked example.

## Installation

### GitHub Release

A `problem-finder.skill` zip is attached to [GitHub Releases](https://github.com/fozagtx/problem-finder/releases). Layout is `problem-finder/SKILL.md` plus the sibling modules (`edge-cases.md` included). Rebuild it with `./scripts/package_skill.sh`.

Clone elsewhere → install into a skills dir. Never install onto the clone.

This repository is the skill kit. The installed skill is a copy of `skill/` in a skills directory such as `~/.agents/skills/problem-finder` or `~/.claude/skills/problem-finder`. Clone it to a working directory, then run an installer. Do not clone this repo into a skills path and then install onto that same path. `install-custom.sh` option 2 would copy `skill/` over the git repo and can eat it. The custom installer refuses if the target looks like this clone (has `.git` and `install.sh`).

### Recommended

```bash
git clone https://github.com/fozagtx/problem-finder.git
cd problem-finder
./install-custom.sh
```

The custom installer lets you choose personal or project skill locations, including `.agents/skills`, `.claude/skills`, and a local project `skills/` folder. Pick a skills directory. Never point it at the clone.

### Standard

```bash
./install.sh
./install.sh -y
```

Standard defaults:

- Skill location: `~/.agents/skills/problem-finder`
- Optional config copied to: `~/.agents/AGENTS.md`

## Usage Examples

```text
Hackathon idea: an app that helps market women reduce spoilage.
```

```text
What should I build for small restaurant owners?
```

```text
We're building an AI dashboard for warehouse managers to cut waste. Is this a real problem?
```

```text
A market woman loses money to spoilage, price hurdles, and transportation. What should we build?
```

## Repository Structure

```text
problem-finder/
|-- .gitignore
|-- ARTICLE.md
|-- README.md
|-- LICENSE
|-- CLAUDE.md
|-- SUBMISSION.md
|-- SKILL.md
|-- install.sh
|-- install-custom.sh
|-- skill/
|   |-- SKILL.md
|   |-- problem-workflow.md
|   |-- workaround-map.md
|   |-- signal-scores.md
|   |-- framing-reject.md
|   |-- sharpen.md
|   |-- worked-example.md
|   `-- edge-cases.md
|-- evals/
|   |-- canonical-market-woman.md
|   |-- edge-cases.json
|   |-- ai-for-x.json
|   |-- triggers.json
|   |-- results.md
|   `-- trigger-results.md
|-- scripts/
|   `-- package_skill.sh
|-- agents/
|   |-- problem-analyst.md
|   |-- workaround-mapper.md
|   |-- framing-rejector.md
|   `-- skill-demo-coach.md
|-- commands/
|   |-- problem-sprint.md
|   |-- map-workaround.md
|   |-- reject-framing.md
|   |-- skill-demo.md
|   `-- check-edges.md
|-- rules/
|   `-- no-solutioning.md
`-- tests/
    |-- validate_structure.sh
    `-- validate_edge_cases.sh
```

## Skill Routing

`skill/SKILL.md` is the entry point. It classifies the task and routes to the smallest relevant module:

- `problem-workflow.md` for intake, worker restatement, scoring, and the stop rule
- `workaround-map.md` for current behavior, cost, and suspect-problem flags
- `signal-scores.md` for fragmentation, incentives, incumbent neglect, and cost bearer
- `framing-reject.md` for killing delivery, education, marketplace, dashboard, and "AI for X" framings
- `sharpen.md` for the one-sentence contract and the report format
- `worked-example.md` for the market-woman live example (expected report: `evals/canonical-market-woman.md`)
- `edge-cases.md` for skip attempts, buyer-only personas, empty pain, bundles, and after-report lock

## Quality Bar

The skill should make an agent:

- Preserve the messy original framing before cleaning it up
- Name the person doing the work, not the software buyer
- Refuse to proceed when there is no current workaround
- Reject obvious, feel-safe framings and say why
- Score the four signals before writing a problem sentence
- Produce 2-3 ranked problems that each name worker, workaround, and structural gap
- Refuse buyer/market/demographic as the worker
- Emit a suspect report instead of inventing workarounds
- Stay inside sharpened #1 after the report exists

## Board

Work is tracked on [issue #11](https://github.com/fozagtx/problem-finder/issues/11). Columns are labels: `done`, `ready`, `backlog`.

## Validation

Run the structure validator:

```bash
./tests/validate_structure.sh
```

It checks required files, frontmatter, relative skill links, the six report headings, the frozen market-woman report, the `.skill` zip layout, shell syntax, attribution hygiene, and the edge-case eval suites (`./tests/validate_edge_cases.sh`).

## License

MIT. See [LICENSE](LICENSE).
