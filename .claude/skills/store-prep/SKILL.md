---
name: store-prep
description: Prepare everything App Store Connect needs — listing text per locale, keywords, screenshots plan, privacy answers, review notes — in STORE.md.
---

# Store prep

Inputs: BRIEF.md, SPEC.md, DESIGN.md, the built app.
Output: `docs/STORE.md` + screenshot captions. Then STOP at the gate.

1. **ASO research**: list the top 10 competitor apps for the main keyword in the target storefront(s); note their titles/subtitles. Use the vision helper (`pi -p --model openrouter/google/gemini-3-flash-preview @image ...`) to read competitor screenshots if provided.
2. **Per locale (en, plus every locale the app ships)**: App name (≤30 chars), subtitle (≤30), keywords field (≤100 chars, comma-separated, no spaces, no words already in name/subtitle), promotional text (≤170), description (first 3 lines carry the pitch), what's new.
   Count characters and show the counts.
3. **Screenshots**: 6–8 frames for 6.9" iPhone: for each — caption (≤5 words per locale), which screen/state to capture, background/color from DESIGN.md. First 3 must sell the differentiator.
4. **Privacy**: App Privacy questionnaire answers derived from SPEC (analytics, purchases, identifiers). Privacy policy URL needed — draft the policy text.
5. **Review notes**: how to test (demo steps, sandbox purchase), why each permission is needed, anything that could look like guideline 4.1/4.3/2.1 issues and how we comply.
6. **Age rating** answers.
GATE: summarize, ask the human to approve. The human uploads/submits — never you.
