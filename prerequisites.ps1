# Install .NET Core Runtime
Invoke-WebRequest -Uri https://dot.net/v1/dotnet-install.ps1 -OutFile dotnet-install.ps1
.\dotnet-install.ps1 -Channel 8.0 -Runtime aspNetCore

Invoke-WebRequest -Uri https://dot.net/v1/dotnet-install.ps1 -OutFile dotnet-install.ps1
.\dotnet-install.ps1 -Channel 8.0
Remove-Item dotnet-install.ps1

# Check .NET is installed
(Get-ItemProperty -Path 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full').Version

# Set PATH environment variable to include dotnet directory
[System.Environment]::SetEnvironmentVariable("Path", $env:Path + ";C:\Users\Administrator\AppData\Local\Microsoft\dotnet\", [EnvironmentVariableTarget]::Machine)


# Install Git
Invoke-WebRequest -Uri https://github.com/git-for-windows/git/releases/download/v2.35.1.windows.1/Git-2.35.1-64-bit.exe -OutFile Git-2.35.1-64-bit.exe
Start-Process -FilePath Git-2.35.1-64-bit.exe -ArgumentList "/SILENT" -Wait 
Remove-Item Git-2.35.1-64-bit.exe

# Set PATH environment variable to include Git directory
[System.Environment]::SetEnvironmentVariable("Path", "$env:Path;C:\Program Files\Git\bin\;C:\Program Files\Git\cmd\", [EnvironmentVariableTarget]::Machine)

# Install IIS (Internet Information Services) if not already installed
Install-WindowsFeature -Name Web-Server -IncludeManagementTools

# Install Web Management Service
Install-WindowsFeature -Name Web-Mgmt-Service 
