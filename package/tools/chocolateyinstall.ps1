# jabra-direct install

$ErrorActionPreference = 'Stop';

$toolsDir            = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$PackageParameters   = Get-PackageParameters
$urlPackage = 'https://jabraxpressonlineprdstor.blob.core.windows.net/jdo/JabraDirectSetup.exe'
$checksumPackage = 'e1a678fb19c7a3eb6b741a25ad39bd86a27eb7a59022e3b4088594a756be6a71bd7124cf7cbe56a1a19dd7b976a2316a13784dd1bb68842e8f2c06ca76771f6d'
$checksumTypePackage = 'SHA512'

Import-Module -Name "$($toolsDir)\helpers.ps1"

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    fileType       = 'EXE'
    url            = $urlPackage
    checksum       = $checksumPackage
    checksumType   = $checksumTypePackage
	silentArgs     = '/install /quiet /norestart'
    validExitCodes = @(0, 1000, 1101)
}

Install-ChocolateyPackage @packageArgs

if ($PackageParameters.CleanStartmenu) {
	Remove-FileItem `
		-Path "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Jabra\"
    Install-ChocolateyShortcut `
        -ShortcutFilePath "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Jabra Direct.lnk" `
        -TargetPath "C:\Program Files (x86)\Jabra\Direct\JabraDirect.exe" `
        -WorkDirectory "C:\Program Files (x86)\Jabra\Direct\"
}	
