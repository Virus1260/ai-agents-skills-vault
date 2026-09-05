# ==============================================================================
# AI AGENTS SKILLS VAULT - 1-CLICK DISASTER RECOVERY RESTORATION SCRIPT
# ==============================================================================
# Restores all 950+ AI agent skills, rules, MCP configs, and design systems
# across Antigravity, Claude Code, Cursor, Codex, and .agents in 1 single shot.
# ==============================================================================

[CmdletBinding(SupportsShouldProcess)]
param (
    [switch]$Force,
    [string]$TargetUserHome = "$HOME"
)

$ErrorActionPreference = "Continue"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$vaultSkillsDir = Join-Path $scriptDir "skills"
$vaultConfigsDir = Join-Path $scriptDir "agent-configs"

Write-Host "`n========================================================" -ForegroundColor Cyan
Write-Host " [AI AGENTS SKILLS VAULT] 1-CLICK RESTORE" -ForegroundColor Green
Write-Host "========================================================`n" -ForegroundColor Cyan
Write-Host "Source Vault: $scriptDir" -ForegroundColor Gray
Write-Host "Target User Home: $TargetUserHome" -ForegroundColor Gray

if (-not (Test-Path $vaultSkillsDir)) {
    Write-Error "CRITICAL: 'skills' directory not found in $scriptDir!"
    exit 1
}

$allSkills = Get-ChildItem -Path $vaultSkillsDir -Directory
Write-Host "Found $($allSkills.Count) skills ready to restore.`n" -ForegroundColor Yellow

# Define Target Agent Directories
$targets = @(
    @{ Name = "Antigravity (Gemini Config)"; Path = (Join-Path $TargetUserHome '.gemini\config\skills') },
    @{ Name = "Unified Agents Harness"; Path = (Join-Path $TargetUserHome '.agents\skills') },
    @{ Name = "Cursor Agent Skills"; Path = (Join-Path $TargetUserHome '.cursor\skills-cursor') },
    @{ Name = "Claude Code Skills"; Path = (Join-Path $TargetUserHome '.claude\skills') },
    @{ Name = "Codex Skills"; Path = (Join-Path $TargetUserHome '.codex\skills') }
)

foreach ($t in $targets) {
    $dir = $t.Path
    Write-Host "[Restoring] -> $($t.Name)..." -ForegroundColor Cyan
    if (-not (Test-Path $dir)) {
        New-Item -ItemType Directory -Path $dir -Force | Out-Null
    }

    $count = 0
    foreach ($skill in $allSkills) {
        $dest = Join-Path $dir $skill.Name
        if ($Force -or (-not (Test-Path $dest))) {
            Copy-Item -Path $skill.FullName -Destination $dest -Recurse -Force
            $count++
        }
    }
    Write-Host "  [OK] Restored $count skills into $dir" -ForegroundColor Green
}

# Restore Agent Configurations and Locks
Write-Host "`n[Restoring] -> Agent Lockfiles, Rules, and MCP Configs..." -ForegroundColor Cyan

# 1. .skill-lock.json
$lockSrc = Join-Path $vaultConfigsDir ".skill-lock.json"
$lockDestDir = Join-Path $TargetUserHome ".agents"
if (Test-Path $lockSrc) {
    if (-not (Test-Path $lockDestDir)) { New-Item -ItemType Directory -Path $lockDestDir -Force | Out-Null }
    Copy-Item -Path $lockSrc -Destination (Join-Path $lockDestDir ".skill-lock.json") -Force
    Write-Host "  [OK] Restored ~/.agents/.skill-lock.json" -ForegroundColor Green
}

# 2. Antigravity Rules
$rulesSrc = Join-Path $vaultConfigsDir "gemini-rules"
$rulesDest = Join-Path $TargetUserHome '.gemini\config\rules'
if (Test-Path $rulesSrc) {
    if (-not (Test-Path $rulesDest)) { New-Item -ItemType Directory -Path $rulesDest -Force | Out-Null }
    Copy-Item -Path (Join-Path $rulesSrc "*") -Destination $rulesDest -Recurse -Force
    Write-Host "  [OK] Restored ~/.gemini/config/rules" -ForegroundColor Green
}

# 3. Antigravity MCP Config
$mcpSrc = Join-Path $vaultConfigsDir "gemini-mcp_config.json"
$mcpDest = Join-Path $TargetUserHome '.gemini\config\mcp_config.json'
if (Test-Path $mcpSrc) {
    $geminiConfigDir = Join-Path $TargetUserHome '.gemini\config'
    if (-not (Test-Path $geminiConfigDir)) {
        New-Item -ItemType Directory -Path $geminiConfigDir -Force | Out-Null
    }
    Copy-Item -Path $mcpSrc -Destination $mcpDest -Force
    Write-Host "  [OK] Restored ~/.gemini/config/mcp_config.json" -ForegroundColor Green
}

Write-Host "`n========================================================" -ForegroundColor Green
Write-Host " RESTORATION COMPLETE! All 950+ skills are online!" -ForegroundColor Green
Write-Host "========================================================`n" -ForegroundColor Green
