$currentDirectory = Get-Location
$fileToCreate = $currentDirectory,"\HelloWorld.txt" -join""
Write-Host $test
New-Item -Path "$fileToCreate" -ItemType File