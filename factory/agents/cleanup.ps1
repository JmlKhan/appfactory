# Remove the worktree for a finished (merged) task.
# Usage: .\agents\cleanup.ps1 -Task T-012
param([string]$Task)
. "$PSScriptRoot\_common.ps1"
if (-not $Task) { throw 'Pass -Task T-xxx' }
$repoName = Split-Path -Leaf $RepoRoot
$wt = Join-Path (Join-Path (Split-Path -Parent $RepoRoot) "$repoName-worktrees") $Task
Set-Location $RepoRoot
$merged = & git branch --merged main --list "task/$Task"
if (-not $merged) { throw "task/$Task is not merged into main yet." }
& git worktree remove $wt --force
& git branch -d "task/$Task"
Write-Host "Removed worktree and branch for $Task"
