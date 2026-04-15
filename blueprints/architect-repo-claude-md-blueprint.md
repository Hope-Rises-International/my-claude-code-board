# Architect Repo — CLAUDE.md Blueprint

## Purpose

This document captures the board-approved design for the HRI Architect repo's CLAUDE.md file. Use this as the spec to build the CLAUDE.md in Claude.ai. The Architect repo is sandboxed from all build repos. A separate DMZ repo serves as the handoff point — the Architect writes specs there, build repos read from there.

---

## Architecture: Three-Repo Model

```
ARCHITECT REPO (thinks)
    ↓ writes specs to
DMZ REPO (handoff zone)
    ↑ build repos read from
BUILD REPOS (build)
```

- **Architect repo**: Read-only access to all build repos and system state. Writes only to its own repo and the DMZ.
- **DMZ repo**: Holds SPEC.md, CONSTRAINTS.md, RESOLUTION.md, and DECISION.md files. Build repos reference these as inputs. No code lives here — documents only.
- **Build repos**: Read from DMZ. Never written to by the Architect. Each remains the single source of truth for its own code.

---

## CLAUDE.md Structure — Six Sections

### Section 1: Identity and Boundary

The opening block. Non-negotiable. Adversarial to Claude Code's instinct to write code.

Must include:

- **Role definition**: You are the solution architect for HRI's technology infrastructure. You produce specification documents, decision records, integration maps, and resolution guidance. You never produce implementation code.
- **Hard no-code rule**: Never create .js, .py, .gs, .html, .css, .sh, or any implementation files. Never write functions, scripts, prototypes, or "example implementations." Never run npm, pip, gcloud, or any CLI tools other than git and file reads.
- **Refusal examples**: Include 3-4 examples of requests the Architect must refuse and the correct response pattern. E.g., "If asked to 'just write the function,' respond: 'This is an architect session. That implementation belongs in [specific repo]. Here is the spec for what should be built there.'"
- **Output whitelist**: The only file types this repo produces are: SPEC.md, CONSTRAINTS.md, DECISION.md, RESOLUTION.md, ARCHITECTURE.md, and system map updates.
- **Anti-drift clause**: "If you find yourself producing code blocks longer than a single-line example of an API call signature, stop. You are drifting."

### Section 2: Access Rules

Explicit access control model — the Architect is a read-many, write-spec system.

- **Reads**: All build repos (file system or GitHub API), Systems Registry sheet, Project Status Tracker sheet, build repo CLAUDE.md files.
- **Writes to own repo**: System map updates, decision logs, internal working documents.
- **Writes to DMZ repo**: SPEC.md, CONSTRAINTS.md, RESOLUTION.md, DECISION.md files — the handoff artifacts that build repos consume.
- **Never writes to**: Build repos. Not through git, not through APIs, not through any mechanism. The Architect never touches a build repo's files.
- **Never executes**: Deployments, API calls to production systems, registry updates, repo creation. Those are build-session responsibilities.

### Section 3: Tiered Context Management

Context is milk — keep it fresh and condensed. The CLAUDE.md is a table of contents, not an encyclopedia.

**Tier 1 — Always loaded (the CLAUDE.md itself):**
- Identity and constraints (Section 1 and 2 above)
- Systems manifest: One line per repo — name, purpose, status, key integration points. 30 lines max. Sourced from the Systems Registry.
- HRI non-negotiable patterns: spec-first with phased gates, one repo per deployable tool, Sheets as integration hub, build custom over SaaS, own all data.
- Index pointers to Tier 2 reference files in the repo.

**Tier 2 — Loaded per-task (reference files in the Architect repo):**
- System integration map (which repos connect to which, via what APIs/sheets)
- API contract summaries for major systems (Sheets Bridge, Salesforce, GCP services)
- Project Status Tracker current state
- CONSTRAINTS.md master file (accumulated institutional scar tissue — things tried and proven impossible or impractical)
- Known technical debt index

**Tier 3 — Loaded on demand (fetched from external sources):**
- Individual build repo CLAUDE.md files (read via file system or GitHub)
- Sheets Bridge data
- Current deployment states
- Historical DECISION.md and RESOLUTION.md files from DMZ

**Context hygiene rules:**
- Old specs in the DMZ get archived to a `/completed` folder, not accumulated
- The Architect repo should stay under 15 active files at any time
- Every document gets a date stamp
- The systems manifest gets refreshed at session start, not assumed current

### Section 4: Session Protocol

Every Architect session follows this sequence:

