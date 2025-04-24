$Global:userName = $Env:USERNAME
$Global:startLocation = Get-Location
$Global:locations = @(
 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup'
 'C:\Users\$userName\Desktop'
 'C:\Users\$userName\Pictures'
 'C:\Windows\fr-FR'
 'C:\Drivers\USB'
 'C:\Windows\Boot\Resources\'
 'C:\Program Files (x86)\InstallShield Installation Information'
 'C:\Users'
 'C:\Windows\System32\Boot'
 Get-Location
)

function Menu {
 $running = $true
 while ($running) {
  $userChoice = Read-Host "1: Easy difficulty (Hints) `n2: Hard difficulty (No hints) `n3: Instructions `n4: Exit `n>"
  switch ($userChoice) {
   1 { Clear-Host; Easy }
   2 { Clear-Host; Hard }
   3 { Clear-Host; Instructions }
   4 { exit }
   Default { Write-Host "Error: Invalid input"; Clear-Host; Menu }
  }
 }
}

function Easy {
 for ($i = 0; $i -le 5; $i++) {
  $randomIndex = Get-Random -InputObject $Global:locations
  Set-Location $randomIndex
  $fileName = "File", $i -join ""
  New-Item -Path $fileName -ItemType File
  if ($i -eq 5) {
   Set-Content -Path $randomIndex -Value "You found the final file! Well done!"
  }
  else {
   Set-Content -Path $randomIndex -Value "You found File $i. Can you find the others?"
  }
  Set-Location $Global:startLocation
 }
}
function Hard {
 for ($i = 0; $i -le 7; $i++) {
  $randomIndex = Get-Random -InputObject $Global:locations
  Set-Location $randomIndex
  $fileName = "File", $i -join ""
  New-Item -Path $fileName -ItemType File
  if ($i -eq 7) {
   Set-Content -Path $randomIndex -Value "You found the final file! Well done!"
  }
  else {
   Set-Content -Path $randomIndex -Value "You found File $i. Can you find the others?"
  }
  Set-Location $Global:startLocation
 }
}
function Instructions {
 Write-Host "Depending on the difficulty selected 5 or 7 text files will be created and placed into random locations on your drive. `n`n==Easy difficulty== `n5 files will be generated and the terminal will produce vague hints in where they could be. `n`n==Hard difficulty==`n7 text files will be generated but no hints will be given :)`n"
}

Menu