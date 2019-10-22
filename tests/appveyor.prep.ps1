﻿# Write-Host -Object "appveyor.prep: Cloning lab materials"  -ForegroundColor DarkGreen
# git clone -q --branch=master --depth=1 https://github.com/sqlcollaborative/appveyor-lab.git C:\github\appveyor-lab
#Install codecov to upload results
# Write-Host -Object "appveyor.prep: Install codecov" -ForegroundColor DarkGreen
# choco install codecov | Out-Null
# "Installing nuget and PSScriptAnalyzer"
#Install-PackageProvider NuGet -MinimumVersion '2.8.5.201' -Force | Out-Null
#Import-PackageProvider NuGet -MinimumVersion '2.8.5.201' -Force | Out-Null
#Install-Module -Name PSScriptAnalyzer -RequiredVersion 1.6.0 -Repository PSGallery -Force | Out-Null

# "Get Pester manually"
Write-Host -Object "appveyor.prep: Install Pester" -ForegroundColor DarkGreen
Install-Module -Name Pester -Repository PSGallery -Force -Scope CurrentUser | Out-Null
Write-Host -Object "appveyor.prep: Install Assert" -ForegroundColor DarkGreen
Install-Module -Name Assert -Repository PSGallery -Force -Scope CurrentUser | Out-Null
Write-Host -Object "appveyor.prep: Install PSFramework" -ForegroundColor DarkGreen
Install-Module -Name PSFramework -Repository PSGallery -Force -Scope CurrentUser | Out-Null
Write-Host -Object "appveyor.prep: Install ziphelper" -ForegroundColor DarkGreen
Install-Module -Name ziphelper -Repository PSGallery -Force -Scope CurrentUser | Out-Null
Write-Host -Object "appveyor.prep: Install PSScriptAnalyzer" -ForegroundColor DarkGreen
Install-Module -Name PSScriptAnalyzer -Repository PSGallery -Force -Scope CurrentUser | Out-Null
Write-Host -Object "appveyor.prep: Install PowerShellGet" -ForegroundColor DarkGreen
Get-module powershellget, packagemanagement -ListAvailable
Install-Module -Name PowerShellGet, packagemanagement -Repository PSGallery -Force -Scope CurrentUser | Out-Null
Get-module powershellget, packagemanagement -ListAvailable
Get-module powershellget, packagemanagement
import-module powershellget, packagemanagement -Force
Get-module powershellget, packagemanagement

# workaround for https://github.com/OneGet/oneget/issues/475
Write-Host -Object "appveyor.prep: Install Loop Dependecy fix" -ForegroundColor DarkGreen
Install-Package System.Numerics.Vectors -provider Nuget -Source https://www.nuget.org/api/v2 -SkipDependencies -Scope CurrentUser -Force | Out-Null
# Install-Package System.Diagnostics.DiagnosticSource -RequiredVersion 4.5.1 -Provider nuget -Source https://www.nuget.org/api/v2 -Force -Scope CurrentUser | Out-Null
# Install-Package System.Net.Http -Provider nuget -Source https://www.nuget.org/api/v2 -Force -Scope CurrentUser | Out-Null
# Install-Package System.Diagnostics.DiagnosticSource -Provider nuget -Source https://www.nuget.org/api/v2 -Force -Scope CurrentUser | Out-Null

# Set logging parameters
Set-PSFConfig -FullName psframework.logging.filesystem.maxmessagefilebytes -Value (100 * 1024 * 1024) -PassThru | Register-PSFConfig
Set-PSFConfig -FullName psframework.logging.filesystem.maxtotalfoldersize -Value (500 * 1024 * 1024) -PassThru | Register-PSFConfig