---
name: hackathon-winner
description: Playbook for winning hackathons, distilled from serial winners (20+ wins, 90% win rates, 12-of-15 records). Covers picking the event, reading the rubric, team roles, sponsor-track stacking, scoping to the demo, hour-by-hour time boxes, the pitch and judge Q&A. Use when the user is entering, preparing for, or currently competing in a hackathon, asks how to win one, needs a demo or pitch plan, or wants to know which prize tracks to target.
---

# Hackathon Winner

A hackathon is judged in a few minutes by tired people who saw dozens of demos that day. You are not graded on how much code you wrote. You are graded on what the judges understood, believed and remembered.

Every decision in this skill comes back to one question: **does this make the demo better for these specific judges?**

## The five laws

1. **Hackathons are marketing.** Sponsors pay to be there so developers use their tools and produce demos that make them look good. Organizers want a story to tell. Work backwards from what they need.
2. **The rubric is the spec.** Read the judging criteria before the problem statement. Re-read it before every major decision.
3. **Build only what you demo.** Every feature that is not on the demo path is a feature that can break on stage.
4. **One strong idea, at most three features.** Coherent and finished beats ambitious and half-built.
5. **The pitch is the product.** More hackathons are won on stage than at the keyboard.

## Workflow

Work through the phases in order. Ask at most 3 questions before producing the next useful output. If the user is mid-event and short on time, jump straight to the phase they are in.

### Phase 0 — Intake

Capture before advising:

- Event name, format (in-person / online), and **total length in hours**
- Judging rubric and weights (ask them to paste it)
- Main prize and every sponsor / side track with its prize
- Team size and each person's real skills
- Whether they already have an idea

If the rubric or tracks are unknown, the first action is to go find them. Do not plan without them.

### Phase 1 — Before the event

- **Pick events you can win.** Check past winners (Devpost, Devfolio). If the same teams win every year, factor that in. Smaller or newer events and narrow sponsor tracks have less competition.
- **Team of 3–4 built around skill gaps, not friendships.** Minimum roles:
  - **Builder** — ships fast, owns the core path
  - **Product / design** — UI, flow, makes it look real
  - **Pitcher / domain** — owns the story, the slides, sponsor conversations, and the demo script
  - Red flag: everyone has the same skills, or nobody can present.
- **Run a 15-minute ways-of-working chat**: what each person wants out of the weekend, sleep plan, who decides when the team is stuck.
- **Prepare boilerplate the night before** (only if the rules allow pre-built scaffolding): auth, database, deploy pipeline where a push goes live, UI component kit, AI coding tools installed and tested.
- **Use familiar, boring tech.** Learn a new tool only if a sponsor prize requires it.

### Phase 2 — Idea (first 10% of the event, hard stop)

1. **Walk the sponsor tables first.** Ask each one what they wish someone would build with their product. Pitch rough ideas and watch the reaction: if they light up, keep going; a flat "oh, cool" means pivot. Sponsors are often the judges for their own track.
2. **Validate the problem.** If the idea is a solution looking for a problem, run the `problem-finder` skill in this repo before committing. A real worker with a real workaround beats a generic "AI for X" every time.
3. **Stack tracks — but cap it at 3–4.** One idea that legitimately qualifies for the main prize plus two or three sponsor tracks multiplies your chances. Using a sponsor in a fake, bolted-on way does not count and judges notice.
4. **Score each candidate** on: rubric fit, demo-ability (can you show it working in 90 seconds?), story strength, feasibility in the time left, and tracks it unlocks. Pick the highest total, not the coolest.
5. **Write the 90-second demo script before writing any code.** If the team cannot describe the problem, the trigger moment, the "aha" and the close on one page, they do not yet know what they are building.

Output of this phase: one sentence for the problem, one for the solution, the demo script, and the list of tracks targeted.

### Phase 3 — Build

- **Working skeleton in the first 25% of the time.** End-to-end, ugly, but real. Then deepen feature by feature.
- **The happy path must work.** The single hardest thing you claim to do must genuinely function. Everything else can be faked, hard-coded or seeded with demo data — and say so honestly if asked.
- **Check in on a fixed cadence** (every 2–4 hours): "Could we demo right now?" If no, stop adding and fix that first.
- **Cut ruthlessly.** If a feature is buggy and not essential to the story, hide it or delete it. Never debug a side feature in the last quarter of the event.
- **Use AI coding tools deliberately** for boilerplate and glue, and verify what they generate. AI-introduced bugs are a top cause of on-stage failures.
- **Take turns sleeping** on events over 24 hours. A rested pitcher wins more than an extra 3 hours of code.
- **Talk to sponsors again mid-event.** Show progress. Familiarity matters when they pick a winner.

### Phase 4 — The last stretch is a separate project

Reserve the final ~20% of the time (e.g. the last 4–5 hours of a 24-hour event) for:

- Code freeze, deploy to the real target platform (phone for mobile, live URL for web)
- **Record a backup demo video** — live demos fail on stage all the time
- Slides, README, submission form, required demo video
- Rehearsing the pitch out loud, timed, at least 3 times

See [references/timeline.md](references/timeline.md) for hour-by-hour splits by event length.

### Phase 5 — Pitch and judging

Use [references/pitch.md](references/pitch.md) for the script template and Q&A drill. The essentials:

- **Structure:** problem (make the judges feel it) → solution in one line → live demo → impact → which sponsor tools you used and why.
- **Open with a person and a pain**, not with your tech stack.
- **Name every sponsor technology on stage** for every track you are entering.
- **Prepare answers for the obvious questions** (why this stack, how it scales, who pays, what is real vs mocked).
- **Missing features are scope decisions, not failures.** "We intentionally focused on the core flow; X is next on the roadmap" — true, and far better than "we ran out of time."
- **Finish on time.** Over-running a strict time limit loses points.
- **Be approachable at the table.** Treat every visitor as a possible judge.

### Phase 6 — After

- Congratulate the winning teams and learn what they did differently.
- Connect with sponsors and other builders — future teammates, jobs and internships come from this.
- Write a short post-mortem: what won points, what lost them. Wins compound through reps.

## Output standards

When asked to plan or coach a hackathon run, produce:

1. **Target:** main prize + the 2–3 sponsor tracks to stack, with why each fits
2. **Problem and solution:** one sentence each
3. **Demo script:** 90 seconds, beat by beat
4. **Scope:** must-have features (max 3) and an explicit cut list
5. **Time plan:** checkpoints in real clock times for this event's length
6. **Pitch outline and top 5 expected judge questions with answers**

If the rubric, tracks or event length are missing, say what is missing and give the plan with clearly stated assumptions.

## Anti-patterns to flag immediately

- Spending more than ~10% of the time choosing an idea
- Building infrastructure nobody will see in the demo
- Chasing 5+ sponsor prizes with shallow integrations
- No one on the team owns the pitch
- No backup video
- Slides-only submissions — a working demo almost always beats a deck
- Opening the pitch with architecture instead of the problem

## Sources

Distilled from blog posts by repeat hackathon winners and organizers. See [references/sources.md](references/sources.md) for the full list and links.
