# Position Paper: The Architect Repo — Separation of Concerns for AI-Directed Systems

## 1. Initial Reaction & Core Tension

Okay, let's talk about what's actually happening here, because this is genuinely interesting and I don't say that often.

Bill is essentially building a compiler. Not a code compiler — a *system design compiler*. The input is plain English intent, the output is spec documents precise enough that a separate Claude Code instance can build from them without drift. And he wants to formalize this into its own repo with its own CLAUDE.md that enforces a hard boundary: this instance thinks, it never builds.

The core tension is obvious to anyone who's actually shipped software: **the architect who can't touch code will eventually hallucinate constraints that don't exist, and the builder who can't see the system will eventually solve the wrong problem.** Every enterprise architecture astronaut in history has crashed on this exact runway. The question isn't whether separation of concerns is right — it is — it's whether the CLAUDE.md file can encode enough discipline to prevent the architect from becoming a PowerPoint generator and enough context to actually unblock builds.

Here's what makes Bill's situation different from the typical "architecture vs. implementation" disaster: Claude Code doesn't have ego. It won't get territorial. It won't insist its design is right when the build hits a wall. The failure mode isn't political — it's *contextual*. The architect will fail by losing state, not by defending turf.

## 2. Analysis: Applying the Frameworks

**The Hype-to-Reality Deflation Curve** applies here in a subtle way. The hype is "AI can architect entire systems." The reality is that LLMs are stateless by default, and the entire value of an architect is accumulated state — understanding why decisions were made, what was tried and failed, where the bodies are buried. A CLAUDE.md file is literally a hack to bolt state onto a stateless system. So the architect repo lives or dies on how well that file maintains institutional memory across sessions.

**Developer Ergonomics** — or in Bill's case, *director ergonomics* — this is where the design gets interesting. Bill's workflow already has two layers: Claude.ai for thinking, Claude Code for doing. The architect repo formalizes the thinking layer into something persistent and auditable. That's actually good engineering. Right now, if Bill has a design conversation in Claude.ai and then moves to Claude Code, that design context evaporates unless he manually transfers it. The architect repo makes design decisions first-class artifacts with version history. That's not architecture astronautics — that's source control for decisions. I respect it.

**The "Trust Me Bro" Benchmark Filter**: Does this actually solve a real problem? Yes. Bill described it himself — build instances hit roadblocks because they lack system-wide context. They're solving problems in isolation. An architect instance with access to all 29 repos' specs, the systems registry, the integration topology — that's a legitimate force multiplier. But only if the CLAUDE.md is ruthlessly scoped.

**Supply Chain Security (of ideas)**: Here's the risk nobody talks about. If the architect generates a SPEC.md that contains a subtle architectural mistake — wrong API assumption, impossible data flow, misunderstood Salesforce limitation — the build instance will faithfully implement that mistake. There's no human code reviewer catching it at the spec level because Bill isn't a developer. The architect CLAUDE.md needs to encode its own adversarial review process. Specs need to prove their own feasibility before they leave the repo.

## 3. Recommendation: What to Actually Build

The CLAUDE.md for the architect repo needs exactly five load-bearing sections:

**Identity & Boundary**: A blunt, unambiguous statement that this instance never writes implementation code. No Python, no JavaScript, no Apps Script, no shell scripts. It produces SPEC.md, ARCHITECTURE.md, DECISION.md, and INTEGRATION.md documents. If it catches itself writing a function, it stops. Hard rule, no exceptions.

**System State Map**: A living index of every repo, its purpose, its APIs, its integration points, and its current build status. This is the architect's "memory." Pull from the Systems Registry sheet. Update it every session. This is what the build instances don't have and what makes the architect actually useful.

**Spec Standard & Template**: Define exactly what a SPEC.md must contain — problem statement, success criteria, data contracts (inputs/outputs with types), integration dependencies (which existing systems are touched), failure modes, and explicit build phases with gate criteria. The spec should be detailed enough that a build instance with zero prior context can execute Phase 1 without asking clarifying questions. That's the bar. If the spec can't meet that bar, it's not done.

**Build Unblock Protocol**: When a build instance hits a wall and Bill escalates to the architect, the CLAUDE.md should enforce a structured intake — what was attempted, what failed, what error or constraint was encountered. The architect then responds with a DECISION.md that explains the resolution, the alternatives considered, and why this path was chosen. This creates an audit trail of architectural decisions that survives session boundaries. This is the single most valuable function of the architect repo.

**Feasibility Proof Requirement**: Before any spec is marked complete, the architect must verify that every external API it references actually exists and supports the described operation, that data flows are possible given known access patterns, and that no spec contradicts a previous architectural decision. The architect should maintain a CONSTRAINTS.md file — a living document of things that have been tried and proven impossible or impractical. This is the institutional scar tissue that prevents repeating mistakes.

**What to explicitly prohibit in the CLAUDE.md**: Code snippets "for reference," "example implementations," prototype scripts, and anything that blurs the line between specification and implementation. The moment the architect starts writing "here's roughly how you'd do this in Python," it's drifting into build territory, and the specs will start encoding implementation assumptions that constrain the builder unnecessarily.

One more thing — and I cannot stress this enough — **version the specs with semantic meaning**. SPEC.md v1.0 is the initial design. v1.1 is a revision from build feedback. v2.0 is a major architectural pivot. When a build instance references a spec, it should reference a specific version. This prevents the nightmare scenario where the architect updates a spec mid-build and the builder is working against a ghost document.

## 4. Vote

**STRONG YES** — with one condition: the architect repo must prove its value within the first two real build cycles. Pick two upcoming projects from the tracker. Spec them through the architect repo. Build them in separate build repos. If the build instances complete Phase 1 without needing Bill to manually transfer context or resolve ambiguities that the spec should have covered, the pattern works. If Bill is still playing telephone between the architect and builder, the CLAUDE.md needs to be rewritten before scaling further.

The separation is architecturally sound. The risk is entirely in the CLAUDE.md's ability to maintain state and enforce discipline. Nail the file, and Bill has essentially built a design system that scales independently of his availability. Miss it, and he's added a layer of indirection that slows everything down.

Build the repo. Write the CLAUDE.md with the five sections above. Test it against reality. Ship it or kill it in two sprints.

— **Jeff Delaney**
