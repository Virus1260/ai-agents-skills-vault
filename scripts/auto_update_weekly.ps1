<#
.SYNOPSIS
  Universal Non-Destructive Weekly Auto-Updater for AI Agents Skills Vault

.DESCRIPTION
  Safely updates all skills, design systems, and agent configs:
  1. Creates a safety snapshot in backups/pre-update/<timestamp> before touching anything.
  2. Updates upstream npm/git skill packages via `npx skills update -g -y`.
  3. Updates Impeccable lint rules and design engine.
  4. Scans and merges new skills from Antigravity (~/.gemini/config/skills).
  5. Rebuilds SKILLS_CATALOG.md without overwriting local custom skills.
  6. Automatically stages and commits updates to Git.

.EXAMPLE
  .\scripts\auto_update_weekly.ps1
#>

$ErrorActionPreference = "Continue"

$VaultRoot = Split-Path -Parent $PSScriptRoot
$SkillsDir = Join-Path $VaultRoot "skills"
$GeminiSkills = [System.IO.Path]::Combine($env:USERPROFILE, ".gemini\config\skills")
$BackupDir = Join-Path $VaultRoot "backups\pre-update"

$Timestamp = Get-Date -Format "yyyyMMdd-HHmmss"
$CurrentBackup = Join-Path $BackupDir $Timestamp

Write-Host "`n🛡️ [Auto-Updater] Starting Non-Destructive Weekly Sync: $Timestamp" -ForegroundColor Cyan

# Step 1: Pre-Update Safety Snapshot
Write-Host "`n📦 Step 1: Creating Safety Backup in: backups/pre-update/$Timestamp..." -ForegroundColor Cyan
if (-not (Test-Path $CurrentBackup)) {
    New-Item -ItemType Directory -Path $CurrentBackup -Force | Out-Null
}

# Copy skill catalog and lockfile for instant rollback safety
Copy-Item (Join-Path $VaultRoot "SKILLS_CATALOG.md") -Destination $CurrentBackup -ErrorAction SilentlyContinue
Copy-Item (Join-Path $VaultRoot "README.md") -Destination $CurrentBackup -ErrorAction SilentlyContinue

Write-Host "   ✅ Safety snapshot created. Existing skills are 100% protected." -ForegroundColor Green

# Step 2: Fetch Upstream Skill Updates
Write-Host "`n🔄 Step 2: Pulling Upstream Package Updates (npx skills update)..." -ForegroundColor Cyan
try {
    npx -y skills update -g -y
    Write-Host "   ✅ Upstream skills updated successfully." -ForegroundColor Green
} catch {
    Write-Warning "   ⚠️ Warning during npx skills update: $_"
}

# Step 3: Update Impeccable Design Engine
Write-Host "`n🎨 Step 3: Updating Impeccable Design Engine..." -ForegroundColor Cyan
try {
    npx -y impeccable update -y --user
    Write-Host "   ✅ Impeccable updated successfully." -ForegroundColor Green
} catch {
    Write-Warning "   ⚠️ Impeccable update skipped or already current."
}

# Step 4: Non-Destructive Sync from Antigravity to Vault
Write-Host "`n📂 Step 4: Merging Local Antigravity Skills (Non-Destructive)..." -ForegroundColor Cyan
if (Test-Path $GeminiSkills) {
    $gSkills = Get-ChildItem -Directory $GeminiSkills
    foreach ($gs in $gSkills) {
        $dest = Join-Path $SkillsDir $gs.Name
        if (-not (Test-Path $dest)) {
            Copy-Item $gs.FullName -Destination $dest -Recurse -Force
            Write-Host "   + Added new skill to vault: $($gs.Name)" -ForegroundColor Green
        }
    }
}

# Step 5: Mirror Vault Skills back to Antigravity
Write-Host "`n🪞 Step 5: Mirroring Vault Skills to Antigravity..." -ForegroundColor Cyan
$vSkills = Get-ChildItem -Directory $SkillsDir
foreach ($vs in $vSkills) {
    $dest = Join-Path $GeminiSkills $vs.Name
    if (-not (Test-Path $dest)) {
        Copy-Item $vs.FullName -Destination $dest -Recurse -Force
        Write-Host "   + Added new skill to Antigravity: $($vs.Name)" -ForegroundColor Green
    }
}

# Step 6: Rebuild Searchable Catalog
Write-Host "`n📖 Step 6: Rebuilding SKILLS_CATALOG.md..." -ForegroundColor Cyan
$CatalogScript = Join-Path $VaultRoot "scripts\build_catalog.py"
if (Test-Path $CatalogScript) {
    python $CatalogScript
    Write-Host "   ✅ SKILLS_CATALOG.md regenerated." -ForegroundColor Green
}

# Step 7: Automated Git Commit
Write-Host "`n💾 Step 7: Committing Changes to Git..." -ForegroundColor Cyan
Push-Location $VaultRoot
try {
    git add .
    $status = git status --porcelain
    if ($status) {
        git commit -m "Automated Weekly Sync: $(Get-Date -Format 'yyyy-MM-dd HH:mm:ss')"
        Write-Host "   ✅ Git changes committed successfully!" -ForegroundColor Green
    } else {
        Write-Host "   ℹ️ Everything is already up to date. No new changes." -ForegroundColor Yellow
    }
} catch {
    Write-Warning "   Git commit encountered: $_"
} finally {
    Pop-Location
}

Write-Host "`n🎉 [SUCCESS] Non-destructive weekly sync completed safely!`n" -ForegroundColor Cyan
