$Global:defaultFile = "\TextFile.txt"
$Global:defaultFolder = "\TestFolder"
$Global:defaultDirectory = Get-Location
$Global:defaultItem = $Global:defaultDirectory, $Global:defaultFile -join ""

function Menu {
  Write-Host "$Global:defaultDirectory"
  $running = $true
  while ($running) {
    $userInput = Read-Host "1: Create File `n2: Create Folder `n3: Exit `n>"
    switch ($userInput) {
      1 { ItemSetup 1 }
      2 { ItemSetup 2 }
      3 { $running = $false }
      Default { Write-Host "Error: Invalid input" }
    }
  }
}

function ItemSetup() {
  param (
    [string] $answer
  )
  $itemName = Read-Host "What would you like to name this File/Folder? `n>"
  $itemLocation = Read-Host "Where would you like to create the File/Folder? `n<!> If you input nothing for the File/Folder name, a default name and location will be chosen for you<!> `n>"
  switch ($answer) {
    1 { CreateFile $itemName, $itemLocation }
    2 { CreateFolder $itemName, $itemLocation }
  }
}

function CreateFile() {
  param (
    [string] $fileName,
    [string] $fileLocation
  )

  if ($fileName -eq " " -and $fileLocation -eq "") {
    Read-Host "No location and name given"
    New-Item -Path $Global:defaultItem -ItemType File
  }
  elseif ($fileName -eq "") {
    Read-Host "No name but location given"
    $fileToCreate = $fileLocation, $Global:defaultFile -join ""
    New-Item -Path $fileToCreate -ItemType File
  }
  elseif ($fileLocation -eq "") {
    Read-Host "No location but name given"
    $fileToCreate = $Global:defaultFolder, $fileName -join ""
    New-Item -Path $fileToCreate -ItemType File
  }
  else {
    $fileToCreate = $fileName, $fileLocation -join ""
    New-Item -Path $fileToCreate -ItemType File
  }
  Write-Host "<!>File Created<!>"s
}

function CreateFolder() {
  param (
    [string] $folderName,
    [string] $folderLocation
  )
  
  if ($folderName -eq " " -and $folderLocation -eq "" ) {
    Read-Host "No location and name given"
    $folderToCreate = $Global:defaultDirectory, $Global:defaultFolder -join ""
    New-Item -Path $folderToCreate -ItemType Directory
  }
  elseif ($folderName -eq "") {
    Read-Host "No name but location given"
    $folderToCreate = $folderLocation, $Global:defaultFolder -join ""
    New-Item -Path $folderToCreate -ItemType Directory
  }
  elseif ($folderLocation -eq "") {
    Read-Host "No location but name given"
    $folderToCreate = $folderName, $Global:defaultDirectory -join ""
    New-Item -Path $folderToCreate -ItemType Directory
  }
  else {
    $folderToCreate = $folderName, $folderLocation
    New-Item -Path $folderToCreate -ItemType Directory
  }
  Write-Host "<!>Folder Created<!>"
}

Menu