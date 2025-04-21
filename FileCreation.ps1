$Global:currentDirectory = Get-Location
$Global:fileToCreate = $currentDirectory, "\HelloWorld.txt" -join""
$Global:folderToCreate = $currentDirectory, "\TestFolder" -join""

function Menu {
 $running = true
 while ($running) {
   $userInput = Read-Host "1: Create File `n2: Create Folder `n3: Exit"
   switch ($userInput) {
    1 {  New-Item -Path $Global:fileToCreate -ItemType File }
    2 {  New-Item -Path $Global:fileToCreate -ItemType Folder}
    3 {$userInput = false}
    Default {Write-Host "Error: Invalid input"}
   }
 }
}