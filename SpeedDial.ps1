. "$($PSScriptRoot)\SetChoiceAndLines.ps1"

function Invoke-Cd-On-X {
    $choice = $args[0]
    $lines = $null
    if (!(Set-Choice-And-Lines ([ref]$choice) ([ref]$lines) `
        "SpeedDialFiles\Cd.txt")) {
        return
    }
    Set-Location $lines[($choice - 1)]
}

function Invoke-Start-On-X {
    $choice = $args[0]
    $lines = $null
    if (!(Set-Choice-And-Lines ([ref]$choice) ([ref]$lines) `
        "SpeedDialFiles\Start.txt")) {
        return
    }
    Start-Process $lines[$choice - 1]
}

function Invoke-Vim-On-X {
    $choice = $args[0]
    $lines = $null
    if (!(Set-Choice-And-Lines ([ref]$choice) ([ref]$lines) `
        "SpeedDialFiles\Vim.txt")) {
        return
    }
    vim $lines[$choice - 1]
}

function Invoke-Icm-On-X {
    $choice = $args[0]
    $lines = $null
    if (!(Set-Choice-And-Lines ([ref]$choice) ([ref]$lines) `
        "SpeedDialFiles\Icm.txt")) {
        return
    }
    Invoke-Command -ScriptBlock ([scriptblock]::Create($lines[$choice - 1]))
}
