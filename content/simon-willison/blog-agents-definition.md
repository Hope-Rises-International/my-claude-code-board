# I think "agent" may finally have a widely enough agreed upon definition to be useful jargon now

**Date:** 18th September 2025

## Key Definition

Simon Willison proposes this working definition: **"An LLM agent runs tools in a loop to achieve a goal."**

## Main Points

Willison explains he's historically avoided using "agent" as jargon because the term lacked consensus meaning. He collected over 200 definitions from Twitter and found thirteen distinct groupings, making productive communication difficult.

The "tools in a loop" framework has gained traction in AI engineering spaces. The LLM requests actions through its interface, receives results, and continues reasoning toward a specified goal. This pattern is embedded in many modern LLM APIs.

**Memory consideration:** While some argue agents require long-term memory, the conversation history itself provides essential short-term context. Additional tools can handle persistent memory if needed.

## Problematic Definitions

Willison critiques the business world's tendency to frame agents as human staff replacements. He notes this approach ignores accountability—humans take responsibility for decisions while AI systems cannot. He references a 1979 IBM slide stating: "A computer can never be held accountable."

## OpenAI's Inconsistency

OpenAI complicates matters by using "agent" for three different concepts: Sam Altman's autonomous systems rhetoric, ChatGPT's browser automation feature, and their Agents SDK (closest to the tools-in-a-loop model).

Willison concludes that technical implementers can now use this definition productively within AI engineering contexts, though business discussions still require clarification.
