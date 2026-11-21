---
name: reviewer
description: Review one builder branch against its task's acceptance criteria, SPEC and DESIGN; merge it or request changes.
---

# Review procedure

For task T-xxx on branch `task/T-xxx`:

1. `git fetch` and `git diff main...task/T-xxx`.
2. Check, in this order — stop at the first blocking problem class and report all issues in it:
   1. **Scope**: only the task's files changed? No unrelated refactors, no new deps unless named.
   2. **Correctness**: each acceptance criterion actually met (verify in code, don't trust the handoff note). Edge cases from SPEC §10 handled where relevant.
   3. **Verification**: run `npx tsc --noEmit`, `npx expo lint`, related tests yourself on the branch.
   4. **Design fidelity**: tokens only, no raw hex/sizes, light+dark, i18n for every string (en present, plus every locale the app ships).
   5. **Quality**: naming, dead code, error handling, no secrets, no console.log left.
3. Decide:
   - **Approve** -> merge into main (`git merge --no-ff task/T-xxx`), set status `done`, remove the worktree if asked.
   - **Changes requested** -> set status `changes_requested`, write numbered, specific fixes (file:line, what, why).
4. Log in REVIEWS.md: `T-xxx | approved/changes | date | 1-line summary | issues`.
5. Tell the human in one line per task.

Merge conflicts: resolve only if trivial (≤10 lines, no logic). Otherwise send back to the builder.
