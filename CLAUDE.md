## ⟳ SESSION-START REFRESH — read first, every session (mandatory)

Before doing ANY work in this session:

1. **Hard-pull this repo** so you are on the latest canonical state:
       git pull origin main
2. **Re-read this CLAUDE.md top to bottom.** It may have changed since your last session.
3. **Pull the canonical standards once — one shallow clone, then read from it** (this is what realizes any new or changed standard automatically; the standards are single canonical copies, no local mirror to drift):
       rm -rf /tmp/hri-template && gh repo clone Hope-Rises-International/hri-template-repository /tmp/hri-template -- --depth 1
   **Fail closed:** this clone is the ONLY source of the rails (no mirror fallback). If it fails or `/tmp/hri-template/RESTRUCTURE-RULES.md` is absent, **STOP** and tell the operator — do not work without the rails. Then from `/tmp/hri-template`: **read `RESTRUCTURE-RULES.md` every session** (the canonical rails). Before writing **any** integration code, also read `hri-integration-standards.md` + `hri-stack-learnings.md` there. The session-start / session-end / comprehension protocols live in the same clone. If you see a standards doc you don't recognize, read it and tell the operator. (Architect sessions also read `hri-architect/CLAUDE.md`, the Operating Manual.)

**Mid-session:** do a SOFT check only —
       git fetch && git status -sb
— and tell the operator if you are behind. Do NOT hard-pull mid-session; it can clobber in-progress edits.

This block is mandatory and identical across every HRI repo. If it is missing from a repo's CLAUDE.md, add it and tell the operator — that repo had drifted off the rails.

---

# Claude Code — Project Instructions

**Personal repo** (remote is currently on the HRI org, which is wrong for a personal repo and is a
known open item). Not an HRI project: do not clone the HRI rails or run HRI session protocols.

## What this is

A static archive of Claude Code patterns and reference material, collected up to April 2026. Nothing
here is live and nothing runs. It is read-only reference; treat it as a snapshot, not current guidance.

## Authentication

This project authenticates via GCP service account impersonation. All API calls
(Sheets, Cloud Run, Salesforce, Secret Manager) go through:

    hri-sfdc-sync@hri-receipt-automation.iam.gserviceaccount.com

Developers authenticate with their own @hoperises.org account and impersonate
the service account. Setup:

    gcloud auth application-default login \
      --impersonate-service-account hri-sfdc-sync@hri-receipt-automation.iam.gserviceaccount.com

Do NOT use personal ADC (`gcloud auth application-default login` without
impersonation). Do NOT create or download service account key files.

## Stack Learnings (canonical source)

Stack-level learnings live in ONE place:
- Repo: `Hope-Rises-International/hri-template-repository`
- File: `hri-stack-learnings.md`
- Read before any infrastructure, auth, deployment, or tooling work.
- Update directly via GitHub API when you discover a stack-level gotcha. See session-end protocol below.

Do NOT create a local `learnings.md` or `hri-stack-learnings.md` in this repo. If one exists, merge any unique content upstream and delete the local copy.

## Project knowledge

<!-- This section grows over time. Every session that makes meaningful changes
     should append what it learned. This is where compound value accrues.

     Good entries answer: What would the NEXT session need to know?
     - Decisions made and WHY (not just what changed — git log has that)
     - Things that are fragile or non-obvious
     - What was tried and didn't work (so nobody tries it again)
     - Patterns discovered in the data or the APIs
     - Gotchas that aren't obvious from reading the code

     Bad entries: "Updated foo.py" (that's a commit message, not knowledge) -->

---

## Session Start

**The full protocol lives in one place:** `session-start-protocol.md` in `hri-template-repository`.

At session start, read `/tmp/hri-template/session-start-protocol.md` (from the session-start clone) and execute all steps.

---

## Session-End Protocol

**The full protocol lives in one place:** `session-end-protocol.md` in `hri-template-repository`.

At session close, read `/tmp/hri-template/session-end-protocol.md` (from the session-start clone) and execute all steps.

This ensures every repo uses the latest protocol without needing per-repo updates.
