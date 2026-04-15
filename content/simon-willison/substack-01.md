# Meta's New Model Is Muse Spark, and meta.ai Chat Has Interesting New Tools
**Date:** April 10, 2026

Meta announced Muse Spark, their first model release since Llama 4 nearly a year ago. It's a hosted, non-open-weights model available as a private API preview to select users, though it can be tried on meta.ai with Facebook or Instagram login.

## Performance and Modes

Meta's self-reported benchmarks position Muse Spark competitively with Opus 4.6, Gemini 3.1 Pro, and GPT 5.4 on selected metrics, though it lags on Terminal-Bench 2.0. The company acknowledges performance gaps in areas like long-horizon agentic systems and coding workflows.

The model operates in two modes on meta.ai: "Instant" and "Thinking." A "Contemplating" mode promising extended reasoning capabilities is planned for future release.

## Tool Capabilities

Meta's chat interface includes 16 integrated tools that users can leverage:

- **Web capabilities**: `browser.search` for web searches, `browser.open` to load full pages, and `browser.find` for pattern matching
- **Meta content**: `meta_1p.content_search` enables semantic searching across Instagram, Threads, and Facebook posts from the user's accessible content since January 2025
- **Product search**: `meta_1p.meta_catalog_search` searches Meta's product catalog
- **Image generation**: `media.image_gen` creates images with "artistic" or "realistic" modes in multiple aspect ratios
- **Code execution**: `container.python_execution` provides Python 3.9 with libraries including pandas, numpy, matplotlib, scikit-learn, and others
- **Visual grounding**: `container.visual_grounding` analyzes images, identifies objects, and returns results in bbox, point, or count formats
- **Web artifacts**: `container.create_web_artifact` generates HTML or SVG content for sandboxed iframe displays
- **Media downloads**: `container.download_meta_1p_media` pulls content from Meta platforms into the sandbox
- **File operations**: `container.view`, `container.insert`, and `container.str_replace` for file management
- **Sub-agents**: `subagents.spawn_agent` delegates tasks to independent agents
- **Account linking**: `third_party.link_third_party_account` for Google Calendar, Outlook Calendar, Gmail, and Outlook

## Pelican Test Results

The "Instant" mode produced a basic pelican with geometric elements and a misaligned bicycle. The "Thinking" mode generated significantly better results--a clearly recognizable pelican wearing a bicycle helmet aboard a properly-shaped bicycle.

When prompted to analyze a generated raccoon image wearing trash as a hat, Meta AI demonstrated practical application of these tools. OpenCV analysis produced a dashboard showing edge detection, dominant colors, and histograms. The visual grounding tool identified eight components including the coffee cup, banana peel, newspaper, and the raccoon itself with normalized coordinates.

## Technical Details

The Instant model output SVG with code comments directly, while Thinking mode wrapped results in HTML with unused Playables SDK libraries. Image generation appears powered by Meta's Emu model, with generated images saved to a sandbox accessible by subsequent Python operations.

When asked to count pelicans in a photograph, Meta AI identified 25 brown pelicans on rocks and numbered each one in an annotated image overlay.

## Future Plans

Alexandr Wang indicated that "bigger models are already in development with infrastructure scaling to match" and noted plans to "open-source future versions" after the private API preview phase.

Artificial Analysis scored Meta Spark at 52, positioning it behind only Gemini 3.1 Pro, GPT-5.4, and Claude Opus 4.6. The prior year's Llama 4 Maverick and Scout scored 18 and 13 respectively, suggesting meaningful capability advancement.

The company emphasizes efficiency gains--"over an order of magnitude less compute than our previous model, Llama 4 Maverick"--compared to leading base models.

## Related Topics

The post also covers Anthropic's Project Glasswing, which restricts Claude Mythos access to security researchers and selected partners due to demonstrated cybersecurity research capabilities, and the Axios supply chain attack, which involved sophisticated social engineering targeting an individual maintainer.
