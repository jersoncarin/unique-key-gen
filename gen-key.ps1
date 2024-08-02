function Get-HardwareIdentifiers {
    $biosSerial = (Get-WmiObject -Query "Select SerialNumber from Win32_BIOS").SerialNumber
    $processorId = (Get-WmiObject -Query "Select ProcessorId from Win32_Processor").ProcessorId
    $motherboardSerial = (Get-WmiObject -Query "Select SerialNumber from Win32_BaseBoard").SerialNumber

    return "$biosSerial-$processorId-$motherboardSerial"
}

function New-UniqueKey {
    $identifiers = Get-HardwareIdentifiers
    $hash = [System.BitConverter]::ToString((New-Object Security.Cryptography.SHA256Managed).ComputeHash([System.Text.Encoding]::UTF8.GetBytes($identifiers))).Replace("-", "").ToLower()
    return $hash
}

# Execute the function to get the unique key
New-UniqueKey
