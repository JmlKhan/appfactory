# Shared settings for the launchers. Edit model IDs here once.
# Check exact IDs with:  pi --list-models anthropic   and   pi --list-models openrouter

$Models = @{
  # Claude inside pi now bills your Claude "extra usage", not plan limits.
  # Architect/Reviewer therefore run in Claude Code. Use these only if you accept extra-usage billing.
  opus   = @('--provider', 'anthropic', '--model', 'opus:high')
  sonnet = @('--provider', 'anthropic', '--model', 'sonnet:medium')
  # Pay-per-token alternative for hard builder tasks:
  opus_or = @('--model', 'openrouter/anthropic/claude-opus-4.7')
  # OpenRouter
  pro    = @('--model', 'openrouter/deepseek/deepseek-v4-pro')
  flash  = @('--model', 'openrouter/deepseek/deepseek-v4-flash')
  kimi   = @('--model', 'openrouter/moonshotai/kimi-k2.6')
  vision = @('--model', 'openrouter/google/gemini-3-flash-preview')
}

$RepoRoot = Split-Path -Parent $PSScriptRoot

function Assert-App([string]$App) {
  if (-not $App) { throw 'Pass -App <name> (a folder under apps\)' }
  $p = Join-Path $RepoRoot "apps\$App"
  if (-not (Test-Path $p)) { throw "apps\$App not found. Create it with: .\agents\new-app.ps1 -App $App" }
}

# Claude Code reads skills from .claude\skills. Link it to .pi\skills so both tools share one copy.
function Initialize-ClaudeSkills {
  $link = Join-Path $RepoRoot '.claude\skills'
  if (Test-Path $link) { return }
  New-Item -ItemType Directory -Force -Path (Join-Path $RepoRoot '.claude') | Out-Null
  New-Item -ItemType Junction -Path $link -Target (Join-Path $RepoRoot '.pi\skills') | Out-Null
}

function Get-ModelArgs([string]$Name) {
  if (-not $Models.ContainsKey($Name)) { throw "Unknown model '$Name'. Use one of: $($Models.Keys -join ', ')" }
  return $Models[$Name]
}
