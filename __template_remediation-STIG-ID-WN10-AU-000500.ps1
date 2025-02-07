<#
.SYNOPSIS
    This PowerShell script ensures that the maximum size of the Windows Application event log is at least 32768 KB (32 MB).

.NOTES
    Author          : Steven Cruz
    LinkedIn        : linkedin.com/in/stevennoelcallcruz/
    GitHub          : github.com/steven-noel-cruz
    Date Created    : 2025-02-04
    Last Modified   : 2025-02-04
    Version         : 1.0
    CVEs            : N/A
    Plugin IDs      : N/A
    STIG-ID         : WN10-AU-000500

.TESTED ON
    Date(s) Tested  : 2025-02-07
    Tested By       : Steven Cruz
    Systems Tested  : Windows (Windows 10 Pro)
    PowerShell Ver. : Powershell 5.1

.USAGE
    Put any usage instructions here.
    Example syntax:
    PS C:\> .\__remediation_template(STIG-ID-WN10-AU-000500).ps1 
#>

# Define the registry path and value
$registryPath = "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog\Application"
$valueName = "MaxSize"
$valueData = 32768

# Check if the registry path exists, if not, create it
if (-not (Test-Path $registryPath)) {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\EventLog" -Name "Application" -Force
}

# Set the registry value (REG_DWORD)
New-ItemProperty -Path $registryPath -Name $valueName -PropertyType DWORD -Value $valueData -Force

# Output the result
Write-Host "Registry key and value have been set successfully."

