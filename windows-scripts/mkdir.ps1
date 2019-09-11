param (
    [string]$dirName = ".\tmp",
 )

Function createDirectory{
    New-Item -ItemType directory -Path .\$dirName
}

Set-Alias -Name mkdir -Value createDirectory