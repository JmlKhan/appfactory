# Shared settings for the launchers. Edit model IDs here once.
# Check exact IDs with:  pi --list-models anthropic   and   pi --list-models openrouter

$Models = @{
  # Claude via your subscription (pi /login -> Anthropic). Adjust if `pi --list-models anthropic` shows other names.
  opus   = @('--provider', 'anthropic', '--model', 'opus:high')
  sonnet = @('--provider', 'anthropic', '--model', 'sonnet:medium')
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

function Get-ModelArgs([string]$Name) {
  if (-not $Models.ContainsKey($Name)) { throw "Unknown model '$Name'. Use one of: $($Models.Keys -join ', ')" }
  return $Models[$Name]
}
