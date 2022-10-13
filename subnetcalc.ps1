# Bereken jouw subnets!
# Geschreven door Lukas van Berkom

# Inputs vragen
$ipadres = Read-Host "Wat is het IP?"
$hosts = Read-Host "Hoeveel hosts heb je?"
[int]$startsub = Read-Host "Waar start het subnet?"

# Octets scheiden
$octets = $ipadres.Split(".")
$octet1 = $octets[0]
$octet2 = $octets[1]
$octet3 = $octets[2]
$usableip = $octet1 + "." + $octet2 + "." + $octet3 + "."

# Ranges maken
$r30 = 0..2
$r29 = 3..6
$r28 = 7..14
$r27 = 15..30
$r26 = 31..62
$r25 = 63..126
$r24 = 127..255

# Algemene informatie
Write-Host "---------------------------------------------" -ForegroundColor Red
Write-Host "Deze informatie heb je nodig:" -ForegroundColor Red

# Subnets berekenen
if ($hosts -in $r30) {
    $subend = $startsub + 3
    $startip = [string]$usableip + [string]$startsub
    $endip = [string]$usableip + [string]$subend
    $str = $startip + " tot en met " + $endip
    Write-Host "Subnet: /30" -ForegroundColor Green
    Write-Host $str -ForegroundColor Green
    Write-Host "Subnet mask: 255.255.255.252" -ForegroundColor Green
}
elseif ($hosts -in $r29) {
    $subend = $startsub + 7
    $startip = [string]$usableip + [string]$startsub
    $endip = [string]$usableip + [string]$subend
    $str = $startip + " tot en met " + $endip
    Write-Host "Subnet: /29" -ForegroundColor Green
    Write-Host $str -ForegroundColor Green
    Write-Host "Subnet mask: 255.255.255.248" -ForegroundColor Green
}
elseif ($hosts -in $r28) {
    $subend = $startsub + 15
    $startip = [string]$usableip + [string]$startsub
    $endip = [string]$usableip + [string]$subend
    $str = $startip + " tot en met " + $endip
    Write-Host "Subnet: /28" -ForegroundColor Green
    Write-Host $str -ForegroundColor Green
    Write-Host "Subnet mask: 255.255.255.240" -ForegroundColor Green
}
elseif ($hosts -in $r27) {
    $subend = $startsub + 31
    $startip = [string]$usableip + [string]$startsub
    $endip = [string]$usableip + [string]$subend
    $str = $startip + " tot en met " + $endip
    Write-Host "Subnet: /27" -ForegroundColor Green
    Write-Host $str -ForegroundColor Green
    Write-Host "Subnet mask: 255.255.255.224" -ForegroundColor Green
}
elseif ($hosts -in $r26) {
    $subend = $startsub + 63
    $startip = [string]$usableip + [string]$startsub
    $endip = [string]$usableip + [string]$subend
    $str = $startip + " tot en met " + $endip
    Write-Host "Subnet: /26" -ForegroundColor Green
    Write-Host $str -ForegroundColor Green
    Write-Host "Subnet mask: 255.255.255.192" -ForegroundColor Green
}
elseif ($hosts -in $r25) {
    $subend = $startsub + 127
    $startip = [string]$usableip + [string]$startsub
    $endip = [string]$usableip + [string]$subend
    $str = $startip + " tot en met " + $endip
    Write-Host "Subnet: /25" -ForegroundColor Green
    Write-Host $str -ForegroundColor Green
    Write-Host "Subnet mask: 255.255.255.128" -ForegroundColor Green
}
elseif ($hosts -in $r24) {
    $subend = $startsub + 255
    $startip = [string]$usableip + [string]$startsub
    $endip = [string]$usableip + [string]$subend
    $str = $startip + " tot en met " + $endip
    Write-Host "Subnet: /24" -ForegroundColor Green
    Write-Host $str -ForegroundColor Green
    Write-Host "Subnet mask: 255.255.255.0" -ForegroundColor Green
}
else {
    Write-Host "Dat is geen klasse C adres" -ForegroundColor Red
}