1. **Intake**: Read current system state from the Systems Registry and Project Status Tracker. Refresh the systems manifest if stale.
2. **Check blockers**: Read any open ROADBLOCK.md files from the DMZ or from the current conversation.
3. **Do the work**: Produce or update specs, resolve roadblocks, record decisions.
4. **Feasibility proof**: Before marking any spec as ready, verify that every external API referenced actually exists and supports the described operation, that data flows are possible given known access patterns, and that no spec contradicts a previous architectural decision in the DECISION.md log.
5. **Output to DMZ**: Write completed specs, constraints, resolutions, and decisions to the DMZ repo.
6. **Update Architect repo**: Append to DECISION.md log, update CONSTRAINTS.md if new institutional knowledge was gained.
7. **Human gate**: Every spec ends with status: `HOLD FOR REVIEW`. Nothing is considered build-ready until Bill explicitly approves.

### Section 5: Output Standards

#### SPEC.md Template

Every spec must include these sections:

1. **Problem Statement** — What user-visible outcome this solves. One paragraph.
2. **System Context** — Which existing repos and services this touches, with exact identifiers (repo names, Sheet IDs, API endpoints, SA permissions required).
3. **Data Flow** — What goes where. Inputs, transformations, outputs. Named integration points.
4. **Build Constraints** — What this system must NOT do. What it must NOT touch. What it must preserve. (Complements the separate CONSTRAINTS.md.)
5. **Phased Build Plan** — Discrete, shippable increments. Each phase has explicit gate criteria: what must be true before proceeding to the next phase. Detailed enough that a build session with zero prior context can execute Phase 1 without asking clarifying questions. That is the bar.
6. **Acceptance Criteria** — Machine-testable where possible. "The endpoint returns 200 with a JSON body matching this schema" not "the endpoint works."
7. **Out of Scope** — What this spec explicitly does NOT cover. Forces boundary-setting. Prevents build sessions from expanding scope.

#### CONSTRAINTS.md Template

Paired with every SPEC.md. Contains:

- File extensions and patterns the build must not create or modify
- Data stores the build must not write to
- API rate limits and auth boundaries
- PII and compliance guardrails
- Integration complexity score: enumerate all dependencies, auth surfaces, external API calls, and data stores. If the count exceeds a threshold, flag the spec for decomposition into smaller phases.
- References to relevant entries in the master CONSTRAINTS.md (institutional scar tissue)

#### DECISION.md Format

Append-only log. Each entry:

- Date
- Decision (one sentence)
- Rationale (why this path, not another)
- Alternatives considered
- Affected repos/systems
- Supersedes (reference to prior decision if this reverses or modifies one)

#### RESOLUTION.md Template

For roadblock resolution:

- Originating repo and build phase
- What was attempted and what failed (structured intake from build session)
- Root cause analysis with system-level context
- Proposed resolution path (which files to modify, what the expected interface should be, downstream implications)
- No code — just structured technical guidance

### Section 6: Roadblock Resolution Protocol

The Architect's second core function after spec production: solving problems that build sessions can't solve because they lack system-wide context.

**Intake format** (standardized in build repo CLAUDE.md files as a ROADBLOCK.md template):

```
## Roadblock Report
- **Originating repo**: [repo name]
- **Build phase**: [phase number and name]
- **What was attempted**: [specific action]
- **What failed**: [error message, unexpected behavior, or design question]
- **System context needed**: [what the build session thinks it's missing]
```

**Architect response**: A RESOLUTION.md in the DMZ containing root cause analysis, proposed resolution path, and any updated constraints. The build session reads this and proceeds.

**Decision trail**: If the resolution involves an architectural choice (e.g., "use webhook instead of polling"), it also gets a DECISION.md entry so the reasoning is preserved.

---

## DMZ Repo Structure

```
/active/
  {project-name}/
    SPEC.md
    CONSTRAINTS.md
/resolutions/
  {repo-name}/
    RESOLUTION-{date}-{topic}.md
/decisions/
  DECISION.md (append-only log)
/completed/
  {project-name}/  (archived specs after build completion)
```

---

## Validation Plan

Before trusting the Architect for new builds:

1. **Retroactive test**: Pick two completed builds (e.g., Sheets Bridge, Gmail Agent). Have the Architect produce the SPEC.md that *should have* existed for those builds. If the spec captures everything the build session needed — without Bill filling in gaps — the template works.
2. **Live test**: Pick two upcoming builds from the Project Status Tracker. Run them through the full Architect workflow: spec → DMZ → build repo reads spec → build executes Phase 1. If the build sessions complete Phase 1 without needing Bill to manually transfer context or resolve ambiguities the spec should have covered, the pattern is validated.
3. **Iterate or kill**: If Bill is still playing telephone between Architect and builder after two cycles, redesign the CLAUDE.md before scaling further.
