function Set-Choice-And-Lines([ref]$choice, [ref]$lines, $partial_path) {
    $path = "$($env:userprofile)\$($partial_path)"
    if (![System.IO.File]::Exists($path)) {
        Write-Host "USERPROFILE\$($partial_path) not found."
        return $false
    }

    $lines.Value = Get-Content $path
    if ($lines.Value.Length -lt 2) {
        Write-Host "USERPROFILE\$($partial_path) must contain at least two lines."
        return $false
    }

    # Script Block for left-padding line numbers.
    $sb = {
        param($raw_line_number, $total_lines)
        $a = [Math]::Log10($raw_line_number)
        $b = [Math]::Log10($total_lines)
        $c = [Math]::Floor($a)
        $d = [Math]::Floor($b)
        $e = $d - $c
        $e_spaces = ' ' * $e
        return $e_spaces + $raw_line_number
    }

    # If the function is called without an argument, print the available options.
    if ($null -eq $choice.Value) {
        $i = 1
        foreach ($line in $lines.Value) {
            $line_number_string = & $sb $i $lines.Value.Length
            Write-Host "$line_number_string : $line"
            $i = $i + 1
        }
        return $false
    }

    # Bounds check.
    if ($choice.Value -gt $lines.Value.Length -or $choice.Value -lt 1) {
        Write-Host "Invalid choice."
        return $false
    }

    # If we got to this point, everything's good.
    return $true
}
