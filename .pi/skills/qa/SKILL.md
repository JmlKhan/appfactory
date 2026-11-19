---
name: qa
description: Produce a device test checklist from SPEC.md, collect the human's results, and turn failures into BUGS.md and fix tasks.
---

# QA

The human tests on a real iPhone (no Mac / simulator). Your job is to make that fast and complete.

1. Write `docs/QA_CHECKLIST.md` from SPEC.md: numbered test cases grouped by flow. Each case: preconditions, steps (≤6), expected result. Include: first install, permissions denied, airplane mode, language switch uz/ru/en, dark mode, largest Dynamic Type, restart phone, purchase in sandbox, restore purchases.
2. Mark the 10 most important cases as "smoke" — the human runs those on every build.
3. Tell the human to build: `eas build -p ios --profile development` (or `preview` for TestFlight), and to report results as `#id pass` / `#id fail: what happened` (+ screenshot).
4. For each failure: add to BUGS.md (`B-xxx | severity | steps | expected | actual | screenshot`), then add a fix task to TASKS.md (status `todo`, link the bug).
5. When all smoke + critical cases pass: GATE — tell the human QA passed and list known minor bugs.
