param (
    [string]$TargetDir = (Get-Location).Path,
    [switch]$Force = $false
)

$ErrorActionPreference = "Stop"

$TemplatesDir = Join-Path (Split-Path -Parent $PSScriptRoot) "templates\vibe-coding-docs"
$DocsDir = Join-Path $TargetDir "docs"

Write-Host "`n[Vibe-Coding-Docs] Initializing 6-File Documentation Architecture in: $TargetDir" -ForegroundColor Cyan

if (-not (Test-Path $DocsDir)) {
    New-Item -ItemType Directory -Path $DocsDir -Force | Out-Null
    Write-Host "   Created directory: docs/" -ForegroundColor Green
}

$CoreFiles = @("PRD.md", "ARCHITECTURE.md", "RULES.md", "DESIGN.md", "TASKS.md", "MEMORY.md")

foreach ($file in $CoreFiles) {
    $src = Join-Path $TemplatesDir $file
    $dest = Join-Path $DocsDir $file

    if (-not (Test-Path $src)) {
        Write-Warning "Template not found: $src"
        continue
    }

    if ((Test-Path $dest) -and (-not $Force)) {
        Write-Host "   docs/$file already exists (skipping, use -Force to overwrite)" -ForegroundColor Yellow
    } else {
        Copy-Item -Path $src -Destination $dest -Force
        Write-Host "   + Created docs/$file" -ForegroundColor Green
    }
}

# Graphify Integration Check
Write-Host "`nChecking Graphify codebase knowledge graph..." -ForegroundColor Cyan
if (Get-Command "graphify" -ErrorAction SilentlyContinue) {
    Write-Host "   Graphify is available. Running AST dependency scan..." -ForegroundColor Green
    Push-Location $TargetDir
    try {
        graphify .
        Write-Host "   Graphify AST graph successfully updated!" -ForegroundColor Green
    } catch {
        Write-Warning "Graphify execution encountered an issue: $_"
    } finally {
        Pop-Location
    }
} else {
    Write-Host "   Tip: Install graphify via 'pip install graphifyy' to enable up to 71x token context reduction." -ForegroundColor DarkGray
}

Write-Host "`n[SUCCESS] The 6 Vibe Coding control files are ready in docs/!" -ForegroundColor Cyan
Write-Host "   AI agents will now read PRD, ARCHITECTURE, RULES, DESIGN, TASKS, and MEMORY seamlessly.`n"
