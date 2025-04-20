function Menu {
 $test = 0
 while ($test -lt 2) {
   echo "1: Add `n2: Subtract `n3: Divide `n4: Multiply `nEnter your input (1/2/3/4/)"
   $input = Read-Host ">"
   echo "$input"
   $test++
   if($test -eq 2){
    echo "Program finished"
   }
 }
}

Menu