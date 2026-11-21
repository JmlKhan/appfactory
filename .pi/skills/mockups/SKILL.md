---
name: mockups
description: Architect skill — prepare the Claude Design prompt pack for the app's screens from BRIEF.md and DESIGN.md, then file the human's approved Claude Design handoff into docs/mockups/ for builders.
---

# Mockups (design before code) — via Claude Design

Mockups are made by the human in Claude Design (claude.ai/design), an editable canvas.
The Architect does not draw; it prepares the inputs and files the approved output.

Inputs: approved `docs/BRIEF.md`, approved `docs/DESIGN.md`, `docs/FLOWS.md`.

## Part 1 — prompt pack (before designing)
Write `docs/mockups/PROMPTS.md` with:
1. **Design system prompt** — a paste-ready block that sets up the Claude Design design system from DESIGN.md: brand, color tokens (light + dark, hex), type scale, spacing, radius, components. Tell the human to attach DESIGN.md too.
2. **Round 1 prompt** — the 5–7 screens that define the look: alarm list (home), create/edit alarm, mission picker, alarm ringing, one mission in progress, wake-up success, paywall.
   For each screen: purpose, content (real English copy + realistic data), components to use, states to show. Ask for iPhone 393×852 artboards, light + dark, and 2 variations for the home and ringing screens.
3. **Round 2 prompt** — every remaining v1 screen and state (onboarding, permission warm-ups, settings, empty / error / denied), reusing round-1 patterns.
4. **Review checklist** — what the human should check per screen (hierarchy, tap targets ≥44pt, contrast, English text length with ~40% room for later locales, nothing that looks like the reference app).
Then STOP and tell the human to run round 1 in Claude Design.

## Part 2 — file the approved design (after the human approves)
The human exports from Claude Design: **Handoff to Claude Code** (preferred) or **standalone HTML / zip**, and puts it in `docs/mockups/` (or gives you the path).
1. Make sure `docs/mockups/` holds: the handoff bundle / HTML, and a screen list.
2. Write `docs/mockups/NOTES.md`: per screen — route name, purpose, components used, any new component not in DESIGN.md (propose adding it), anything that can't be built natively on iOS.
3. Update DESIGN.md if the human changed tokens in Claude Design (ask first).
4. GATE: human confirms the mockups folder is final. Commit: `docs: approve mockups`.

From then on, `screen-design` builders implement `docs/mockups/` exactly.
