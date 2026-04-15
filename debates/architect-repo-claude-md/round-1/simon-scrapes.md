# Position Paper: The Architect Repo — Separation of Thinking from Doing

## 1. Initial Reaction and Core Tension

Bill, this is the single highest-leverage move you can make right now, and the timing is perfect. You have 29 repos, 9,000+ lines of code, and zero IT staff. The bottleneck in your system is no longer "can Claude Code build it?" — the bottleneck is "does Claude Code know what to build, and does it have the full picture when it hits a wall?"

The core tension is simple: **Claude Code in a build repo is a specialist with blinders on.** It sees one repo's CLAUDE.md, one repo's file tree, one repo's context. When it encounters a design question — "should this pipeline write to the Systems Registry or the Code Outputs sheet?" or "does the Aegis pipeline already handle this edge case?" — it either guesses, asks you, or stalls. You become the router. You are the architect by default, and that does not scale.

The Architect repo creates a dedicated "employee" whose entire job is thinking, never building. This is the difference between a general contractor who also swings a hammer and a general contractor who reads blueprints, coordinates trades, and solves problems before they reach the job site. You need the second one.

## 2. Analysis: Three Frameworks That Apply

**Framework 1: Context Is Milk**

This is where most people would get the Architect repo wrong. The instinct is to dump everything into one massive CLAUDE.md — every repo's purpose, every API endpoint, every integration pattern — and call it the "system brain." That is a context landfill, and it will rot within two weeks.

The Architect repo's CLAUDE.md must be a *table of contents*, not an encyclopedia. It should contain:

- A systems registry summary (20-30 lines max, one line per repo with purpose and status)
- A decision log index pointing to individual decision files
- A constraints file covering HRI's non-negotiable patterns (spec-first, one repo per tool, Sheets as integration hub, no SaaS when custom works)
- Reference files loaded on demand, never pre-loaded

The SPEC.md documents it produces are the *condensed milk* — the freshest, most concentrated form of architectural intent. Each SPEC.md should follow a rigid template: Problem Statement, System Boundaries (what this touches), Data Flow (what goes where), Build Gates (what must be true before moving to next phase), and Handoff Checklist (what the build repo's CLAUDE.md needs to know).

**Framework 2: Progressive Disclosure for Architectural Knowledge**

The Architect repo needs three tiers of knowledge, loaded only when relevant:

*Tier 1 — Always loaded (the CLAUDE.md itself):* Identity and constraints. "You are the architect. You never write implementation code. You produce SPEC.md files. You have access to the full system map. Here are the 10 rules you never break."

*Tier 2 — Loaded per-task (reference files in the repo):* System integration map, API contract summaries, the Project Status Tracker schema, known technical debt. These get pulled in when the architect is working on a specific spec or resolving a build roadblock.

*Tier 3 — Loaded on demand (fetched from external sources):* Actual repo CLAUDE.md files (read via GitHub API or file system), Sheets Bridge data, current deployment states. The architect should be able to *read* build repos but never *write* to them except through SPEC.md handoff documents.

**Framework 3: The Roadblock Resolution Protocol**

This is the part most people miss entirely. The Architect repo is not just a spec factory — it is a *problem-solving service* for build sessions. When Claude Code in `hri-donor-file-upload-sf-system` hits a design question it cannot answer, the workflow should be:

1. Build session documents the roadblock in a structured format (a ROADBLOCK.md or an issue)
2. You open the Architect repo and feed it the roadblock
3. The Architect loads the relevant system context (Tier 2 and 3), analyzes the question against the full system view, and produces a RESOLUTION.md
4. You carry the resolution back to the build repo

This is delegation, not automation. You are still the router, but now you have a specialist on each end instead of one generalist trying to hold the whole system in its head.

## 3. Recommendation with Conditions

**Do this. But do it with these five guardrails:**

1. **The CLAUDE.md must contain an explicit "Never Build" constraint block.** Not a suggestion — a hard rule. "You never create implementation files. You never write functions. You never modify code outside this repo. Your outputs are: SPEC.md, ARCHITECTURE.md, RESOLUTION.md, DECISION.md, and system map updates. Nothing else." Without this, context drift will pull it toward building within three sessions.

2. **Start with a systems manifest, not a brain dump.** Your first task in the Architect repo should be generating a lean, current systems manifest from the Project Status Tracker and Systems Registry. One line per system. This becomes the Tier 1 reference. Update it monthly, not daily.

3. **Standardize the SPEC.md template ruthlessly.** Every spec must include Build Gates — the conditions that must be true before the build repo proceeds to the next phase. This is where the architect earns its keep. A spec without gates is just a wish list.

4. **Create a ROADBLOCK.md template for build repos.** Every build repo's CLAUDE.md should include instructions for how to document a roadblock in a structured format the Architect can consume. This closes the loop.

5. **Keep the repo small.** The Architect repo should contain fewer than 15 files at any time. Completed specs get archived to a `/completed` folder or the shared drive. Active work stays lean. The moment this repo becomes a warehouse, it stops being useful.

**Conditions for success:** You must actually use the Architect repo as the *first stop* for new projects, not an afterthought. The workflow is: Architect produces spec, you review spec, build repo receives spec, build begins. If you skip the architect and go straight to building "just this once," you will skip it permanently.

## 4. Vote

**STRONG YES.**

This is not a nice-to-have. At 29 repos with no IT staff, you are already the implicit architect, and you are doing that job with no documentation, no system view, and no reusable patterns. The Architect repo externalizes what is currently trapped in your head and in scattered CLAUDE.md files. The hours-saved calculation is straightforward: every roadblock that currently costs you 20 minutes of context-switching and re-explaining will cost you 3 minutes of loading a structured roadblock into a purpose-built system. At your current build velocity, that is 5-10 hours per month recovered, and the quality of specs will compound over every future project.

Build the Architect repo. Make it lean. Make it strict. And never let it touch a line of code.

— **Simon Scrapes**
