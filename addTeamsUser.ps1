Connect-MicrosoftTeams -AccountId your.emal@email.com
$group = New-Team -MailNickname "yourgrouprnickname" -displayname "your groupr nickname" -Visibility "private"
$ScriptDir = Split-Path $MyInvocation.MyCommand.Path
$pattern = "([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})"
$emails = (Get-Content -Path $ScriptDir\emails.txt -Raw | Select-String $pattern -AllMatches).Matches 

foreach($email in $emails) {
    Add-TeamUser -GroupId $group.GroupId -User  $email 
}

Write-Host "All done!!!"
Write-Host "Press any key to continue..."
$Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyUp") > $null