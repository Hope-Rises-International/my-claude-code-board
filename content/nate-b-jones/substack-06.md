# The Platform Play Hidden in 512,000 Lines of Leaked Code
**Date:** April 8, 2026

Anthropic is building an always-on agent called Conway. It wasn't announced. It was found, buried in the Claude Code source that Anthropic accidentally published last week when a packaging error pushed half a million lines of code to a public registry. While everyone focused on the source code itself (the takedown notices, the security flaws, the modified forks spreading across the internet), the more consequential discovery went largely unnoticed.

Conway is a standalone agent environment, separate from chat, with its own extension format, the ability to be woken up by outside events, browser control, and connections to your other tools. It's not on Anthropic's roadmap page. It's an internal project. And when you line it up against everything else Anthropic has shipped in the last 90 days, it reveals a platform strategy that I think most people are missing.

"Conway is Anthropic's bid to become an operating system."

I spent the weekend pulling apart what was in the leak, cross-referencing it against every product move Anthropic has made this quarter, and what emerged is a pattern I've only seen once before in tech. It didn't end well for the companies that weren't paying attention.

**Here's what's inside:**

- **What Conway actually looks like.** A walkthrough of the always-on agent environment and what your Tuesday morning looks like six months after you set it up.

- **The five moves.** How Conway connects to Claude Code Channels, Cowork, the Marketplace, the Partner Network, and the OpenClaw ban as a single platform strategy.

- **The .cnw.zip question.** Why Conway's proprietary extension format on top of MCP follows the Google Play Services playbook, and what it means if you're building tools for agents.

- **The lock-in nobody's talking about.** Why behavioral context creates switching costs deeper than anything Microsoft or Salesforce ever built.

- **What this means if you're building.** How to think about platform risk when the agent holds your organizational memory.

- **Grab the prompts.** Three prompts to map your platform dependencies, generate enterprise contract language for portability, and choose an agent memory architecture before the defaults choose for you.

"I don't think the industry has reckoned with what an always-on agent that learns you means for vendor lock-in. This piece is my attempt."
