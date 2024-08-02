#!/bin/bash

getHardwareIdentifiers() {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then
        biosSerial=$(sudo dmidecode -s bios-serial-number 2>/dev/null)
        processorId=$(lscpu | grep -i 'serial' | awk '{print $2}')
        motherboardSerial=$(sudo dmidecode -s baseboard-serial-number 2>/dev/null)
        elif [[ "$OSTYPE" == "darwin"* ]]; then
        biosSerial=$(ioreg -l | grep IOPlatformSerialNumber | awk '{print $4}' | tr -d '"')
        processorId=$(sysctl -n machdep.cpu.brand_string | awk '{print $NF}')
        motherboardSerial=$(system_profiler SPHardwareDataType | awk '/Serial Number/ {print $4}')
        elif [[ "$OSTYPE" == "msys"* || "$OSTYPE" == "cygwin"* || "$OSTYPE" == "win32"* ]]; then
        biosSerial=$(wmic bios get serialnumber | awk 'NR==2{print $1}')
        processorId=$(wmic cpu get ProcessorId | awk 'NR==2{print $1}')
        motherboardSerial=$(wmic baseboard get serialnumber | awk 'NR==2{print $1}')
    else
        echo "Unsupported OS: $OSTYPE"
        exit 1
    fi
    
    echo "${biosSerial}-${processorId}-${motherboardSerial}"
}

generateUniqueKey() {
    identifiers=$(getHardwareIdentifiers)
    echo -n "$identifiers" | sha256sum | awk '{print $1}'
}

# Execute the function to get the unique key
generateUniqueKey
