# Create a new app folder from the template.
# Usage: .\agents\new-app.ps1 -App alarm-uz
param([string]$App)
. "$PSScriptRoot\_common.ps1"
if (-not $App) { throw 'Pass -App <name>' }
$dst = Join-Path $RepoRoot "apps\$App"
if (Test-Path $dst) { throw "apps\$App already exists" }
Copy-Item -Recurse (Join-Path $RepoRoot 'apps\_template') $dst
Write-Host "Created apps\$App"
Write-Host "Next: put the teardown output in apps\$App\docs\FLOWS.md, commit, then run .\agents\architect.ps1 -App $App"
