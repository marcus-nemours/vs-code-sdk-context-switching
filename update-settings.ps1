$settingsPath = "$HOME\AppData\Roaming\Code\User\settings.json"
$settings = Get-Content $settingsPath -Raw | ConvertFrom-Json

$dockerBin = Join-Path $env:LOCALAPPDATA "Programs\Rancher Desktop\resources\resources\win32\bin"
$dockerPath = Join-Path $dockerBin "docker.exe"
$dockerComposePath = Join-Path $env:LOCALAPPDATA "Programs\Rancher Desktop\resources\resources\win32\docker-cli-plugins\docker-compose.exe"

$settings | Add-Member -NotePropertyName "dev.containers.dockerPath" -NotePropertyValue $dockerPath -Force
$settings | Add-Member -NotePropertyName "dev.containers.dockerComposePath" -NotePropertyValue $dockerComposePath -Force
# Use a high depth to ensure the whole object is serialized
$settings | ConvertTo-Json -Depth 100 | Set-Content $settingsPath
Write-Host "Settings updated successfully."
