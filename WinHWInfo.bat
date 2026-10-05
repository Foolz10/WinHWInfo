@echo off
setlocal EnableExtensions
title WinHWInfo
color 07

:: ============================================================================
:: CONSOLE SETTINGS
:: ============================================================================

powershell -NoProfile -Command "$host.UI.RawUI.BufferSize = New-Object Management.Automation.Host.Size(100,3000); $host.UI.RawUI.WindowSize = New-Object Management.Automation.Host.Size(100,40)"

:MENU
cls

echo.
echo  ============================================================================
echo                              WinHWInfo
echo  ============================================================================
echo.
echo  Created by Foolz10
echo  GitHub: https://github.com/Foolz10
echo.
echo  A lightweight Windows utility for viewing hardware information
echo  and system identifiers.
echo.
echo  ============================================================================
echo.
echo  [1] GitHub Profile
echo  [2] WinHWInfo Repository
echo  [3] Report an Issue / Request a Feature
echo  [4] Continue to Hardware Information
echo.
echo  ============================================================================

choice /C 1234 /N /M "Select an option: "

if errorlevel 4 goto HARDWARE
if errorlevel 3 start "" "https://github.com/Foolz10/WinHWInfo/issues" & goto MENU
if errorlevel 2 start "" "https://github.com/Foolz10/WinHWInfo" & goto MENU
if errorlevel 1 start "" "https://github.com/Foolz10" & goto MENU


:: ============================================================================
:: HARDWARE INFORMATION
:: ============================================================================

:HARDWARE

cls

echo.
echo  ============================================================================
echo                              WinHWInfo
echo  ============================================================================
echo.
echo  Created by Foolz10
echo  GitHub: https://github.com/Foolz10
echo.
echo  Computer hardware, system information and hardware identifiers
echo.
echo  ============================================================================


:: ============================================================================
:: SYSTEM
:: ============================================================================

echo.
echo  [ SYSTEM ]
echo  ----------------------------------------------------------------------------

powershell -NoProfile -Command "$x=Get-CimInstance Win32_ComputerSystem; Write-Host ('Manufacturer : ' + $(if($x.Manufacturer){$x.Manufacturer}else{'Not available'})); Write-Host ('Model        : ' + $(if($x.Model){$x.Model}else{'Not available'})); Write-Host ('System Type  : ' + $(if($x.SystemType){$x.SystemType}else{'Not available'}))"

powershell -NoProfile -Command "$x=Get-CimInstance Win32_ComputerSystemProduct; Write-Host ('System UUID  : ' + $(if($x.UUID){$x.UUID}else{'Not available'}))"

echo.


:: ============================================================================
:: WINDOWS
:: ============================================================================

echo  [ WINDOWS ]
echo  ----------------------------------------------------------------------------

powershell -NoProfile -Command "$x=Get-CimInstance Win32_OperatingSystem; Write-Host ('Edition      : ' + $(if($x.Caption){$x.Caption}else{'Not available'})); Write-Host ('Version      : ' + $(if($x.Version){$x.Version}else{'Not available'})); Write-Host ('Architecture : ' + $(if($x.OSArchitecture){$x.OSArchitecture}else{'Not available'})); Write-Host ('Build        : ' + $(if($x.BuildNumber){$x.BuildNumber}else{'Not available'}))"

echo.


:: ============================================================================
:: BIOS
:: ============================================================================

echo  [ BIOS / FIRMWARE ]
echo  ----------------------------------------------------------------------------

powershell -NoProfile -Command "$x=Get-CimInstance Win32_BIOS; Write-Host ('Manufacturer : ' + $(if($x.Manufacturer){$x.Manufacturer}else{'Not available'})); Write-Host ('Version      : ' + $(if($x.SMBIOSBIOSVersion){$x.SMBIOSBIOSVersion}else{'Not available'})); if($x.ReleaseDate){try{Write-Host ('Release Date : ' + $x.ReleaseDate.ToString('yyyy-MM-dd'))}catch{Write-Host 'Release Date : Not available'}}else{Write-Host 'Release Date : Not available'}; Write-Host ('Serial       : ' + $(if($x.SerialNumber){$x.SerialNumber}else{'Not available'}))"

echo.


:: ============================================================================
:: MOTHERBOARD
:: ============================================================================

echo  [ MOTHERBOARD ]
echo  ----------------------------------------------------------------------------

powershell -NoProfile -Command "$x=Get-CimInstance Win32_BaseBoard; Write-Host ('Manufacturer : ' + $(if($x.Manufacturer){$x.Manufacturer}else{'Not available'})); Write-Host ('Product      : ' + $(if($x.Product){$x.Product}else{'Not available'})); Write-Host ('Version      : ' + $(if($x.Version){$x.Version}else{'Not available'})); Write-Host ('Serial       : ' + $(if($x.SerialNumber){$x.SerialNumber}else{'Not available'}))"

echo.


:: ============================================================================
:: PROCESSOR
:: ============================================================================

echo  [ PROCESSOR ]
echo  ----------------------------------------------------------------------------

