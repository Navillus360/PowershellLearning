function Menu {
  $running = $true
 while ($running) {
   echo "1: Add `n2: Subtract `n3: Divide `n4: Multiply `n5: Exit `nEnter your input (1/2/3/4/5)"
   $input = Read-Host ">"
   switch ($input) {
    1 { Add }
    2 { Subtract }
    3 { Multiply }
    4 { Divide }
    5 {$running = $false}
    Default {echo "Error: Invalid input"}
   }
 }
}

function Add {
 echo "Add calculation"
}
function Subtract {
 echo "Subtract calculation"
}
function Multiply {
 echo "Divide calculation"
}
function Divide {
 echo "Multiply calculation"
}

Menu