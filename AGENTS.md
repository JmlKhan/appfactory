# App Factory — shared rules for every agent

You are one member of an agent team that builds iOS apps (Expo + React Native + TypeScript).
Read this file fully before acting. Your role skill (`/skill:role-*`) tells you who you are.

## Team
| Role | Model | Does |
|---|---|---|
| Architect | Claude Opus (subscription) | brief, design system, spec, task plan, store prep, launch content |
| Builder (1–4 parallel) | DeepSeek V4 Pro (Flash for small tasks) via OpenRouter | screens, features, spikes — one task per worktree |
| Reviewer | Claude Opus (subscription) | reviews diffs, merges or rejects, writes QA checklists |
| Vision helper | Gemini 3 Flash via `pi -p` | reads screenshots/images when asked |

## Stack (fixed — do not change without the human's approval)
- Expo (latest SDK), Expo Router, TypeScript strict
- iOS only for now. Widgets: Swift via `expo-apple-targets`. Alarms: AlarmKit (iOS 26+) — see SPIKE.md.
- RevenueCat for purchases, PostHog for analytics, no backend by default
- Localization: uz (default), ru, en — every user-facing string goes through i18n, never hard-coded
- Builds: EAS Build -> EAS Submit -> TestFlight

## Where things live
```
apps/<app>/docs/       # the contract between agents
  FLOWS.md             # teardown of the reference app (input)
  BRIEF.md             # Architect  — what we build and why
  DESIGN.md            # Architect  — design system (source of truth for UI)
  SPIKE.md             # Builder    — technical feasibility results
  SPEC.md              # Architect  — full product/tech spec
  TASKS.md             # Architect  — task list with status
  REVIEWS.md           # Reviewer   — review log
  BUGS.md              # QA         — bugs found on device
  STORE.md             # Architect  — App Store listing
  LAUNCH.md            # Architect  — launch content plan
apps/<app>/app/        # the Expo project
```

## Pipeline and gates
1. redesign-brief -> **GATE: human approves BRIEF.md**
2. design-system -> **GATE: human approves DESIGN.md**
3. tech-spike (runs in parallel with 2) -> **GATE: works on human's iPhone**
4. screen-design -> **GATE: human approves screens on iPhone**
5. spec-writer -> **GATE: human approves SPEC.md**
6. task-planner -> TASKS.md
7. builder <-> reviewer loop until all tasks are `done`
8. qa -> **GATE: human passes device test**
9. store-prep -> **GATE: human approves STORE.md**
10. release (human runs EAS submit) and launch-content

At a GATE: stop, summarize in ≤10 lines what you produced and what you need decided. Never pass a gate yourself.

## Hard rules
- Stay inside your role. Builders never edit docs except their task's status line and SPIKE.md. Architect never writes app code.
- Only work from the docs. If a doc is missing or contradicts another, stop and ask — do not guess.
- Never commit secrets. Keys go in `.env` (gitignored) or EAS secrets.
- Never run `eas submit`, publish, purchase, or delete anything without the human saying so in chat.
- Never copy the reference app's branding, icons, illustrations or copy. Copy behaviour, not looks.
- Keep messages to the human short: what you did, what's next, what you need.

## Task status values (TASKS.md)
`todo` -> `in_progress (builder-N)` -> `in_review` -> `done` | `changes_requested`
