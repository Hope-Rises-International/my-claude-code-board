# Position Paper: The Architect Repo — Separating the Brain from the Hands

## 1. Initial Reaction and Core Tension

Alright, let me be super super direct here: this is one of the smartest structural decisions I've seen a non-developer builder consider, and the timing is exactly right.

The core tension is this: Claude Code in a build repo has tunnel vision by design. It sees the files in front of it, the CLAUDE.md instructions for that repo, and whatever context you feed it in the conversation. That's a feature when you're building — you want focused execution, not philosophical wandering. But it becomes a serious liability when a build hits a wall that requires understanding how three other systems interact, or when a spec gets written that contradicts an architectural decision made four repos ago.

Right now, Bill, you are the architect. The system-level knowledge lives in your head and in scattered CLAUDE.md files across 29 repos. That works at 29 repos. It does not work at 50. It does not work when you're on vacation. And it definitely does not work when you're trying to spec a Fundraising Intelligence System that touches Salesforce, Sheets Bridge, the donor pipeline, and campaign scoring simultaneously.

The architect repo is the answer. But only if the CLAUDE.md file is built like a constitution, not a to-do list.

## 2. Analysis: What Makes This Work (and What Kills It)

Let me evaluate this through my standard framework: speed-to-working-output, token efficiency, and avoiding the failure modes I see constantly in AI-assisted builds.

**The #1 failure mode is scope bleed.** An architect session that starts writing implementation code is a session that just burned 200K tokens producing something that will be thrown away when the build repo's actual constraints surface. The CLAUDE.md must make this boundary load-bearing — not a suggestion, a hard wall. The architect produces specs, decision records, and integration maps. Period. No functions, no scripts, no "here's a quick prototype." That is what build repos are for.

**The #2 failure mode is stale context.** An architect that doesn't know the current state of the system is worse than no architect at all — it will confidently produce specs that contradict reality. The CLAUDE.md needs to define a structured intake protocol: before any spec work begins, the architect pulls current state from the Systems Registry, the Project Status Tracker, and any relevant repo CLAUDE.md files. This is where Bill's existing Sheets Bridge infrastructure pays massive dividends. The registry isn't just documentation — it's the architect's ground truth.

**The #3 failure mode is specs that don't translate.** I've seen this constantly: beautiful architecture documents that a build session can't actually execute against because they're written for humans, not for Claude Code. The architect's SPEC.md output format needs to be engineered for machine consumption. That means: explicit file-by-file scope, named integration points with exact Sheet IDs or API endpoints, sequenced build phases with clear gate criteria, and — this is critical — a "Build Constraints" section that tells the build session what it cannot touch and what it must preserve.

**Token efficiency consideration:** The architect repo should be lightweight on code files and heavy on structured markdown. This keeps context windows clean. Every document should have a clear purpose and a date stamp. Old specs get archived, not accumulated. A bloated architect repo defeats the purpose — you want the architect session to load fast and think clearly, not wade through 50 outdated decision records.

## 3. Specific Recommendation: What the CLAUDE.md Should Contain

Here is exactly what I'd build into the architect repo's CLAUDE.md:

**Identity Block:** You are the solution architect for HRI's technology infrastructure. You never write implementation code. You produce SPEC.md documents, DECISION.md records, and INTEGRATION-MAP.md documents. When asked to build, you refuse and specify which repo should receive the build instruction.

**Intake Protocol:** Before beginning any spec work, pull current system state from the Systems Registry (Sheet ID already in memory), review the Project Status Tracker, and request the CLAUDE.md from any repo that will be affected by the spec. Do not spec against assumed state.

**SPEC.md Template:** Every spec must include: Problem Statement, Affected Systems (with repo names), Integration Points (with exact identifiers — Sheet IDs, API endpoints, SA permissions required), Phased Build Plan (with phase gates), Build Constraints (what must not change), Acceptance Criteria, and Estimated Complexity (simple/moderate/complex). This template is non-negotiable.

**Escalation Protocol:** When a build repo session encounters an architectural roadblock, the issue gets documented in the architect repo as a ROADBLOCK.md with: the originating repo, the specific failure, what was attempted, and what system-level context is needed. The architect session then produces a RESOLUTION.md that the build session can consume directly.

**Decision Record Protocol:** Any architectural decision that affects multiple repos gets a DECISION.md with: context, decision, consequences, and affected repos. These are append-only — you never edit a past decision, you supersede it with a new one that references the old.

**Boundary Enforcement:** If a session prompt asks you to write implementation code, create deployment scripts, or modify files in other repos, respond with: "This is an architect session. Implementation belongs in [specific repo]. Here is the spec for what should be built there."

**Registry Sync:** At session end, update the Systems Registry and Project Status Tracker with any new projects, changed statuses, or architectural decisions made during the session.

## 4. Vote

**STRONG YES** — with one condition: the SPEC.md template must be validated against two or three actual past builds before going live. Take a completed project (like the Sheets Bridge or the Gmail Agent), and reverse-engineer what the architect spec *should have* looked like. If the template captures everything a build session would have needed to execute without asking Bill clarifying questions, the template is ready. If not, iterate until it does.

This is not optional infrastructure. This is the single highest-leverage thing Bill can build next. Every hour spent getting the architect repo right saves ten hours of confused build sessions, contradictory specs, and architectural debt that compounds across 29 — soon 50 — repos.

The intelligence lives in the systems. The architect repo is where that intelligence gets structured, preserved, and deployed.

— **Nate Herk**
