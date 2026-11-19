---
name: tech-spike
description: Builder skill — prove or disprove a risky native capability (e.g. AlarmKit alarms, widgets) with the smallest possible test app before the spec is written.
---

# Tech spike

Input: the question to answer (from BRIEF.md "Open questions" or the human).
Output: a throwaway branch `spike/<topic>` and `docs/SPIKE.md`.

## Steps
1. Restate the question as yes/no checks. Example for an alarm app:
   - Can the app schedule an alarm that rings with the phone on silent and in Focus?
   - Can dismissing be blocked or redirected until an in-app mission is done? If not, what is the closest behaviour?
   - Does it still ring if the app was force-quit / phone restarted?
   - Minimum iOS version required?
2. Research first: read Apple's current docs for the API and note exact limits. Cite the doc pages in SPIKE.md.
3. Build the smallest Expo app + native module / config plugin that tests each check. Native Swift is allowed here.
4. Write a test script for the human (numbered steps on the iPhone, expected result).
5. The human runs the EAS development build on their iPhone and reports results.
6. Write SPIKE.md: each check -> PASS / FAIL / PARTIAL, evidence, the workaround if any, and the impact on BRIEF/SPEC.

Do not polish. Speed over quality. The spike code is thrown away; only SPIKE.md and learnings survive.
