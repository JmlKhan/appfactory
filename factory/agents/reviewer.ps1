# Start the Reviewer agent (Claude Opus via subscription) at the repo root, on main.
# Usage: .\agents\reviewer.ps1 -App alarm-uz [-Model opus|sonnet]
param([string]$App, [string]$Model = 'opus')
. "$PSScriptRoot\_common.ps1"
Assert-App $App
Set-Location $RepoRoot
& git checkout main | Out-Null
$m = Get-ModelArgs $Model
& pi @m "/skill:role-reviewer App: $App. Review every task with status in_review."
