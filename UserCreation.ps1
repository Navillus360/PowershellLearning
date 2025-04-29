
function Menu {
 $running = $true
 $currentUser = whoami.exe
 $Admins = Get-LocalGroupMember -Name Administrators | 
 Select-Object -ExpandProperty name
 while ($running) {
  if ($admins -Contains $currentUser) {
   $userChoice = Read-Host "1: Add user `n2: Delete user `n3: Exit `n>"
   switch ($userChoice) {
    1 { CreateUser; exit }
    2 { DeleteUser; exit }
    3 { exit }
    Default { Write-Host "Error: Invalid input" }
   }
  }
  else {
   Write-Host "<!>Error: You do not have the admin rights to use this script! Please login into an account which has admin rights or change your privlages<!>"
   $running = $false
   exit
  }
 }
}

function CreateUser {
 $userName = Read-Host "Enter username >"
 $password = Read-Host "Enter password >"
 $displayName = Read-Host "Enter displayName >"
 $adminRights = Read-Host "Set user to admin? [Y/n]"
 if ($adminRights -eq "Y") {
  New-LocalUser -Name $userName -Password $password -FullName $displayName
 }
 elseif ($adminRights -eq "n") {
  New-LocalUser -Name $userName -Password $password -FullName $displayName
  Add-LocalGroupMember -Group Adminstrators -Member $userName
 }
 Write-Host "User created"
}

function DeleteUser {
 $userName = Read-Host "Enter username >"
 if ((Get-LocalUser).Name -contains $userName) {
  Remove-LocalUser -Name $userName
  Get-CimInstance -Class Win32_UserProfile | Where-Object { $_.LocalPath -like $userName } | Remove-CimInstance
  Remove-Item -Path "C:\Users\$username" -Recurse -Force
  Write-Host "User removed"
 }
 elseif ($userName -eq $env:USERPROFILE) {
  Write-Host "You cannot delete yourself!"
 }
 else {
  Write-Host "Error: Name invalid or user does not exist"
 }
}

