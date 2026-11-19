---
name: spec-writer
description: Write SPEC.md — the complete product and technical spec builders implement from — using the approved brief, design, spike results and screens.
---

# Spec writer

Inputs: approved BRIEF.md, DESIGN.md, SPIKE.md, the approved screens (read the code under `app/app/`).
Output: `docs/SPEC.md`. Then STOP at the gate.

## SPEC.md sections
1. **Scope** — v1 features (from BRIEF), explicitly out-of-scope list.
2. **Screens & navigation** — route table: route | screen | purpose | entry points | exits. Must match the approved screens.
3. **User stories with acceptance criteria** — per feature: "As a … I want … so that …" + numbered, testable criteria (Given/When/Then).
4. **Data model** — TypeScript types for every entity, where stored (MMKV/SQLite/SecureStore), migrations plan.
5. **Native modules** — what Swift/native code exists (from SPIKE), its JS interface (TypeScript signatures), App Group IDs, entitlements.
6. **Monetization** — RevenueCat entitlement ids, product ids, offerings, which features are gated, paywall triggers.
7. **Analytics** — event table: event name | when | properties. Funnel: install -> onboarding_done -> first_value -> paywall_view -> trial_start.
8. **Permissions** — each permission, when asked, pre-permission screen, behaviour if denied.
9. **Localization** — key naming convention, languages, plural rules.
10. **Edge cases** — offline, time zone/DST change, phone restart, low battery, permission revoked later.
11. **Non-functional** — cold start < 2s, no crash on first run, accessibility rules from DESIGN.md.
12. **Release config** — bundle id, app name per locale, min iOS version, EAS profiles.

Rules: every acceptance criterion must be testable by a reviewer reading code or by the human on device. No "should be fast" — give numbers.
GATE: summarize, ask the human to approve.
