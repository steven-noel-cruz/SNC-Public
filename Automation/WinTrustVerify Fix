<#
.SYNOPSIS
    Modifies the registry settings for Microsoft's Cryptography and Wintrust to enable certificate padding checks.

.NOTES
    Author        : [Steven Noel Cruz]
    Date Created  : [01/13/2025]
    Last Modified : [01/13/2025]
    Version       : 1.0

.DESCRIPTION
    This script creates registry keys and sets values for Cryptography and Wintrust in the system registry.
    It ensures that the EnableCertPaddingCheck is enabled.

    Run this script with Administrator privileges, and remember to reboot the system after running the script
    for changes to take effect.

.USAGE
    Example syntax:
    PS C:\> .\cert-padding-check.ps1
#>

# Check and create registry key for Wintrust if it doesn't exist
if (!(Test-Path 'HKLM:\Software\Microsoft\Cryptography\Wintrust')) {
    New-Item -Path 'HKLM:\Software\Microsoft\Cryptography' -Name 'Wintrust' | Out-Null
}

if (!(Test-Path 'HKLM:\Software\Microsoft\Cryptography\Wintrust\Config')) {
    New-Item -Path 'HKLM:\Software\Microsoft\Cryptography\Wintrust' -Name 'Config' | Out-Null
}

# Enable certificate padding check
Set-ItemProperty -Path 'HKLM:\Software\Microsoft\Cryptography\Wintrust\Config' -Name 'EnableCertPaddingCheck' -Value '1' -Type DWORD

# Repeat for Wow6432Node (for 32-bit compatibility)
if (!(Test-Path 'HKLM:\Software\Wow6432Node\Microsoft\Cryptography\Wintrust')) {
    New-Item -Path 'HKLM:\Software\Wow6432Node\Microsoft\Cryptography' -Name 'Wintrust' | Out-Null
}

if (!(Test-Path 'HKLM:\Software\Wow6432Node\Microsoft\Cryptography\Wintrust\Config')) {
    New-Item -Path 'HKLM:\Software\Wow6432Node\Microsoft\Cryptography\Wintrust' -Name 'Config' | Out-Null
}

# Enable certificate padding check for Wow6432Node
Set-ItemProperty -Path 'HKLM:\Software\Wow6432Node\Microsoft\Cryptography\Wintrust\Config' -Name 'EnableCertPaddingCheck' -Value '1' -Type DWORD

# Notify the user to reboot the system
Write-Output 'Please reboot your system to apply the changes.'
