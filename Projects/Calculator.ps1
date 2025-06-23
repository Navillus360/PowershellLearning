$global:sum = 0
function Menu {
  $running = $true
 while ($running) {
   Write-Output "1: Add `n2: Subtract `n3: Divide `n4: Multiply `n5: Clear `n6: Exit `nEnter your input (1/2/3/4/5/6)"
   $userInput = Read-Host ">"
   switch ($userInPut) {
    1 { Add }
    2 { Subtract }
    3 {  Divide }
    4 { Multiply }
    5 {$global:sum = 0}
    6 {$running = $false}
    Default {Write-Output "Error: Invalid input"}
   }
 }
}

function Add {
 $num1 = Read-Host "Enter first number >"
 $num2 = Read-Host "Enter second number >"
 $Global:sum = $global:sum += ([int]$num1 + [int]$num2)
 Write-Output "The sum is: $Global:sum" 
}
function Subtract {
 $num1 = Read-Host "Enter first number >"
 $num2 = Read-Host "Enter second number >"
 $Global:sum = $global:sum -= ([int]$num1 + [int]$num2)
 Write-Output "The sum is: $Global:sum" 
}
function Multiply {
 $num1 = Read-Host "Enter first number >"
 $num2 = Read-Host "Enter second number >"
 $Global:sum = $global:sum *= ([int]$num1 * [int]$num2)
 Write-Output "The sum is: $Global:sum" 
}
function Divide {
 $num1 = Read-Host "Enter first number >"
 $num2 = Read-Host "Enter second number >"
 $Global:sum = $global:sum /= ([int]$num1 / [int]$num2)
 Write-Output "The sum is: $Global:sum" 
}

Menu