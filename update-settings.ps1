$settingsPath = "$HOME\AppData\Roaming\Code\User\settings.json"
$settings = Get-Content $settingsPath -Raw | ConvertFrom-Json
$settings | Add-Member -NotePropertyName "dev.containers.dockerPath" -NotePropertyValue "C:\Users\mp0236\AppData\Local\Programs\Rancher Desktop\resources\resources\win32\bin\docker.exe" -Force
$settings | Add-Member -NotePropertyName "dev.containers.dockerComposePath" -NotePropertyValue "C:\Users\mp0236\AppData\Local\Programs\Rancher Desktop\resources\resources\win32\docker-cli-plugins\docker-compose.exe" -Force
# Use a high depth to ensure the whole object is serialized
$settings | ConvertTo-Json -Depth 100 | Set-Content $settingsPath
Write-Host "Settings updated successfully."
