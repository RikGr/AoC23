# Get input1.txt and put it in a variable
#$input1 = Get-Content -Path .\day1\input1.txt
$input1 = Get-Content -Path .\day1\input1.txt


# Loop through each line in the input file
foreach ($line in $input1) {

     $line = $line -replace '\D', ''
     $firstValue = $line[0]
     $lastValue = $line[$line.Length - 1]

     $result1 += @($firstValue + $lastValue)

}

# Convert $digits to integers
$result1 = $result1 | ForEach-Object { [int]$_ }

# Sum the values in $digits
$result1 = $result1 | Measure-Object -Sum | Select-Object -ExpandProperty Sum

Write-Host "Result question 1: $($result1)"

### Question 2

# Use switch to evaluate the lines
$newInput = $null
foreach ($line in $input1) {

     switch -Wildcard ($line) {
          "*one*" {
               $line = $line -replace 'one', 'one1one'
          }
          "*two*" {
               $line = $line -replace 'two', 'two2two'
          }
          "*three*" {
               $line = $line -replace 'three', 'three3three'
          }
          "*four*" {
               $line = $line -replace 'four', 'four4four'
          }
          "*five*" {
               $line = $line -replace 'five', 'five5five'
          }
          "*six*" {
               $line = $line -replace 'six', 'six6six'
          }
          "*seven*" {
               $line = $line -replace 'seven', 'seven7seven'
          }
          "*eight*" {
               $line = $line -replace 'eight', 'eight8eight'
          }
          "*nine*" {
               $line = $line -replace 'nine', 'nine9nine'
          }
     }
     $newInput += @($line)
}


foreach ($line in $newInput) {

     $line = $line -replace '\D', ''
     $firstValue = $line[0]
     $lastValue = $line[$line.Length - 1]

     $result2 += @($firstValue + $lastValue)

}

Write-Host $result2

# Convert $digits to integers
$result2 = $result2 | ForEach-Object { [int]$_ }

# Sum the values in $digits
$result2 = $result2 | Measure-Object -Sum | Select-Object -ExpandProperty Sum

Write-Host "Result question 2: $result2"
