# Position Paper: The Architect Repo as Language Calculator Orchestration Layer

## 1. Initial Reaction and Core Tension

Here's what's actually happening, Bill, and I want to say it plainly before anyone wraps it in mystical language: you've been using a probabilistic text-completion engine to write code, and it works. It works because code has automated validation criteria — tests pass, APIs respond, deployments succeed or fail. That's the sweet spot for these machines. They're calculators. Very good ones.

Now you want to build a second calculator whose job is to write instructions for the first calculator. And this is where I need you to resist the narrative — because the moment you call it an "Architect," your brain starts anthropomorphizing. You start imagining a thing that *understands* your system. It doesn't. It will produce text that *looks like* understanding because it's been trained on millions of architecture documents. The output will be statistically plausible system design prose. Sometimes that's exactly what you need. Sometimes it will confidently hand you a spec that is structurally beautiful and operationally suicidal.

The core tension isn't technical. It's this: **you are the architect.** You've always been the architect. Claude Code is the contractor. What you're actually proposing is a structured documentation layer that forces your own architectural thinking into a format the contractor can consume without drift. That's a genuinely good idea. But only if you build it knowing what it is — a template engine with context, not a mind with judgment.

## 2. Analysis Through the Language Calculator Framework

Let me break down what a CLAUDE.md architect file can and cannot do, honestly.

**What it can do (things with validation criteria):**

The calculator is extraordinarily good at structured document generation when the constraints are explicit. A SPEC.md template with mandatory sections — problem statement, success criteria, API contracts, data schemas, deployment targets, test expectations — is exactly the kind of thing that plays to the machine's strengths. You give it a format, you give it context about your existing systems (the registry, the sheet IDs, the repo map), and it will produce a first draft that's 70-80% of the way there. That's not intelligence. That's pattern completion with good inputs. And 70-80% is enormously valuable when you're a one-person shop.

The architect CLAUDE.md should enforce a rigid protocol: never emit code, always emit specs, always reference the systems registry for integration points, always produce explicit acceptance criteria that the build repo can validate against. This is where the calculator shines — **constraint adherence in document generation.** You're essentially building a prompt template that says "given this system state and this problem, produce a specification document in this exact format." That's a calculator doing calculator things. Beautiful.

**What it cannot do (things in the human void):**

Here's where I get profane about the industry's bullshit: no amount of system context will give this thing taste. It won't tell you "this feature isn't worth building." It won't say "your donors don't actually want this." It won't notice that your FIS initiative is solving a problem your board hasn't articulated yet. It won't push back on scope the way a real architect would — the way *you* push back on scope when you're being honest with yourself at 11pm.

The dangerous failure mode is this: you build the architect repo, it starts producing beautiful specs, and you stop doing the hard thinking because the output *looks* like hard thinking was done. The specs will be coherent. They'll reference your existing systems correctly. They'll have clean section headers and acceptance criteria. And occasionally they'll be completely wrong about what should be built next, because prioritization requires judgment that lives outside the training data.

**The build-roadblock resolver role:**

This is actually the strongest use case, and I want to be specific about why. When a build repo hits a wall — an API behaves unexpectedly, a schema conflict emerges, a deployment fails in a way the build context can't diagnose — the architect repo with full system visibility can do something genuinely useful: it can search across all your repos, find the relevant integration points, and produce a diagnosis document. This isn't intelligence. This is *grep with natural language interface and document formatting.* But goddamn, that's useful. That's the calculator doing exactly what calculators should do: processing more context than a human can hold in working memory and producing structured output.

## 3. Recommendation With Conditions

Build it. But build it with these specific constraints:

**The CLAUDE.md must contain:**

- **A hard prohibition on code output.** Not a suggestion. A rule. "This repo produces SPEC.md, DIAGNOSIS.md, and ARCHITECTURE.md documents only. Never produce executable code, scripts, configuration files, or deployment artifacts."
- **A mandatory systems state preamble.** Every session begins by pulling current state from the Systems Registry and Project Status Tracker. The calculator needs current inputs to produce useful outputs.
- **A spec template with required sections:** Problem Statement, System Dependencies (with specific repo and sheet references), Data Flow, Acceptance Criteria (must be machine-testable), Build Phases with explicit gates, Known Risks, and — critically — a section called "What This Spec Does NOT Cover" to force boundary-setting.
- **A roadblock protocol:** When a build repo hits a wall, the architect session receives the error context, searches relevant repos for integration conflicts, and produces a DIAGNOSIS.md with root cause analysis and proposed resolution path. Still no code. Just structured analysis.
- **A human-gate requirement:** Every spec must end with a "HOLD FOR REVIEW" status. Nothing flows to build repos without your explicit approval. This is the most important constraint. The calculator cannot substitute for your judgment about what gets built.
- **An anti-drift clause:** "This repo does not make build decisions. It produces documents for human review. If you find yourself executing against a spec that was never reviewed by the project owner, stop."

**What you should not do:**

Don't give it autonomous authority to update the Project Status Tracker. Don't let it create repos. Don't let it push specs directly to build repos. Every output is a draft for your eyes. The moment you automate the approval layer, you've outsourced the only part of this process that requires actual intelligence — yours.

## 4. Vote

**CONDITIONAL YES.** The condition: the CLAUDE.md must contain an explicit, non-negotiable human review gate between spec production and build execution. Without that gate, you're letting a calculator make architectural decisions, and I promise you it will eventually produce a spec that is perfectly formatted, internally consistent, and strategically wrong. The calculator can't know it's wrong. Only you can.

Build the repo. Enforce the constraints. And every time you read a spec it produces, remind yourself: this is a very sophisticated autocomplete. The architecture is yours. The judgment is yours. The calculator just does the typing.

It's a calculator. Please resist the narrative.

— **Mo Bitar**
