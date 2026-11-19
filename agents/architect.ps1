# Start the Architect agent in Claude Code (uses your Claude plan limits).
# Usage: .\agents\architect.ps1 -App getup [-Model opus|sonnet]
param([string]$App, [string]$Model = 'opus')
. "$PSScriptRoot\_common.ps1"
Assert-App $App
Set-Location $RepoRoot
Initialize-ClaudeSkills
& claude --model $Model "Load the role-architect skill and follow it. App: $App. Report the current stage and the next step."
