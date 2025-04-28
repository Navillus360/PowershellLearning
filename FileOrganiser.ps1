#region Variables
$desktop = Get-ChildItem -Path $env:USERPROFILE\Desktop -File -Recurse

$downloads = Get-ChildItem -Path $env:USERPROFILE\Downloads -File -Recurse

$imgTypes = ".png", ".jpg", ".jpeg", ".gif", ".bmp", ".tiff", ".webp"

$docTypes = ".pdf", ".doc", ".docx", ".xls", ".xlsx", ".txt"

$documents = "$env:USERPROFILE\Downloads"

$pictures = "$env:USERPROFILE\Pictures"

$downloadedImages = "$env:USERPROFILE\Pictures\DownloadedImages"

$downloadedDocuments = "$env:USERPROFILE\Documents\DownloadedImages"
#endregion

function Menu {
 $running = $true
 while ($running) {
  $choice = Read-Host "1: Desktop `n2: Downloads `n3: Custom location`n4: Exit `n>"
  switch ($choice) {
   1 { Cleanup 1; exit }
   2 { Cleanup 2; exit }
   3 { LocationSelect }
   4 { exit }
   Default { Write-Host "Error: Invalid input" }
  }
 }
}

function Cleanup {
 param (
  [byte] $userChoice
 )

 switch ($userChoice) {
  #Cleans up the desktop
  1 {
   foreach ($file in $desktop) {
    if ($file.Extension -in $imgTypes) {
     Move-Item -Path $desktop, $file -join "" -Destination $pictures, $file -join ""
    }
    elseif ($file.Extension -in $docTypes) {
     Move-Item -Path $desktop, $file -join "" -Destination $documents, $file -join ""
    }
   }
   Write-Host "Desktop organised" 
  }

  #Cleans up the downloads
  2 {
   #Creates the downloaded images/docs if the dir does not exist
   if (!(Test-Path -Path $downloadedImages)) {
    New-Item -ItemType Directory $downloadedImages | Out-Null
   }
   if (!(Test-Path -Path $downloadedDocuments)) {
    New-Item -ItemType Directory $downloadedDocuments | Out-Null
   }

   foreach ($file in $downloads) {
    if ($file.Extension -in $imgTypes) {
     Move-Item -Path $downloads, $file -join"" -Destination $downloadedImages, $file -join""
    }
    elseif ($file.Extension -in $downloads) {
     Move-Item -Path $downloads, $file -join"" -Destination $downloadedDocuments, $file -join""
    }
   } 

   Write-Host "Download folder organised" 
  }
 }
}

function LocationSelect {
 $userLocaion = Read-Host "If you wish to return to the menu, enter 1. Otherwise, enter the full location you wish to cleanup `n>"
 if ($userLocaion -eq 1) {
  Menu
 }
 if (!(Test-Path -Path $userLocaion)) {
  Write-Host "Error: The location does not exist! Please choose another."
 }
 else {
  foreach ($file in $userLocaion) {
   if ($file.Extension -in $imgTypes) {
    Move-Item -Path $userLocaion, $file -join"" -Destination $userLocaion, $file -join""
   }
   elseif ($file.Extension -in $downloads) {
    Move-Item -Path $downloads, $file -join"" -Destination $downloadedDocuments, $file -join""
   }
  } 
 }

 Write-Host "$userLocation organised"
}

Menu