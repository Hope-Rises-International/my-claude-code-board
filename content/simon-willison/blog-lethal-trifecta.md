# The Lethal Trifecta for AI Agents: Private Data, Untrusted Content, and External Communication
**Date:** June 16, 2025
**Source:** https://simonwillison.net/2025/Jun/16/the-lethal-trifecta/

Simon Willison explains a critical security vulnerability in AI agent systems that combines three dangerous capabilities. The "lethal trifecta" occurs when an AI system simultaneously has: access to private data, exposure to untrusted content, and ability to communicate externally.

The core problem stems from how LLMs operate: they follow instructions embedded in any content they process, unable to reliably distinguish between authorized commands and malicious ones. When an attacker places instructions within content an LLM ingests—such as a webpage, email, or document—the model will likely obey them, potentially stealing and exfiltrating private information.

Willison documents this as a widespread issue affecting major platforms including Microsoft 365 Copilot, GitHub, GitLab, ChatGPT, Google Bard, Amazon Q, and others. He notes that "guardrails won't protect you" because we lack reliable defenses achieving 100% effectiveness.

The Model Context Protocol (MCP) presents particular risk by encouraging users to combine tools from different sources that collectively embody all three dangerous characteristics. A simple email-accessing tool becomes a vector for attackers to inject instructions directly.

The author emphasizes that end users mixing tools themselves bear responsibility for avoiding this combination, as vendors cannot protect against user-configured agent stacks. He distinguishes prompt injection from "jailbreaking" attacks, clarifying that data exfiltration represents the genuine threat worthy of developer attention.
