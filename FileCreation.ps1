$Global:currentDirectory = Get-Location
$Global:fileToCreate = $currentDirectory, "\HelloWorld.txt" -join""
$Global:folderToCreate = $currentDirectory, "\TestFolder" -join""

function Menu {
 $running = $true
 while ($running) {
   $userInput = Read-Host "1: Create File `n2: Create Folder `n3: Exit `n>"
   switch ($userInput) {
    1 { ItemSetup 1 }
    2 { ItemSetup 2 }
    3 {$running = $false}
    Default {Write-Host "Error: Invalid input"}
   }
 }
}

function ItemSetup($answer) {
 $itemName = Read-Host "What would you like to name this File/Folder? `n>"
 $itemLocation = Read-Host "Where would you like to create the File/Folder? `n>"
 switch ($answer) {
  1 {CreateFile $itemName, $itemLocation}
  2 {CreateFolder $itemName, $itemLocation}
 }
}

function CreateFile($fileName ,$fileLocation){
 Write-Host "$folderName $folderLocation"
 # Creates the file
 # New-Item -Path $Global:fileToCreate -ItemType File
}

function CreateFolder($folderName ,$folderLocation){
 Write-Host "$folderName $folderLocation"
 # Creates the folder
 # New-Item -Path $Global:fileToCreate -ItemType Folder
}

# <!> How to get the users username <!>
# Write-Host (Get-ChildItem Env:\USERNAME).value 

Menu