# Doorrekenen met al verzamelde gegevens
:returnpoint do {
    $antwoord = Read-Host -Prompt 'Wil je nog een subnet berekenen? y/n'
    $splitoct = $endip.split(".")
    $endoctet = $splitoct[3]
    if ($antwoord -eq "y") {
        $hosts = Read-Host "Hoeveel hosts heb je?"
        Write-Host "---------------------------------------------" -ForegroundColor Red
        Write-Host "Deze informatie heb je nodig:" -ForegroundColor Red
        if ($hosts -in $r30 -and $subend -lt 256) {
            $subend = [int]$endoctet + 4
            $substart = [int]$endoctet + 1
            $startip = $usableip + [string]$substart 
            $endip = [string]$usableip + [string]$subend
            $str = $startip + " tot en met " + $endip
            if ($subend -gt 255){
                Write-Host "Dit past niet meer binnen het IP plan." -ForegroundColor Magenta
                continue :returnpoint
            }
            Write-Host "Subnet: /30" -ForegroundColor Green
            Write-Host $str -ForegroundColor Green
            Write-Host "Subnet mask: 255.255.255.252" -ForegroundColor Green
        }
        elseif ($hosts -in $r29) {
            $subend = [int]$endoctet + 8
            $substart = [int]$endoctet + 1
            $startip = $usableip + [string]$substart 
            $endip = [string]$usableip + [string]$subend
            $str = $startip + " tot en met " + $endip
            if ($subend -gt 255){
                Write-Host "Dit past niet meer binnen het IP plan." -ForegroundColor Magenta
                continue :returnpoint
            }
            Write-Host "Subnet: /29" -ForegroundColor Green
            Write-Host $str -ForegroundColor Green
            Write-Host "Subnet mask: 255.255.255.248" -ForegroundColor Green
        }
        elseif ($hosts -in $r28) {
            $subend = [int]$endoctet + 16
            $substart = [int]$endoctet + 1
            $startip = $usableip + [string]$substart 
            $endip = [string]$usableip + [string]$subend
            $str = $startip + " tot en met " + $endip
            if ($subend -gt 255){
                Write-Host "Dit past niet meer binnen het IP plan." -ForegroundColor Magenta
                continue :returnpoint
            }
            Write-Host "Subnet: /28" -ForegroundColor Green
            Write-Host $str -ForegroundColor Green
            Write-Host "Subnet mask: 255.255.255.240" -ForegroundColor Green
        }
        elseif ($hosts -in $r27) {
            $subend = [int]$endoctet + 32
            $substart = [int]$endoctet + 1
            $startip = $usableip + [string]$substart 
            $endip = [string]$usableip + [string]$subend
            $str = $startip + " tot en met " + $endip
            if ($subend -gt 255){
                Write-Host "Dit past niet meer binnen het IP plan." -ForegroundColor Magenta
                continue :returnpoint
            }
            Write-Host "Subnet: /27" -ForegroundColor Green
            Write-Host $str -ForegroundColor Green
            Write-Host "Subnet mask: 255.255.255.224" -ForegroundColor Green
        }
        elseif ($hosts -in $r26) {
            $subend = [int]$endoctet + 64
            $substart = [int]$endoctet + 1
            $startip = $usableip + [string]$substart 
            $endip = [string]$usableip + [string]$subend
            $str = $startip + " tot en met " + $endip
            if ($subend -gt 255){
                Write-Host "Dit past niet meer binnen het IP plan." -ForegroundColor Magenta
                continue :returnpoint
            }
            Write-Host "Subnet: /26" -ForegroundColor Green
            Write-Host $str -ForegroundColor Green
            Write-Host "Subnet mask: 255.255.255.192" -ForegroundColor Green
        }
        elseif ($hosts -in $r25) {
            $subend = [int]$endoctet + 128
            $substart = [int]$endoctet + 1
            $startip = $usableip + [string]$substart 
            $endip = [string]$usableip + [string]$subend
            $str = $startip + " tot en met " + $endip
            if ($subend -gt 255){
                Write-Host "Dit past niet meer binnen het IP plan." -ForegroundColor Magenta
                continue :returnpoint
            }
            Write-Host "Subnet: /25" -ForegroundColor Green
            Write-Host $str -ForegroundColor Green
            Write-Host "Subnet mask: 255.255.255.128" -ForegroundColor Green
        }
        elseif ($hosts -in $r24) {
            $subend = [int]$endoctet + 256
            $substart = [int]$endoctet + 1
            $startip = $usableip + [string]$substart 
            $endip = [string]$usableip + [string]$subend
            $str = $startip + " tot en met " + $endip
            if ($subend -gt 255){
                Write-Host "Dit past niet meer binnen het IP plan." -ForegroundColor Magenta
                continue :returnpoint
            }
            Write-Host "Subnet: /24" -ForegroundColor Green
            Write-Host $str -ForegroundColor Green
            Write-Host "Subnet mask: 255.255.255.0" -ForegroundColor Green
        }
        else {
            Write-Host "Dat is geen klasse C adres" -ForegroundColor Red
        }
    }
} until ($antwoord -eq "n")
