# Position Paper: The Architect Repo as Separation of Concerns

## 1. Initial Reaction and Core Tension

Let me be honest with you: this is one of the most structurally sound instincts I've seen from a non-developer builder, and it solves a problem that most organizations — including ones with full engineering teams — never bother to name.

The core tension is this: **Claude Code in a build repo is a brilliant contractor, but it's a contractor standing inside the room it's renovating.** It sees the walls, the wiring, the fixtures of *that room*. It does not see the floor plan. It does not know that the plumbing it's routing conflicts with the HVAC duct two rooms over. When it hits a roadblock, it does what any good contractor does — it improvises locally. And local improvisation, compounded across 29 repos, is how you get a codebase that works but can't evolve.

The Architect repo is the answer to a question most AI-assisted builders never ask: *Where does the system-level intelligence live when no single agent has the full picture?*

Your instinct to sandbox it away from build is exactly right. The moment an architect agent can touch code, it will. The moment it can touch code, it stops being an architect and becomes a senior developer with opinions. Those are different roles, and conflating them is how you get scope creep dressed up as helpfulness.

## 2. Analysis: Four Layers of the Architect CLAUDE.md

I think about this in four structural layers, each one serving a different failure mode that Bill has either already hit or will hit at scale.

**Layer 1: Identity and Constraint Boundaries.** The CLAUDE.md must open with an unambiguous role definition that is, frankly, adversarial to Claude Code's natural instincts. Claude *wants* to help. Claude *wants* to write code. The architect file needs to say, in terms the model cannot misinterpret: *You are a systems architect. You produce specifications, dependency maps, integration contracts, and resolution guidance. You never produce implementation code. If a user asks you to "just write the function," you refuse and explain why.* This is not a suggestion line — it's a load-bearing wall. Without it, the repo drifts into being a second build environment within three sessions.

**Layer 2: The System Map as Living Memory.** This is where the real moat gets built. The architect repo should maintain a canonical systems inventory — every repo, its purpose, its APIs, its upstream and downstream dependencies, its current phase. Think of this as the Factorio logistics network view: you're not placing inserters, you're watching throughput across the entire factory. The CLAUDE.md should instruct the architect to update this map as a condition of every session, pulling from the Systems Registry and Project Status Tracker that Bill already maintains via Sheets. The architect's job is not to *be* the registry — it's to *reason over* the registry. When a build repo hits a wall because it doesn't know what schema the Sheets Bridge expects, the architect is the one who already has that answer and can produce a resolution memo the build agent can consume.

**Layer 3: Spec Production Standards.** Bill already has a spec-first philosophy, but the architect CLAUDE.md should codify what a SPEC.md actually contains at a level of rigor that eliminates ambiguity downstream. I'd define it as seven mandatory sections: (1) Problem Statement — what user-visible outcome this solves, (2) System Context — what existing repos and services this touches, (3) Interface Contracts — exact API shapes, data schemas, auth flows, (4) Constraints — what this system must NOT do, (5) Phased Build Plan — discrete, shippable increments with acceptance criteria, (6) Risk Register — known unknowns and fallback positions, (7) Verification Protocol — how the build agent and Bill confirm each phase is correct before proceeding. That last one is critical. Correctness is upstream of everything. Most AI build failures trace back to humans — or agents — refusing to define what good looks like. The spec is where you define it.

**Layer 4: Roadblock Resolution Protocol.** This is the layer that justifies the entire repo's existence in operational terms. When a build agent hits a wall — an API behaving unexpectedly, a schema mismatch, a deployment constraint — the current workflow is that Bill context-switches into diagnostician mode, figures out the system-level answer, and feeds it back. The architect repo formalizes this. The CLAUDE.md should define a structured intake format for build roadblocks: what repo, what phase, what the agent tried, what failed, what system-level context is needed. The architect then produces a Resolution Memo — not code, but a precise technical specification of the solution path, including which files to modify, what the expected interface should be, and what the downstream implications are. This is the plumber-versus-agency distinction: the architect doesn't swing the wrench. It tells you which pipe, which fitting, which direction to turn.

## 3. Recommendation with Conditions

**Do this.** Create the architect repo with a CLAUDE.md that enforces the four layers above. But I'd attach three conditions:

**Condition A: Hard-code the no-code constraint with examples.** Don't just say "don't write code." Give three or four examples of requests the architect should refuse and show the correct response pattern. Claude Code responds to demonstrated patterns more reliably than to abstract instructions.

**Condition B: Start with a manual system map, then automate.** Don't ask the architect to pull live data from the Systems Registry on day one. Seed the repo with a curated snapshot of the current system state — repos, APIs, dependencies, phases. Let the architect reason over a static map first. Once that's proven, add a session-start protocol that refreshes from the Sheets Bridge.

**Condition C: Define the handoff format between architect and build.** The Resolution Memo and the SPEC.md are only useful if the build agent can consume them without Bill translating. Standardize the format. Put a template in the architect repo. Make it a file the build agent's CLAUDE.md explicitly references as an input source. The architect produces the document; the build agent's instructions say "before starting Phase N, read the corresponding SPEC.md or Resolution Memo from the architect repo." That's the closed loop.

One more thing. This architect repo is going to become the single most valuable artifact in Bill's entire infrastructure — more valuable than any individual tool. It's where organizational knowledge compounds. Every resolved roadblock, every spec, every system map update makes the next build faster and more correct. That's the real argument: you're not just preventing drift, you're building institutional memory that survives any individual session.

## 4. Vote

**STRONG YES.**

This is not a nice-to-have architectural refinement. This is the missing layer between Bill's brain and 29 build repos, and it's the layer that determines whether HRI's system scales to 50 repos or collapses under its own integration complexity. Build it. Enforce the boundaries ruthlessly. Let the architect be the architect.

— **Nate B Jones**
