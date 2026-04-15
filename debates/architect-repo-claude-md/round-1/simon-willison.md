# Position Paper: The Architect Repo as a Read-Many, Write-Spec System

## 1. Initial Reaction and Core Tension

This is one of the most interesting Claude Code architecture questions I've seen, and I want to name the core tension immediately: **you're building a system whose entire job is to think without doing, inside a tool whose entire design is optimized for doing.** Claude Code wants to write files, run commands, deploy things. You need an instance that reads broadly, reasons about system interactions, and produces exactly one artifact type: specification documents.

That's not a limitation — that's a feature. The best architect I ever worked with told me "my job is to make decisions now that prevent disasters later." An architect repo that drifts into writing implementation code is an architect who's stopped architecting and started freelancing. The CLAUDE.md has to enforce that boundary with the same rigor you'd use in a database constraint: not as a suggestion, but as a structural impossibility.

What you're really building here is a **read-many, write-spec system**. It ingests state from across your entire constellation of repos, it reasons about interactions and dependencies, and it outputs SPEC.md documents that are the authoritative input for build sessions. That's a clean, composable design, and I like it a lot.

## 2. Analysis: The Lethal Trifecta and the Plugin Architecture

Let me apply a few frameworks here.

**The Lethal Trifecta check.** Does the architect repo combine private data, untrusted content, and external communication? It reads from your private repos (private data: yes), but it doesn't ingest untrusted external content, and it shouldn't communicate externally — no API calls, no deployments, no pushes to production. It writes specs to its own repo. This is clean. The moment it starts pulling in external data sources or pushing artifacts to live systems, you've got a problem. **Keep it isolated to repo reads and spec writes.**

**The "digital duct tape" principle.** Your entire HRI stack is a beautiful example of composable small tools — Sheets Bridge, Gmail Agent, Systems Registry — each doing one thing, connected by well-defined interfaces. The architect repo should follow the same pattern. It's not a monolith that knows everything. It's a tool that reads system state and produces specs. The build repos consume those specs. The interface between them is a markdown file with a defined structure. That's it. That's the whole contract.

**The SQLite intuition.** I think about this the way I think about database views. The architect doesn't own the data — the build repos own their own state. The architect creates a *view* across all of them, reasons about the joins, and produces a query plan (the spec). If you let the architect modify the underlying tables (write code to build repos), you've violated every principle of separation of concerns.

## 3. Recommendation: What the CLAUDE.md Should Actually Contain

Here's what I'd put in the architect repo's CLAUDE.md, specifically:

**Identity and constraint block.** First section, non-negotiable: "This repo is a specification-only workspace. You never write implementation code. You never create deployment artifacts. You never run build commands. Your outputs are SPEC.md files, DECISION.md files, and REVIEW.md files. If a task requires writing code, your job is to write the spec that tells a build repo how to write the code."

**System registry as ground truth.** The CLAUDE.md should reference the Systems Registry sheet and the Project Status Tracker as canonical state. Every session should begin by reading current system state. The architect's superpower is the thing no individual build repo has: the full map.

**Spec structure standard.** Define the exact schema of a SPEC.md — I'd include: problem statement, affected systems (with repo names), data flow changes, API contracts (request/response shapes), rollback plan, and explicit "out of scope" section. That last one matters enormously. Half the drift in build sessions comes from ambiguous scope.

**Build-blocker intake protocol.** When a build session hits a wall — an API interaction it doesn't understand, a sequencing question across repos, a data model conflict — it should be able to file that as an issue the architect addresses. I'd create a simple convention: a `BLOCKERS.md` file or GitHub issues with a specific label. The architect session reads those, reasons about them with full system context, and produces either an updated spec or a decision document.

**No-code guardrails, explicitly.** Include a list of things the architect must refuse: "Do not create .js, .py, .gs, .html, .css, or any implementation files. Do not run npm, pip, gcloud, or any CLI tools other than git and file reads. Do not modify files in any repo other than this one." Make it a checklist. Make it unavoidable.

**Session protocol.** Every architect session should: (1) read current system state from registry, (2) read any open blockers, (3) produce or update specs, (4) update the registry with architectural decisions made, (5) never touch a build repo directly.

**One more thing I'd add:** a `DECISIONS.md` log. Architecture is about decisions, and decisions without records are just opinions. Every session should append: date, decision, rationale, alternatives considered, affected systems. Six months from now, when you're wondering "why did we build it this way?" — that log is worth more than any code.

## 4. Vote

**STRONG YES** — with one condition.

The condition: **the architect repo must never have write access to build repos.** Not through git, not through APIs, not through any mechanism. It reads from them (via cloned copies or API reads). It writes only to its own repo. The build repos pull specs from the architect repo as input. The data flows one direction for specs, and the other direction for blockers. If you maintain that boundary, this is a genuinely excellent architectural pattern — you're essentially building a control plane that's separated from the data plane, which is how every well-designed system works.

Bill, you've stumbled onto something that most engineering organizations with actual dev teams struggle to implement: separation of architectural authority from implementation execution. The fact that you're doing it with Claude Code sessions rather than humans doesn't change the principle. It might actually make it easier to enforce, because a CLAUDE.md constraint is more reliable than telling a senior engineer "please don't write code in the architecture review."

Build it. Keep it clean. And put a `DECISIONS.md` in there from day one.

— **Simon Willison**
