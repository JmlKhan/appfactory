---
name: builder
description: Implement one task from TASKS.md in the current git worktree, verify it, and hand it to review.
---

# Builder procedure

1. **Claim**: set your task's status to `in_progress (<worktree name>)` in TASKS.md and commit just that line: `chore(T-xxx): claim`.
2. **Plan**: write a 3–8 line plan (files, approach) in your reply. Don't ask for approval unless the task is ambiguous.
3. **Implement**: only the files listed in the task (+ their tests). Follow DESIGN.md tokens and SPEC.md exactly. All strings via i18n.
4. **Verify** — all must pass before handing over:
   - `npx tsc --noEmit`
   - `npx expo lint`
   - `npx jest <related tests>` (if tests exist / the task asks for them)
   - Re-read every acceptance criterion and confirm each one, citing the file/line that satisfies it.
5. **Commit**: small, conventional commits: `feat(T-xxx): …`, `test(T-xxx): …`.
6. **Hand over**: set status to `in_review`, append to the task block:
   ```
   handoff: <branch name>; criteria 1–N met (see commits); notes: <anything the reviewer must know>
   ```
   Commit, then STOP and tell the human: "T-xxx ready for review on <branch>".
7. If the reviewer set `changes_requested`, read their notes in REVIEWS.md, fix, re-verify, hand over again.

Never: change other tasks, add packages not named in the task, disable lint/type rules, leave TODOs that hide unfinished acceptance criteria.
