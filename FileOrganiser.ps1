#region Variables
$imgTypes = ".png", ".jpg", ".jpeg", ".gif", ".bmp", ".tiff", ".webp"

$docTypes = ".pdf", ".doc", ".docx", ".xls", ".xlsx", ".txt"
#endregion

function Menu {
 $running = $true
 while ($running) {
  $choice = Read-Host "1: Desktop `n2: Downloads `n3: Custom location`n4: Exit `n>"
  switch ($choice) {
   1 { AutoCleanup 1; exit }
   2 { AutoCleanup 2; exit }
   3 { LocationSelect }
   4 { exit }
   Default { Write-Host "Error: Invalid input" }
  }
 }
}

function AutoCleanup {
 param (
  [byte] $userChoice
 )
 
 $desktop = Get-ChildItem -Path $env:USERPROFILE\Desktop -File -Recurse
 $downloads = Get-ChildItem -Path $env:USERPROFILE\Downloads -File -Recurse
 $documents = "$env:USERPROFILE\Downloads"
 $pictures = "$env:USERPROFILE\Pictures"

 $downloadedImages = "$env:USERPROFILE\Pictures\DownloadedImages"
 $downloadedDocuments = "$env:USERPROFILE\Documents\DownloadedImages"

 switch ($userChoice) {
  #Cleans up the desktop
  1 {
   foreach ($file in $desktop) {
    #If files are images
    if ($file.Extension -in $imgTypes) {
     Move-Item -Path $desktop, $file -join "" -Destination $pictures, $file -join ""
    }
    elseif ($file.Extension -in $docTypes) {
     #If files are documents
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
     #If files are images
     Move-Item -Path $downloads, $file -join"" -Destination $downloadedImages, $file -join""
    }
    elseif ($file.Extension -in $docTypes) {
     #If files are documents
     Move-Item -Path $downloads, $file -join"" -Destination $downloadedDocuments, $file -join""
    }
   } 

   Write-Host "Download folder organised" 
  }
 }
}

function LocationSelect {
 Add-Type -AssemblyName System.Windows.Forms
 $FolderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
 $null = $FolderBrowser.ShowDialog()
 $ChosenPath = $FolderBrowser.SelectedPath
 if ($null -ne $FolderBrowser.SelectedPath) {
  CustomCleanup $ChosenPath
 }
}

function CustomCleanup {
 param (
  [string] $userPath
 )

 #Creates custom folders in the selected path to move the doc/images into
 $customDocuments = "$userPath\Documents"
 $customImages = "$userPath\Images"

 #Creates the custom folders if they do not exist
 if (!(Test-Path -Path $customDocuments)) {
  New-Item -ItemType Directory $customDocuments | Out-Null
 }
 if (!(Test-Path -Path $customImages)) {
  New-Item -ItemType Directory $customImages | Out-Null
 }
 
 foreach ($file in $userPath) {
  #If files are images
  if ($file.Extension -in $imgTypes) {
   Move-Item -Path $userPath, $file -join"" -Destination $customImages, $file -join""
  }

  #If files are documents
  elseif ($file.Extension -in $docTypes) {
   Move-Item -Path $userPath, $file -join"" -Destination $customDocuments, $file -join""
  }
 } 
 Write-Host "$userLocation organised"
}

Menu