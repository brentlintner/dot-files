#function prompt
#{
    #Write-Host (Get-Location) -foregroundcolor DarkGray
    #Write-Host ("$") -nonewline -foregroundcolor DarkGreen
    #return " "
#}
# sudo cmd /c mklink ...Documents\WindowsPowerShell\profile.ps1 ..dot-files\profile.ps1

Function gitstatus {git status}

new-alias grep findstr
new-alias which where.exe
Set-Alias -Name g -Value gitstatus

# https://github.com/dahlbyk/posh-git
Import-Module posh-git

$GitPromptSettings.DefaultPromptSuffix.Text = '$ ';
$GitPromptSettings.DefaultPromptSuffix.ForegroundColor = [ConsoleColor]::DarkGreen;
$GitPromptSettings.EnableFileStatus = $false
$GitPromptSettings.DefaultPromptPath.ForegroundColor = [ConsoleColor]::DarkGray;
$GitPromptSettings.DefaultPromptBeforeSuffix.Text = '`n'
$GitPromptSettings.DefaultPromptPrefix.ForegroundColor = [ConsoleColor]::DarkGreen
