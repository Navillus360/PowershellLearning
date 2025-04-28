$desktop = Get-ChildItem -Path $env:USERPROFILE\Desktop -File -Recurse
$imgTypes = ".png", ".jpg", ".jpeg", ".gif", ".bmp", ".tiff", ".webp"
$docTypes = ".pdf", ".doc", ".docx", ".xls", ".xlsx", ".txt"

function Menu {
 $running = $true
 while ($running) {
  $choice = Read-Host "1: Desktop `n2: Downloads `n3: Custom location`n4: Exit `n>"
  switch ($choice) {
   1 { Cleanup 1 }
   2 { Cleanup 2 }
   3 { Cleanup 3 }
   4 { exit }
   Default { Write-Host "Error: Invalid input" }
  }
 }
}

function Cleanup {
 param (
  [byte] $userChoice
 )
 
}

Menu