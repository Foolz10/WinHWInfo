# WinHWInfo

A lightweight Windows utility for viewing hardware information, system information, security features, and hardware identifiers.

## Features

* System information
* Computer name and model
* User name
* System type and architecture
* System UUID
* System uptime
* Boot time
* Windows installation date
* Domain / workgroup information
* Windows edition, version, and build
* BIOS / firmware information
* BIOS version and release date
* BIOS serial number
* Motherboard information
* Motherboard manufacturer, product, version, and serial number
* CPU information
* CPU manufacturer and Processor ID
* CPU architecture
* CPU cores and threads
* CPU base speed
* CPU cache information
* CPU virtualization status
* GPU information
* GPU manufacturer and driver version
* GPU driver date
* Video memory
* Display resolution and refresh rate
* RAM information
* Total installed memory
* Memory modules
* RAM manufacturer and part number
* RAM serial number
* RAM capacity and speed
* Configured memory speed
* RAM type and form factor
* Storage device information
* Storage model, serial number, interface, and capacity
* Network adapter information
* MAC addresses and IP addresses
* Secure Boot status
* TPM status and version
* Hardware identifiers
* BIOS serial number
* Motherboard serial number
* System UUID
* CPU Processor ID
* Displays `Not available` when information cannot be found

## Requirements

* Windows 10 or Windows 11
* PowerShell
* No additional software required

## Usage

1. Download the latest `WinHWInfo.exe` from the [Releases](../../releases) page.
2. Open `WinHWInfo.exe`.
3. If Windows displays a security warning, press **Run anyway**.
4. Choose **4** from the menu to start the hardware scan.
5. Your hardware and system information will be displayed in the terminal.
6. Scroll through the terminal to view the complete report.

The menu also provides shortcuts to the GitHub profile, repository, and issue tracker.

## Privacy

WinHWInfo runs locally on your computer.

The program does not upload or transmit hardware information to an external server.

Some displayed information, such as serial numbers, UUIDs, and MAC addresses, can uniquely identify your device. Do not publicly share your personal hardware information.

## Notes

Some hardware may not provide certain information to Windows. When this happens, WinHWInfo displays `Not available`.

Hardware information reported by Windows may vary depending on your computer, motherboard, BIOS/firmware, drivers, and hardware configuration.

Security information such as Secure Boot and TPM may also vary depending on system firmware, Windows configuration, and available permissions.

Network information may include both physical and virtual network adapters installed on the system.

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
