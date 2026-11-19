---
name: redesign-brief
description: Turn a reference-app teardown (FLOWS.md) plus the human's idea into BRIEF.md — what we build, for whom, and v1 scope.
---

# Redesign brief

Inputs: `docs/FLOWS.md` (required), the human's idea notes (ask if none), any screenshots folder.
Output: `docs/BRIEF.md`. Then STOP at the gate.

## Steps
1. Read FLOWS.md fully. If missing, stop and tell the human to run the teardown first.
2. Ask the human at most 5 questions, only if not already answered:
   target user, market/language, the one differentiator vs the reference, monetization (price points), anything they hate in the reference.
3. Write BRIEF.md with these sections:
   - **One-liner** — who it's for and the outcome, ≤20 words.
   - **Target user** — 3 bullets, concrete.
   - **Differentiators** — max 3, each tied to the target user. Not "better UI".
   - **Reference flow decisions** — table: reference flow/screen | keep / change / drop / add | why.
   - **v1 scope** — numbered features. Everything else goes to "Later".
   - **Monetization** — free vs paid, paywall placements, prices (mark as hypothesis).
   - **Localization** — languages, tone of voice, cultural notes.
   - **App Store risks** — guideline 4.1 copycat / 4.3 spam: list what makes ours clearly distinct.
   - **Open questions** — for the human.
4. Keep v1 small: aim for the smallest app that delivers the differentiator. Push the rest to "Later".
5. GATE: summarize in ≤10 lines, ask the human to approve or edit.
