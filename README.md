# WinHWInfo

A lightweight Windows utility for viewing hardware information and system identifiers.

## Features

* System information
* Windows version and build
* BIOS / firmware information
* Motherboard information
* CPU information
* GPU information
* RAM information
* Storage information
* Network adapter information
* Hardware identifiers
* System UUID
* BIOS and motherboard serial numbers
* Displays `Not available` when information cannot be found

## Requirements

* Windows 10 or Windows 11
* PowerShell
* No additional software required

## Usage

1. Download the latest `WinHWInfo.exe` from the [Releases](../../releases) page.
2. Open `WinHWInfo.exe`.
3. If Windows displays a security warning, allow it to run if you trust the file.
4. Choose **4** from the menu to start the hardware scan.
5. Your hardware information will be displayed in the terminal.
6. Scroll through the terminal to view the complete report.

The menu also provides shortcuts to the GitHub profile, repository, and issue tracker.

## Privacy

WinHWInfo runs locally on your computer.

The program does not upload or transmit hardware information to an external server.

Some displayed information, such as serial numbers, UUIDs, and MAC addresses, can uniquely identify your device. Do not publicly share your personal hardware information.

## Notes

Some hardware may not provide certain information to Windows. When this happens, WinHWInfo displays `Not available`.

Hardware information reported by Windows may vary depending on your computer, motherboard, BIOS/firmware, drivers, and hardware configuration.

## Source Code

The source code for WinHWInfo is available on GitHub:

https://github.com/Foolz10/WinHWInfo

## Issues & Feature Requests

Found a problem or have an idea for WinHWInfo?

Open an issue or feature request:

https://github.com/Foolz10/WinHWInfo/issues

## License

WinHWInfo is licensed under the **MIT License**.

See the `LICENSE` file for the full license text.

## Credit

You can modify and build on WinHWInfo under the terms of the MIT License. If you redistribute or build upon the project, please consider giving credit to **Foolz10** and linking back to the original repository.
