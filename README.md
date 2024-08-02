# Hardware Identifiers and Unique Key Generator

This repository contains scripts to retrieve hardware identifiers (BIOS serial number, processor ID, and motherboard serial number) and generate a unique SHA-256 hash based on these identifiers.

## Prerequisites

### Windows
- PowerShell (run as Administrator to ensure access to WMI objects)

### Linux
- `dmidecode` (usually requires root privileges)
- `lscpu`

### macOS
- `ioreg`
- `system_profiler`

## Usage

### Clone the Repository

```bash
git clone https://github.com/jersoncarin/unique-key-gen.git
cd unique-key-gen
```

### Windows

1. **Open PowerShell with Administrator privileges**.

2. **Navigate to the script directory**.

    ```powershell
    cd path\to\unique-key-gen
    ```

3. **Run the PowerShell script**:

    ```powershell
    .\gen-key.ps1
    ```

4. **Output**: The script will output a unique SHA-256 hash based on your hardware identifiers.

### Linux and macOS

1. **Ensure you have the necessary tools** (`dmidecode`, `lscpu` for Linux; `ioreg`, `system_profiler` for macOS).

2. **Open a terminal**.

3. **Navigate to the script directory**:

    ```bash
    cd path/to/unique-key-gen
    ```

4. **Run the Bash script**:

    ```bash
    sudo ./gen-key.sh
    ```

5. **Output**: The script will output a unique SHA-256 hash based on your hardware identifiers.

## Script Details

### Windows (`gen-key.ps1`)

- **Get-HardwareIdentifiers**: Retrieves BIOS serial number, processor ID, and motherboard serial number.
- **New-UniqueKey**: Generates a unique SHA-256 hash based on the hardware identifiers.

### Linux and macOS (`gen-key.sh`)

- **getHardwareIdentifiers**: Retrieves BIOS serial number, processor ID, and motherboard serial number.
- **generateUniqueKey**: Generates a unique SHA-256 hash based on the hardware identifiers.

## Example

### Windows

```powershell
PS C:\path\to\script> .\gen-key.ps1
e99a18c428cb38d5f260853678922e03abd833178bfc1e5763c96f2f2ffcfef3
```

### Linux and macOS

```bash
$ sudo ./gen-key.sh
e99a18c428cb38d5f260853678922e03abd833178bfc1e5763c96f2f2ffcfef3
```

## Contributing

Feel free to fork this repository, create a new branch, and submit a pull request with your improvements.

## License

This project is licensed under the MIT License.
