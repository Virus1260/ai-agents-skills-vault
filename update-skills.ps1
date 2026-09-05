# ==============================================================================
# AI AGENTS SKILLS VAULT - 1-CLICK UPSTREAM TRACKER & AUTO-SYNC SCRIPT
# ==============================================================================
# 1. Updates all skills globally from upstream repos (npx skills update -g -y)
# 2. Updates impeccable design engine
# 3. Pulls new local skills from Antigravity and .agents into the Git vault
# 4. Rebuilds the searchable SKILLS_CATALOG.md
# 5. Automatically commits all changes to Git with timestamped changelog
# ==============================================================================

[CmdletBinding(SupportsShouldProcess)]
param (
    [switch]$NoCommit,
    [string]$TargetUserHome = "$HOME"
)

$ErrorActionPreference = "Continue"
$scriptDir = Split-Path -Parent $MyInvocation.MyCommand.Path
$vaultSkillsDir = Join-Path $scriptDir "skills"
$vaultConfigsDir = Join-Path $scriptDir "agent-configs"

Write-Host "`n========================================================" -ForegroundColor Cyan
Write-Host " [AI AGENTS SKILLS VAULT] 1-CLICK UPSTREAM SYNC" -ForegroundColor Green
Write-Host "========================================================`n" -ForegroundColor Cyan

# Step 1: Upstream npm & github updates
Write-Host "[1/5] Checking upstream updates via 'npx skills update'..." -ForegroundColor Yellow
try {
    & npx --yes skills update -g -y
} catch {
    Write-Warning "skills update failed or skipped: $_"
}

Write-Host "`n[2/5] Checking impeccable design updates..." -ForegroundColor Yellow
try {
    & npx --yes impeccable update -y --user
} catch {
    Write-Warning "impeccable update skipped or not required: $_"
}

# Step 2: Sync from active agent directories into vault
Write-Host "`n[3/5] Syncing active skills from Antigravity & .agents into Vault..." -ForegroundColor Yellow
$geminiSkills = Join-Path $TargetUserHome '.gemini\config\skills'
$agentsSkills = Join-Path $TargetUserHome '.agents\skills'

$copiedCount = 0
if (Test-Path $geminiSkills) {
    Get-ChildItem -Path $geminiSkills -Directory | ForEach-Object {
        $dest = Join-Path $vaultSkillsDir $_.Name
        if (-not (Test-Path $dest)) {
            Copy-Item -Path $_.FullName -Destination $dest -Recurse -Force
            $copiedCount++
        }
    }
}
if (Test-Path $agentsSkills) {
    Get-ChildItem -Path $agentsSkills -Directory | ForEach-Object {
        $dest = Join-Path $vaultSkillsDir $_.Name
        if (-not (Test-Path $dest)) {
            Copy-Item -Path $_.FullName -Destination $dest -Recurse -Force
            $copiedCount++
        }
    }
}
Write-Host "  [OK] Synced $copiedCount new skill(s) into vault." -ForegroundColor Green

# Step 3: Sync agent configs
$lockFile = Join-Path $TargetUserHome '.agents\.skill-lock.json'
if (Test-Path $lockFile) {
    Copy-Item -Path $lockFile -Destination (Join-Path $vaultConfigsDir ".skill-lock.json") -Force
}

# Step 4: Rebuild Catalog
Write-Host "`n[4/5] Updating SKILLS_CATALOG.md..." -ForegroundColor Yellow
$catalogScript = Join-Path $scriptDir 'scripts\build_catalog.py'
if (Test-Path $catalogScript) {
    & python $catalogScript
} else {
    Write-Host "  Catalog script not found, skipping." -ForegroundColor Gray
}

# Step 5: Git Commit
Write-Host "`n[5/5] Tracking Git changes..." -ForegroundColor Yellow
Push-Location $scriptDir
try {
    & git add -A
    $changes = & git status --porcelain
    if ($changes) {
        $timestamp = (Get-Date).ToString("yyyy-MM-dd HH:mm:ss")
        $commitMsg = "Auto-sync skills vault: $timestamp"
        if (-not $NoCommit) {
            & git commit -m "$commitMsg"
            Write-Host "  [OK] Committed changes: $commitMsg" -ForegroundColor Green
        } else {
            Write-Host "  Changes staged (--NoCommit specified)." -ForegroundColor Gray
        }
    } else {
        Write-Host "  [OK] Everything is up-to-date. No changes detected." -ForegroundColor Green
    }
} finally {
    Pop-Location
}

Write-Host "`n========================================================" -ForegroundColor Green
Write-Host " SYNC & UPDATE COMPLETE!" -ForegroundColor Green
Write-Host "========================================================`n" -ForegroundColor Green
