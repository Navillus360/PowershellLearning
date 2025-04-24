$userName = $Env:USERNAME
$startLocation = Get-Location
cd 'C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Startup'
$PWD
cd C:\Users\$userName\Desktop
$PWD
cd C:\Users\$userName\Pictures
$PWD
cd C:\Windows\fr-FR
$PWD
cd C:\Drivers\USB
$PWD
cd $startLocation
echo "Now I am back home!"
# for (($i = 0); $i -le 5; $i++ ) {

# }

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
 
}
function Hard {
 
}
function Instructions {
 Write-Host "Depending on the difficulty selected 5-7 text files will be created and placed into random locations on your drive. `n`n==Easy difficulty== `n5 files will be generated and the terminal will produce vague hints in where they could be. `n`n==Hard difficulty==`n7 text files will be generated but no hints will be given :)"
}