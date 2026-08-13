---
name: problem-finder
description: Force a problem-discovery pass before any solutioning. Decompose startup and hackathon ideas into the worker, their current workaround, and the structural gap that keeps the pain unfixed; reject obvious, feel-safe framings by default. Use whenever the user mentions a startup idea, hackathon idea, "what should I build," validating an idea, finding problems, user pain points, or presents any solution without a validated problem — even if they do not ask for problem discovery explicitly.
---

# Problem Finder

Builders are good at solutioning, not probleming. Obvious, visible, razor-thin problems feel safe. They are not. Run this workflow before suggesting any product, feature, or build.

A solution already on the table is a clue about a suspected problem, not permission to skip discovery.

## Hard rules

1. Start with what people do **today**. A real problem already has messy workarounds. No workaround → no felt pain → treat the problem as suspect.
2. Reason about the person **doing the job**, not the person buying software. Get closest to the pain.
3. Hunt for three signals of a good problem: **fragmentation** (partial tools and manual steps stitched together), **incentive misalignment** (the person who feels it cannot fix it), and a **structural reason incumbents leave it unfixed**.
4. Never accept the first framing. Decompose until you can name who bears the cost, what they do about it now, and which **single symptom** has a reason it stays unfixed.

## Workflow

Follow these five steps in order. Do not jump to solutions, even if asked "what should I build."

### 1. Restate from the worker

Name the person closest to the pain. Rewrite the problem as a job they are already trying to finish today — not a market, a demographic, or a buyer persona.

### 2. Current workarounds

List what they actually do: tools, spreadsheets, phone calls, unpaid hours, informal networks, discounts, side deals. If you cannot name a workaround, flag the problem as suspect and say why.

### 3. Score the signals

Score each 1–5 (5 = strong):

| Signal | Ask |
|---|---|
| Fragmentation | How many partial tools or manual steps are stitched together? |
| Incentive misalignment | Does the person who feels the pain lack the power or budget to fix it? |
| Incumbent neglect | Why would a well-resourced incumbent leave this unfixed? |
| Cost bearer | Is the cost concentrated on one worker who cannot pass it on? |

Low scores across the board usually mean an obvious, feel-safe framing.

### 4. Reject obvious framings

Name the feel-safe versions (delivery, storage, education, marketplace, dashboard, "AI for X") and say why they fail this test. Do this even if the user is attached to them.

### 5. Sharpen

Output 2–3 ranked one-sentence problem statements. Each sentence must name **the worker**, **the workaround**, and **the structural gap**. Rank by signal strength, not by how buildable a solution feels.

## Report format

Use this exact structure. Keep it short. No solution section.

**Original framing:** …
**Who does the work:** …
**Current workarounds:** …
**Signal scores:** fragmentation X/5 · incentive misalignment X/5 · incumbent neglect X/5 · cost bearer X/5
**Rejected obvious framings:** …
**Ranked sharpened problems:**
1. …
2. …
3. …

## Worked example

**Input:** A market woman loses money to spoilage, price hurdles, and transportation.

**Original framing:** A market woman loses money to spoilage, price hurdles, and transportation.

**Who does the work:** The stall trader herself. She buys at farmgate or wholesale, hauls goods, prices them, and sits the stall. Not "the market," not farmers, not an NGO buyer.

**Current workarounds:** Sells early at a discount to beat rot; splits stock across relatives' stalls; borrows informal credit after a bad day; pays a transporter a fixed fare regardless of volume; keeps a mental price book because posted prices lag.

**Signal scores:** fragmentation 4/5 · incentive misalignment 5/5 · incumbent neglect 4/5 · cost bearer 5/5

**Rejected obvious framings:**
- Cold storage, delivery, or a market-access app — solutions looking for a buyer. She already has a stall and a route. Logistics incumbents exist; they do not serve her ticket size.
- Price education — she already knows prices. The gap is that she cannot hold inventory long enough to wait for a better bid.
- "Financial inclusion" — too wide, no workaround named.

**Ranked sharpened problems:**
1. The stall trader discounts unsold perishables each afternoon because she has no overnight hold that matches her lot size, and cold-chain operators only rent to wholesalers.
2. She pays a full-load transporter fare for a half-load because aggregating with other traders would leak her supplier and price, and no incumbent will unbundle the fare.
3. She absorbs farmgate-to-stall price swings in cash because the person who sets wholesale terms (the supplier) is not the person who sits the unsold stock (her).

Brainstorming delivery, storage, education, and market access from the original sentence is misaligned solutioning. The useful move was decomposing which stakeholder bears which cost, what they already do, and which single symptom has a structural reason it stays unfixed.

## After the report

Only if the user then asks what to build: stay inside the #1 sharpened problem and that single symptom. Do not re-bundle the rejected framings.
