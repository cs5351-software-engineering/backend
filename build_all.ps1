# Store the current directory in a variable
$currentDir = Get-Location

# Build develop image
Write-Host "Building backend develop image..."
Set-Location .\backend
& .\build.develop.ps1

if ($LASTEXITCODE -eq 0) {
    Write-Host "Develop image built successfully." -ForegroundColor Green
} else {
    Write-Host "Failed to build develop image." -ForegroundColor Red
    exit 1
}

# Build release image
Write-Host "`nBuilding backend release image..."
& .\build.release.ps1

if ($LASTEXITCODE -eq 0) {
    Write-Host "Release image built successfully." -ForegroundColor Green
} else {
    Write-Host "Failed to build release image." -ForegroundColor Red
    exit 1
}

Write-Host "`nBoth images have been built successfully." -ForegroundColor Green

# Return to the original directory
Set-Location $currentDir