powershell -NoProfile -Command "$x=Get-CimInstance Win32_Processor; Write-Host ('Name         : ' + $(if($x.Name){$x.Name}else{'Not available'})); Write-Host ('Processor ID : ' + $(if($x.ProcessorId){$x.ProcessorId}else{'Not available'})); Write-Host ('Cores        : ' + $(if($x.NumberOfCores){$x.NumberOfCores}else{'Not available'})); Write-Host ('Threads      : ' + $(if($x.NumberOfLogicalProcessors){$x.NumberOfLogicalProcessors}else{'Not available'})); Write-Host ('Max Speed    : ' + $(if($x.MaxClockSpeed){$x.MaxClockSpeed.ToString() + ' MHz'}else{'Not available'}))"

echo.


:: ============================================================================
:: GRAPHICS
:: ============================================================================

echo  [ GRAPHICS ]
echo  ----------------------------------------------------------------------------

powershell -NoProfile -Command "$g=Get-CimInstance Win32_VideoController; foreach($x in $g){Write-Host ('GPU          : ' + $(if($x.Name){$x.Name}else{'Not available'})); Write-Host ('Driver       : ' + $(if($x.DriverVersion){$x.DriverVersion}else{'Not available'})); if($x.AdapterRAM){Write-Host ('Video Memory : ' + [math]::Round($x.AdapterRAM/1GB,2) + ' GB')}else{Write-Host 'Video Memory : Not available'}; Write-Host ''}"

echo.


:: ============================================================================
:: MEMORY
:: ============================================================================

echo  [ MEMORY ]
echo  ----------------------------------------------------------------------------

powershell -NoProfile -Command "$m=Get-CimInstance Win32_PhysicalMemory; if(!$m){Write-Host 'Memory information not available'}; $i=1; foreach($x in $m){Write-Host ('Module ' + $i); Write-Host ('  Manufacturer : ' + $(if($x.Manufacturer){$x.Manufacturer}else{'Not available'})); Write-Host ('  Part Number  : ' + $(if($x.PartNumber){$x.PartNumber.Trim()}else{'Not available'})); Write-Host ('  Serial       : ' + $(if($x.SerialNumber){$x.SerialNumber.Trim()}else{'Not available'})); Write-Host ('  Capacity     : ' + $(if($x.Capacity){[math]::Round($x.Capacity/1GB,2).ToString() + ' GB'}else{'Not available'})); Write-Host '';$i++}"

echo.


:: ============================================================================
:: STORAGE
:: ============================================================================

echo  [ STORAGE DEVICES ]
echo  ----------------------------------------------------------------------------

powershell -NoProfile -Command "$d=Get-CimInstance Win32_DiskDrive; if(!$d){Write-Host 'Storage information not available'}; $i=1; foreach($x in $d){Write-Host ('Drive ' + $i); Write-Host ('  Model        : ' + $(if($x.Model){$x.Model.Trim()}else{'Not available'})); Write-Host ('  Serial       : ' + $(if($x.SerialNumber){$x.SerialNumber.Trim()}else{'Not available'})); Write-Host ('  Interface    : ' + $(if($x.InterfaceType){$x.InterfaceType}else{'Not available'})); Write-Host ('  Capacity     : ' + $(if($x.Size){[math]::Round($x.Size/1GB,2).ToString() + ' GB'}else{'Not available'})); Write-Host '';$i++}"

echo.


:: ============================================================================
:: NETWORK
:: ============================================================================

echo  [ NETWORK ADAPTERS ]
echo  ----------------------------------------------------------------------------

powershell -NoProfile -Command "$n=Get-CimInstance Win32_NetworkAdapterConfiguration -Filter 'IPEnabled=True'; if(!$n){Write-Host 'Network information not available'}; foreach($x in $n){Write-Host ('Adapter      : ' + $(if($x.Description){$x.Description}else{'Not available'})); Write-Host ('MAC Address  : ' + $(if($x.MACAddress){$x.MACAddress}else{'Not available'})); Write-Host ('IP Address   : ' + $(if($x.IPAddress){$x.IPAddress -join ', '}else{'Not available'})); Write-Host ''}"

echo.


:: ============================================================================
:: HARDWARE IDENTIFIERS
:: ============================================================================

echo  [ HARDWARE IDENTIFIERS ]
echo  ----------------------------------------------------------------------------

powershell -NoProfile -Command "$x=Get-CimInstance Win32_BIOS; Write-Host ('BIOS Serial        : ' + $(if($x.SerialNumber){$x.SerialNumber}else{'Not available'}))"

powershell -NoProfile -Command "$x=Get-CimInstance Win32_BaseBoard; Write-Host ('Motherboard Serial : ' + $(if($x.SerialNumber){$x.SerialNumber}else{'Not available'}))"

powershell -NoProfile -Command "$x=Get-CimInstance Win32_ComputerSystemProduct; Write-Host ('System UUID        : ' + $(if($x.UUID){$x.UUID}else{'Not available'}))"

powershell -NoProfile -Command "$x=Get-CimInstance Win32_Processor; Write-Host ('CPU Processor ID    : ' + $(if($x.ProcessorId){$x.ProcessorId}else{'Not available'}))"

echo.


:: ============================================================================
:: COMPLETE
:: ============================================================================

echo  ============================================================================
echo                         INFORMATION COMPLETE
echo  ============================================================================
echo.
echo  Created by Foolz10
echo  GitHub: https://github.com/Foolz10
echo.
echo  Report issues or request features:
echo  https://github.com/Foolz10/WinHWInfo/issues
echo.
echo  You can scroll through the information above.
echo.
pause

endlocal