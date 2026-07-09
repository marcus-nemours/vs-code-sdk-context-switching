#!/usr/bin/env pwsh

# Demo script to launch two different SDK contexts side-by-side
# Note: Requires Remote - Containers extension and Docker installed

$repoRoot = $PSScriptRoot

Write-Host "--- SDK Context Switching Demo ---" -ForegroundColor Cyan

function Get-DevContainerUri($configFilePath) {
    # Ensure we use the exact path casing and hex-encode for the URI
    $bytes = [Text.Encoding]::UTF8.GetBytes($configFilePath)
    $hex = ($bytes | ForEach-Object { $_.ToString("x2") }) -join ""
    return "vscode-remote://dev-container+$hex/workspaces/vs-code-sdk-context-switching"
}

# Rancher Desktop specific check
$dockerPath = Join-Path $env:LOCALAPPDATA "Programs\Rancher Desktop\resources\resources\win32\bin"
if (Test-Path $dockerPath) {
    if ($env:PATH -notlike "*$dockerPath*") {
        Write-Host "[Info] Adding Rancher Desktop bin to PATH for this session..." -ForegroundColor Gray
        $env:PATH = "$dockerPath;$env:PATH"
    }
}

# 1. Launch Java 17 Context
$path17 = Join-Path $repoRoot ".devcontainer\java17"
Write-Host "[1/2] Launching Java 17 environment..." -ForegroundColor Green
$uri17 = Get-DevContainerUri $path17
# Use Start-Process to ensure the environment variables (like PATH) are passed correctly
Start-Process "code" -ArgumentList "--new-window", "--folder-uri", $uri17

# 2. Launch Java 21 Context
$path21 = Join-Path $repoRoot ".devcontainer\java21"
Write-Host "[2/2] Launching Java 21 environment..." -ForegroundColor Green
$uri21 = Get-DevContainerUri $path21
Start-Process "code" -ArgumentList "--new-window", "--folder-uri", $uri21

Write-Host "`nDemo launched! Check the status bar in each VS Code window to verify the JDK version." -ForegroundColor Yellow
