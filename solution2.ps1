$input2 = Get-Content -Path .\day2\input.txt
$example = Get-Content -Path .\day2\example.txt


$redCubes = 12
$greenCubes = 13
$blueCubes = 14

$Ids = foreach ($line in $input2) {
    $colonIndex = $line.IndexOf(':')
    $($line.Substring(0, $colonIndex))

}

foreach ($line in $input2) {
    $colonIndex = $line.IndexOf(':')
    $games = $line.Substring($colonIndex + 1)
    $Id = $($line.Substring(0, $colonIndex))
    Write-Host "Games: $games"
    $games = $games.Split(';')
    foreach ($game in $games) {
        Write-Host "Game: $game"
        $game = $game.Split(',')
        foreach ($g in $game) {
            Write-Host "g: $g"
            if ($g -match 'red') {
                #convert $g to int
                $g = $g -replace '\D', ''
                $g = [int]$g
                if ($g -gt $redCubes) {
                    Write-Host "Red too much: $g"
                    $check = $true
                    $ImpossibleIds += @($Id)
                    break
                }
            }
            if ($g -match 'green') {
                $g = $g -replace '\D', ''
                $g = [int]$g
                if ($g -gt $greenCubes) {
                    Write-Host "Green too much: $g"
                    $check = $true
                    $ImpossibleIds += @($Id)
                    break
                }
            }
            if ($g -match 'blue') {
                $g = $g -replace '\D', ''
                $g = [int]$g
                if ($g -gt $blueCubes) {
                    Write-Host "Blue too much: $g"
                    $check = $true
                    $ImpossibleIds += @($Id)
                    break
                }
            }
        }
    }
}

$compare = Compare-Object -ReferenceObject $Ids -DifferenceObject $ImpossibleIds

$goodIds = $compare | Where-Object { $_.SideIndicator -eq '<=' } | Select-Object -ExpandProperty InputObject

# Remove non numbers from $goodIds
$goodIds = $goodIds -replace '\D', ''

# Convert $goodIds to integers
$goodIds = $goodIds | ForEach-Object { [int]$_ }

# Sum the values in $goodIds
$goodIds = $goodIds | Measure-Object -Sum | Select-Object -ExpandProperty Sum

Write-Host "Result question 1: $($goodIds)"


# Question 2

$red = $null
$green = $null
$blue = $null
$totalRed = $null
$totalGreen = $null
$totalBlue = $null
$Power = $null
$array = $null

$array = @()
foreach ($line in $input2) {
    $red = $null
    $green = $null
    $blue = $null
    $highestRed = $null
    $highestGreen = $null
    $highestBlue = $null
    $Power = $null
    $colonIndex = $line.IndexOf(':')
    $games = $line.Substring($colonIndex + 1)
    $Id = $($line.Substring(0, $colonIndex))
    Write-Host "Games: $games"
    $games = $games.Split(';')
    foreach ($game in $games) {
        Write-Host "Game: $game"
        $game = $game.Split(',')
        foreach ($g in $game) {
            Write-Host "g: $g"
            if ($g -match 'red') {
                #convert $g to int
                $g = $g -replace '\D', ''
                $red += @($g)
                Write-Host "$Id red: $red"
            }
            if ($g -match 'green') {
                $g = $g -replace '\D', ''
                $green += @($g)
                Write-Host "$Id green: $green"

            }
            if ($g -match 'blue') {
                $g = $g -replace '\D', ''
                $blue += @($g)
                Write-Host "$Id blue: $blue"
            }
        }
        $highestRed = $red | Measure-Object -Maximum | Select-Object -ExpandProperty Maximum
        $highestGreen = $green | Measure-Object -Maximum | Select-Object -ExpandProperty Maximum
        $highestBlue = $blue | Measure-Object -Maximum | Select-Object -ExpandProperty Maximum

        $Power = $highestRed * $highestGreen * $highestBlue
    }
    $array += @($Power)
}

# Sum of array
$array = $array | Measure-Object -Sum | Select-Object -ExpandProperty Sum
Write-Host "Result question 2: $($array)"



