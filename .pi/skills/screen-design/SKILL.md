---
name: screen-design
description: Builder skill — implement approved flows as real Expo screens with mock data, using only DESIGN.md tokens, so the human can review the design on their iPhone.
---

# Screen design (design in code)

Inputs: `docs/BRIEF.md`, `docs/DESIGN.md`, `docs/FLOWS.md`, `app/src/theme/theme.ts`, the task's screen list.
Output: screens under `app/app/` (Expo Router) + reusable components under `app/src/components/`, all on mock data.

## Rules
- Use ONLY tokens from theme.ts. No raw hex, no magic numbers for spacing/size/radius.
- Build shared components first (Button, Card, ListRow…) exactly as specified in DESIGN.md, then screens from them.
- Every string via i18n (`t('key')`) with uz, ru and en entries. Uzbek is the default.
- Support light and dark mode and Dynamic Type.
- Mock data lives in `app/src/mocks/`. No real services yet (no RevenueCat, no AlarmKit) — stub them behind an interface.
- Add a hidden dev menu route `/_gallery` that links to every screen and every state (empty, loading, error, premium/free) so the human can review all of them on device.
- Navigation must match the flows in BRIEF.md.

## Done when
- `npx tsc --noEmit` and `npx expo lint` pass.
- `/_gallery` reaches every screen and state.
- Task status set to `in_review`, with a list of screens built.
