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