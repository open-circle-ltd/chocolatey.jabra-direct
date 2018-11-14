import-module au

$url                 = 'https://www.jabra.com/support/release-notes/release-note-jabra-direct'
$checksumTypePackage = "SHA512"

function global:au_SearchReplace {
    @{
        'tools\chocolateyInstall.ps1'   = @{
            "(^\s*[$]*urlPackage\s*=\s*)('.*')"          = "`$1'$($Latest.URL32)'"
            "(^\s*[$]*checksumPackage\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum32)'"
            "(^\s*[$]*checksumTypePackage\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType32)'"
        }; 
    }
}

function global:au_GetLatest {
    $download_page = Invoke-WebRequest -Uri $url -UseBasicParsing -DisableKeepAlive

    $reLatestbuild = '(.*Version.*)'
    $download_page.Content -imatch $reLatestbuild
    $latestbuild = $Matches[0]

    $reVersion = "(\d+)(.)(\d+)(.)(\d+)"
    $latestbuild -imatch $reVersion
    $version = $Matches[0]

    $urlVersion = $Matches[0].split(".")[0,1]
    $urlVersion = $urlVersion -join "."
    $urlPackage = "https://jabraxpressonlineprdstor.blob.core.windows.net/jdo/JabraDirectSetup.exe"

    return  @{ 
        URL32          = $urlPackage;
        ChecksumType32 = $checksumTypePackage;
        Version        = $version
    }
}

function global:au_AfterUpdate ($Package) {
    Set-DescriptionFromReadme $Package -SkipFirst 3
}
update -ChecksumFor all
