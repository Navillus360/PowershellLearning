#Checks if the user is an admin
$user = [Security.Principle.WindowsIdentity]::GetCurrent()
$principlal = New-Object Security.Principle.WindowsPrincipal $user
$isAdmin = $principlal.IsInRole([Security.Principle.WindowsBuiltInRole]::Administrator)

function Menu {
 $running = $true
 while ($running) {
  if ($isAdmin) {
   echo $isAdmin
   $userChoice = Read-Host "1: Add user `n2: Delete user `n3: Exit `n>"
   switch ($userChoice) {
    1 { CreateUser; exit }
    2 { DeleteUser; exit }
    3 { exit }
    Default { Write-Host "Error: Invalid input" }
   }
   else {
    Write-Host "<!>Error: You do not have the admin rights to use this script! Please login into an account which has admin rights or change your privlages<!>"
    exit
   }
  }
 }
}

function CreateUser {
 $userName = Read-Host "Enter username >"
 $password = Read-Host "Enter password >"
 $displayName = Read-Host "Enter displayName >"
 $adminRights = Read-Host "Set user to admin? [Y/n]"
 if ($adminRights -eq "Y") {
  echo "Admin rights"
 }
 elseif ($adminRights -eq "n") {
  echo "No admin rights"
 }
 # New-LocalUser -Name $userName -Password $password -FullName $displayName
 # Add-LocalGroupMember -Group Adminstrators -Member $userName
}

function DeleteUser {
 # Remove-LocalUser -Name $userName
 # Get-CimInstance -Class Win32_UserProfile | Where-Object { $_.LocalPath -like $userName } | Remove-CimInstance
 # Remove-Item -Path "C:\Users\$username" -Recurse -Force
}

Menu