---
name: task-planner
description: Split an approved SPEC.md into small, parallelizable builder tasks in TASKS.md, with dependencies, files and acceptance criteria.
---

# Task planner

Input: approved SPEC.md (+ DESIGN.md, existing code).
Output: `docs/TASKS.md`.

## Task format (one block per task)
```
### T-012 Alarm list screen: real data
status: todo
model: v4-pro            # v4-flash for trivial, v4-pro default, opus for native/Swift or tricky logic
depends_on: [T-004, T-007]
files: [app/app/(tabs)/index.tsx, app/src/features/alarms/useAlarms.ts]
spec_refs: [SPEC §3.2, SPEC §4]
goal: Replace mock data with the alarm store; toggling an alarm schedules/cancels it.
acceptance:
  1. ...testable...
  2. ...
tests: unit test for useAlarms toggle; tsc + lint pass
```

## Rules
- Size: one task ≈ one focused session (≤ ~300 lines changed). Split anything bigger.
- Minimize file overlap between tasks that can run in parallel — two parallel tasks must not edit the same file.
- Order: foundations (stores, services, i18n, navigation) -> features -> polish -> analytics -> paywall -> release config.
- Native/Swift tasks get `model: opus`.
- Add a "Parallel waves" section at the top: which task ids can run at the same time (wave 1, wave 2…).
- Every SPEC acceptance criterion must map to at least one task. Add a coverage table at the end: SPEC § -> task ids.
