# App Factory — agent team

3 roles, 15 skills, one git repo. Run each agent in its own herdr pane.

| Role | Launcher | Model |
|---|---|---|
| Architect | `.\agents\architect.ps1 -App <app>` | Claude Code, Opus (plan limits) |
| Builder ×1–4 | `.\agents\builder.ps1 -App <app> -Task T-xxx [-Model pro\|flash\|kimi\|opus]` | DeepSeek V4 Pro (default) |
| Reviewer | `.\agents\reviewer.ps1 -App <app>` | Claude Code, Opus (plan limits) |
| Vision helper | called by agents via `pi -p` | Gemini 3 Flash |

## One-time setup
```powershell
cd C:\Users\Samsung\source\af
# unzip this kit to .\factory, then:
cd factory
git init -b main
git add . ; git commit -m "factory: agent team"
Get-ChildItem -Recurse -Filter *.ps1 | Unblock-File
pi --list-models anthropic      # if 'opus' isn't matched, edit agents\_common.ps1
```

## Run an app through the factory
```powershell
.\agents\new-app.ps1 -App alarm-uz
# copy your teardown FLOWS.md into apps\alarm-uz\docs\, commit
```
Then in herdr:

| Pane | Command | You do |
|---|---|---|
| 1 Architect | `.\agents\architect.ps1 -App alarm-uz` | `/skill:redesign-brief` -> approve -> `/skill:design-system` -> approve -> `/skill:mockups` (design in Claude Design, export handoff to docs\mockups) -> approve -> `/skill:spec-writer` -> approve -> `/skill:task-planner` |
| 2 Builder (spike) | `.\agents\builder.ps1 -App alarm-uz -Task SPIKE-1 -Model opus` then `/skill:tech-spike` | Run the EAS dev build on your iPhone, report results |
| 2–5 Builders | `.\agents\builder.ps1 -App alarm-uz -Task T-001` (one per task in the current wave) | Watch herdr for "blocked" |
| 6 Reviewer | `.\agents\reviewer.ps1 -App alarm-uz` | Read one-line verdicts; run `/skill:qa` at the end |

Finished tasks: `.\agents\cleanup.ps1 -Task T-001`

## Rules of thumb
- Commit docs after every gate so builders' worktrees see them (`git add apps; git commit -m "docs: approve BRIEF"`).
- Only run tasks from the same wave in parallel.
- If a builder is `blocked`, answer in its pane or switch it to `-Model opus`.
- You are the only one who submits to the App Store.
