#!/bin/bash
# Fetch YouTube transcripts for all advisors

CONTENT_DIR=~/boardroom-advisors/content
TMP_DIR=/tmp/yt-transcripts
mkdir -p "$TMP_DIR"

fetch_transcript() {
    local video_id="$1"
    local output_file="$2"
    local title="$3"
    local tmp_base="$TMP_DIR/$video_id"

    # Try auto-subs first, then manual subs
    yt-dlp --write-auto-sub --sub-lang en --skip-download --sub-format vtt \
        -o "$tmp_base" "https://www.youtube.com/watch?v=$video_id" 2>/dev/null

    local vtt_file=""
    if [ -f "${tmp_base}.en.vtt" ]; then
        vtt_file="${tmp_base}.en.vtt"
    elif ls ${tmp_base}*.vtt 1>/dev/null 2>&1; then
        vtt_file=$(ls ${tmp_base}*.vtt | head -1)
    fi

    if [ -z "$vtt_file" ]; then
        # Try manual subs
        yt-dlp --write-sub --sub-lang en --skip-download --sub-format vtt \
            -o "$tmp_base" "https://www.youtube.com/watch?v=$video_id" 2>/dev/null
        if [ -f "${tmp_base}.en.vtt" ]; then
            vtt_file="${tmp_base}.en.vtt"
        elif ls ${tmp_base}*.vtt 1>/dev/null 2>&1; then
            vtt_file=$(ls ${tmp_base}*.vtt | head -1)
        fi
    fi

    if [ -n "$vtt_file" ]; then
        # Get upload date
        local date=$(yt-dlp --print "%(upload_date)s" "https://www.youtube.com/watch?v=$video_id" 2>/dev/null)
        local formatted_date="${date:0:4}-${date:4:2}-${date:6:2}"

        # Convert VTT to clean text
        {
            echo "# $title"
            echo "**Date:** $formatted_date"
            echo "**Source:** YouTube"
            echo ""
            # Remove VTT headers, timestamps, and deduplicate lines
            python3 -c "
import re, sys
lines = open('$vtt_file').read()
# Remove WEBVTT header and metadata
lines = re.sub(r'WEBVTT.*?\n\n', '', lines, flags=re.DOTALL)
# Remove timestamps and position info
lines = re.sub(r'\d{2}:\d{2}:\d{2}\.\d{3} --> \d{2}:\d{2}:\d{2}\.\d{3}.*\n', '', lines)
# Remove HTML tags
lines = re.sub(r'<[^>]+>', '', lines)
# Split into lines, deduplicate consecutive
prev = ''
result = []
for line in lines.split('\n'):
    line = line.strip()
    if line and line != prev and not re.match(r'^\d+$', line):
        result.append(line)
        prev = line
print(' '.join(result))
"
        } > "$output_file"
        echo "  ✓ $output_file"
        rm -f "$vtt_file"
    else
        echo "  ✗ No transcript for $video_id ($title)"
    fi
}

echo "=== Mo Bitar YouTube ==="
fetch_transcript "pzkwn3hu1Cc" "$CONTENT_DIR/mo-bitar/yt-01.md" "I was a 10x engineer. Now I'm useless." &
fetch_transcript "ateDMU5EGeg" "$CONTENT_DIR/mo-bitar/yt-02.md" "Cloudflare just broke all the rules" &
fetch_transcript "PQ0hzXfDSfE" "$CONTENT_DIR/mo-bitar/yt-03.md" "Anthropic nearly started a war. Here's how to make sense of their strategy." &
fetch_transcript "JE1vMSUEBG0" "$CONTENT_DIR/mo-bitar/yt-04.md" "Companies are lying about AI" &
fetch_transcript "Fnj93S6NCTA" "$CONTENT_DIR/mo-bitar/yt-05.md" "Anthropic is seriously tripping" &
fetch_transcript "KMUBAzvz_Jc" "$CONTENT_DIR/mo-bitar/yt-06.md" "6-figure software engineers are now driving Ubers" &
fetch_transcript "ov2k9xPLZ5o" "$CONTENT_DIR/mo-bitar/yt-07.md" "ChatGPT Pro is lapping Einstein" &
fetch_transcript "7Sd4k3Q1NHs" "$CONTENT_DIR/mo-bitar/yt-08.md" "AI psychosis is spreading" &
wait
echo ""

echo "=== Nate Herk YouTube ==="
fetch_transcript "99VHENEKA9o" "$CONTENT_DIR/nate-herk/yt-01.md" "100 Hours Testing Claude Code vs Antigravity (honest results)" &
fetch_transcript "4XqVR6xI6Kw" "$CONTENT_DIR/nate-herk/yt-02.md" "This One Plugin Just 10x'd Claude Code" &
fetch_transcript "NvxiSG34mPU" "$CONTENT_DIR/nate-herk/yt-03.md" "Seedance 2.0 + Claude Code Creates \$10k Websites in Minutes" &
fetch_transcript "1EPsUXSManU" "$CONTENT_DIR/nate-herk/yt-04.md" "Claude Just Told Us to Stop Using Their Best Model" &
fetch_transcript "eu8UJtuIi-E" "$CONTENT_DIR/nate-herk/yt-05.md" "I Gave OpenClaw \$10,000 to Trade Stocks" &
fetch_transcript "27Y44JYXZJ8" "$CONTENT_DIR/nate-herk/yt-06.md" "I Tested Claude's New Managed Agents... What You Need To Know" &
fetch_transcript "T4fXb3sbJIo" "$CONTENT_DIR/nate-herk/yt-07.md" "Planning In Claude Code Just Got a Huge Upgrade" &
fetch_transcript "sboNwYmH3AY" "$CONTENT_DIR/nate-herk/yt-08.md" "Andrej Karpathy Just 10x'd Everyone's Claude Code" &
wait
echo ""

