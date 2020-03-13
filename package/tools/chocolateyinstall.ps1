# jabra-direct install

$ErrorActionPreference = 'Stop';

$toolsDir            = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)"
$PackageParameters   = Get-PackageParameters
$urlPackage = 'https://jabraxpressonlineprdstor.blob.core.windows.net/jdo/JabraDirectSetup.exe'
$checksumPackage = 'e9d5e93e20ea8c55d5b7ad8210bf3cbb233705b6798c4fb7bb2aa9c87e58b0de30d67d8462b9fdd4c0a820de1850b46cf904333084041f717dade85ca03c2fb4'
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
