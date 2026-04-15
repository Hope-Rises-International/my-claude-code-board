# Boardroom Context — Bill Simmons / Hope Rises International

## Who I Am

I am the President and CEO of Hope Rises International (HRI), a Christian humanitarian nonprofit focused on neglected tropical diseases. We have fewer than 25 staff, approximately $4.8M in public fundraising revenue, and are headquartered in Greenville, SC. I am 56 years old, an ENTJ, and was a retail chain CEO for 20 years before moving to the nonprofit sector. I also chair the Accord Network, a Christian relief and development alliance.

## What I Build and How

I function as the primary systems architect for HRI's AI-driven technology infrastructure. I am not a developer. I have never written a line of code manually. Every system I have built was created by directing Claude Code in plain English through GitHub repositories.

My workflow has two layers with strict separation. Claude.ai is for architecture, design, specification, and review. Claude Code is for all implementation, API operations, file management, and deployment. I never manually run scripts or terminal commands.

I maintain a Claude Pro plan at the highest tier for my personal build work. HRI staff run on Claude Team plan.

## The Stack

HRI's foundation systems are Google Workspace, Salesforce NPSP, Sage Intacct, Expensify, and Google Cloud Platform. All custom automation connects to these via their APIs. GitHub hosts all code in the Hope-Rises-International org. Google Sheets serves as the integration hub — readable by everyone, requires no training.

The custom layer built with Claude Code currently includes: a Gmail Inbox Agent that autonomously triages the CEO inbox 4x daily handling 60% of email automatically, an API gateway (Sheets Bridge) that lets any automation read/write Google Sheets via REST, a living Systems Registry that auto-updates after every Claude Code session, a Campaign Scorecard pipeline connecting Salesforce to Google Sheets, a Donor File Health Dashboard on Cloud Run, an Aegis data processing pipeline, a Major Gift App for donor briefings, and several other deployed tools.

Total custom code across all systems is approximately 9,000+ lines of Python, Apps Script, and HTML/JS, all written by Claude Code.

## The Current Initiative

The central build initiative is the Fundraising Intelligence System (FIS) — a suite of custom analytics and campaign intelligence tools on Salesforce, GCP, and Google Sheets designed to be agency-agnostic with HRI owning all data and reporting. Components include the Campaign Scorecard, Donor File Health Dashboard, Segmentation Builder (spec complete, build pending), Direct Mail Template Engine (spec in progress), Appeal Index Manager, and a Configuration Registry to eliminate hardcoded values across 29 repositories.

HRI recently terminated its direct mail agency (TLC) and selected VeraData Consulting as the replacement starting May 2026. This transition is a driving force behind the FIS — HRI must own its own data intelligence rather than depending on any agency.

## Build Philosophy and Constraints

Build custom over SaaS. Own all data, reporting, and institutional memory regardless of agency or vendor. Third-party dependencies like Zapier or middleware are avoided unless internal development is impossible.

Data before dashboards before automation. Validate data first, build UI second, automate pipelines last. Never skip the sequence.

One repo per deployable tool. If it deploys independently, it gets its own repo.

Small bets and chunked execution. One Claude Code session per build phase. Explicit gate criteria between phases. Full builds in one session is an anti-pattern.

Spec-first with phased build gates. Comprehensive architectural blueprints drive Claude Code sessions one phase at a time. When Claude Code fails twice on the same problem, return to claude.ai for architectural reassessment.

No dedicated IT staff. I am the builder. Craig Calvert (Senior Program Finance) is a second Claude Code builder in the finance domain. Kelly Parks (Operations) is emerging as a third. There is no IT department and no budget for one.

## Values and Decision-Making Style

I am highly directive, think in systems, surface dependencies and scope risks proactively, correct assumptions immediately with short declarative statements, and prefer honest assessments over diplomatic ones. I dislike hedged recommendations.

The intelligence lives in the systems — repos, pipelines, dashboards, specs — not in the AI. Claude Code is the builder, not the platform. At runtime, nothing depends on Claude.

I use ChatGPT and Gemini as spec review gates before build, triaging their critiques for HRI-context relevance.

My quote: "Jesus didn't give us a global aid strategy. He gave us a cross and a command: love your neighbor."

My lowest-friction philosophy: "The lowest friction system is the one that people actually use."

## What Decisions I Bring to This Boardroom

Architecture choices for Claude Code builds. Whether to build a new tool or extend an existing one. How to sequence phased builds. Whether a problem needs custom code or can be solved with existing platform features. When to invest time in automation versus manual process. How to evaluate tools, vendors, and build approaches. Strategic trade-offs between speed and robustness. Whether the current approach to a system is sound or needs rethinking.
