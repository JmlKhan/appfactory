---
name: design-system
description: Create DESIGN.md and theme.ts — the app's brand and design tokens — from an approved BRIEF.md.
---

# Design system

Inputs: approved `docs/BRIEF.md`, optional mood references from the human.
Outputs: `docs/DESIGN.md` and `app/src/theme/theme.ts` (tokens only — the Architect may write this one code file). Then STOP at the gate.

## Steps
1. Propose 2 brand directions in ≤6 lines each (name ideas, mood, palette, type). Recommend one. Wait for the human to pick.
2. Write DESIGN.md:
   - **Brand** — name, personality (3 words), tone of voice per language (uz/ru/en), do/don't examples.
   - **Color** — semantic tokens for light AND dark: background, surface, surfaceAlt, text, textMuted, primary, onPrimary, accent, success, warning, danger, border. Hex values. Check text/background contrast ≥ 4.5:1 and say so.
   - **Typography** — font family (must be free for commercial use and support Uzbek Latin + Cyrillic), scale: display, title, heading, body, caption, numeric (for clock digits). Sizes in pt, weights, line heights.
   - **Spacing & shape** — 4-pt grid scale, radius scale, elevation/shadow rules.
   - **Components** — Button (primary/secondary/ghost/destructive, sizes, states), Card, ListRow, Toggle, TimePicker, Sheet, Tag/Chip, EmptyState, PaywallPlanCard, ProgressBar. For each: anatomy, states, token usage.
   - **Motion** — durations and easing; haptics usage.
   - **Iconography & illustration** — style rules; must not resemble the reference app.
   - **Accessibility** — Dynamic Type support, min tap target 44pt, VoiceOver label rules.
3. Write `theme.ts` exporting `colors.light`, `colors.dark`, `typography`, `spacing`, `radius`, `shadow`, `motion` matching DESIGN.md exactly.
4. GATE: summarize, ask the human to approve.
