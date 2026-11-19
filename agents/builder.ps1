# Start a Builder agent on one task, in its own git worktree.
# Usage: .\agents\builder.ps1 -App alarm-uz -Task T-012 [-Model pro|flash|kimi|opus]
# Run one per herdr pane for parallel builders (only tasks from the same "wave" in TASKS.md).
param([string]$App, [string]$Task, [string]$Model = 'pro')
. "$PSScriptRoot\_common.ps1"
Assert-App $App
if (-not $Task) { throw 'Pass -Task T-xxx (see apps\<app>\docs\TASKS.md)' }

$repoName = Split-Path -Leaf $RepoRoot
$wtRoot   = Join-Path (Split-Path -Parent $RepoRoot) "$repoName-worktrees"
$wt       = Join-Path $wtRoot $Task
$branch   = "task/$Task"

Set-Location $RepoRoot
if (-not (Test-Path $wt)) {
  New-Item -ItemType Directory -Force -Path $wtRoot | Out-Null
  $exists = & git branch --list $branch
  if ($exists) { & git worktree add $wt $branch } else { & git worktree add $wt -b $branch main }
  # Node modules are per worktree; install if the app has a package.json.
  $appDir = Join-Path $wt "apps\$App\app"
  if (Test-Path (Join-Path $appDir 'package.json')) { Push-Location $appDir; & npm install --no-audit --no-fund; Pop-Location }
}

Set-Location $wt
$m = Get-ModelArgs $Model
& pi @m "/skill:role-builder App: $App. Task: $Task. Worktree: $Task on branch $branch."
