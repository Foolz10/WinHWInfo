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

## Requirements

* Windows 10 or Windows 11
* PowerShell
* No additional software required

## Usage

1. Download `WinHWInfo.bat`.
2. Double-click the file.
3. The hardware information will appear in the terminal.
4. Scroll through the terminal to view the complete report.

## Privacy

WinHWInfo runs locally on your computer.

The script does not upload or transmit hardware information to an external server.

Some displayed information, such as serial numbers, UUIDs, and MAC addresses, can uniquely identify your device. Do not publicly share your personal output.

## Notes

Some hardware may not provide certain information to Windows. When this happens, WinHWInfo displays `Not available`.