echo "=== Simon Scrapes YouTube ==="
fetch_transcript "38t5UBCa4OI" "$CONTENT_DIR/simon-scrapes/yt-01.md" "Every Claude Code Workflow Explained (& When to Use Each)" &
fetch_transcript "uhMCy25NBfw" "$CONTENT_DIR/simon-scrapes/yt-02.md" "Stop Using Claude Code in Terminal (It's Holding You Back)" &
fetch_transcript "7Sn10hZWPuQ" "$CONTENT_DIR/simon-scrapes/yt-03.md" "The Only Claude Code Updates You Need to Know (Apr 2026)" &
fetch_transcript "-9uojnGzcJo" "$CONTENT_DIR/simon-scrapes/yt-04.md" "200+ Hours of Claude Code Lessons in 14 Minutes (for business owners)" &
fetch_transcript "p37qo3oLai8" "$CONTENT_DIR/simon-scrapes/yt-05.md" "The Easiest Way to Get Ahead With Claude Code" &
fetch_transcript "-u_igSQHAIo" "$CONTENT_DIR/simon-scrapes/yt-06.md" "Every Level of Claude Code Skills in 27 mins" &
fetch_transcript "5AfSB0sWihw" "$CONTENT_DIR/simon-scrapes/yt-07.md" "How Smart People Are Using Claude Code Skills to Automate Anything" &
fetch_transcript "wQ0duoTeAAU" "$CONTENT_DIR/simon-scrapes/yt-08.md" "Build Self-Improving Claude Code Skills. The Results Are Crazy." &
wait
echo ""

echo "=== Simon Willison YouTube ==="
fetch_transcript "bKrAcTf2pL4" "$CONTENT_DIR/simon-willison/yt-01.md" "FastRender with Wilson Lin - building a web browser with swarms of thousands of coding agents" &
fetch_transcript "T8xiMgmb8po" "$CONTENT_DIR/simon-willison/yt-02.md" "Under the hood of Canada Spends with Brendan Samek" &
fetch_transcript "BoPZltKDM-s" "$CONTENT_DIR/simon-willison/yt-03.md" "How I automate my Substack newsletter with content from my blog" &
fetch_transcript "qy4ci7AoF9Y" "$CONTENT_DIR/simon-willison/yt-04.md" "My process for upgrading Datasette plugins with uv and OpenAI Codex CLI" &
fetch_transcript "GQvMLLrFPVI" "$CONTENT_DIR/simon-willison/yt-05.md" "Using Claude Code for web to build a tool to copy-paste share terminal sessions" &
fetch_transcript "CDilLbFP1DY" "$CONTENT_DIR/simon-willison/yt-06.md" "Congressional Travel Explorer with Derek Willis" &
fetch_transcript "Th5WOyjuRdk" "$CONTENT_DIR/simon-willison/yt-07.md" "llm-consortium with Thomas Hughes" &
fetch_transcript "9pEP6auZmvg" "$CONTENT_DIR/simon-willison/yt-08.md" "llm-logs-feedback with Matthias Lübken" &
wait
echo ""

echo "=== Fireship YouTube ==="
fetch_transcript "d3Qq-rkp_to" "$CONTENT_DIR/fireship/yt-01.md" "Claude Mythos is too dangerous for public consumption..." &
fetch_transcript "-01ZCTt-CJw" "$CONTENT_DIR/fireship/yt-02.md" "Google just casually disrupted the open-source AI narrative…" &
fetch_transcript "JSuS-zXMVwE" "$CONTENT_DIR/fireship/yt-03.md" "Cursor ditches VS Code, but not everyone is happy..." &
fetch_transcript "vd14EElCRvs" "$CONTENT_DIR/fireship/yt-04.md" "He just crawled through hell to fix the browser…" &
fetch_transcript "mBHRPeg8zPU" "$CONTENT_DIR/fireship/yt-05.md" "Tragic mistake... Anthropic leaks Claude's source code" &
fetch_transcript "o7NYXvYohYk" "$CONTENT_DIR/fireship/yt-06.md" "Millions of JS devs just got penetrated by a RAT…" &
wait
fetch_transcript "wfeiCZK0mNs" "$CONTENT_DIR/fireship/yt-07.md" "Anthropic just released the real Claude Bot..." &
fetch_transcript "nxwkn9Dt9-I" "$CONTENT_DIR/fireship/yt-08.md" "Tech bros optimized war… and it's working" &
fetch_transcript "nkY_s9HpL9M" "$CONTENT_DIR/fireship/yt-09.md" "This new Linux distro is breaking the law, by design…" &
fetch_transcript "qaB5HF4ax9M" "$CONTENT_DIR/fireship/yt-10.md" "Google just changed the future of UI/UX design..." &
fetch_transcript "ReAnFFqvCeA" "$CONTENT_DIR/fireship/yt-11.md" "How to burn \$30m on a JavaScript framework..." &
fetch_transcript "Xn-gtHDsaPY" "$CONTENT_DIR/fireship/yt-12.md" "7 new open source AI tools you need right now…" &
wait
echo ""

echo "=== DONE ==="
