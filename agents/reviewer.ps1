# Start the Reviewer agent in Claude Code (uses your Claude plan limits), on main.
# Usage: .\agents\reviewer.ps1 -App getup [-Model opus|sonnet]
param([string]$App, [string]$Model = 'opus')
. "$PSScriptRoot\_common.ps1"
Assert-App $App
Set-Location $RepoRoot
& git checkout main | Out-Null
Initialize-ClaudeSkills
& claude --model $Model "Load the role-reviewer skill and follow it. App: $App. Review every task with status in_review."
