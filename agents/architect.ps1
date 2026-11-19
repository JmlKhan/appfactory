# Start the Architect agent (Claude Opus via subscription) at the repo root.
# Usage: .\agents\architect.ps1 -App alarm-uz [-Model opus|sonnet]
param([string]$App, [string]$Model = 'opus')
. "$PSScriptRoot\_common.ps1"
Assert-App $App
Set-Location $RepoRoot
$m = Get-ModelArgs $Model
& pi @m "/skill:role-architect App: $App. Report the current stage and the next step."
