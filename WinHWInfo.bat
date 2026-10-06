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
powershell -NoProfile -Command "$x=Get-CimInstance Win32_ComputerSystem; $os=Get-CimInstance Win32_OperatingSystem; $boot=$os.LastBootUpTime; $uptime=if($boot){$span=(Get-Date)-$boot; ('{0}d {1}h {2}m' -f $span.Days,$span.Hours,$span.Minutes)}else{'Not available'}; $install=if($os.InstallDate){try{$os.InstallDate.ToString('yyyy-MM-dd HH:mm:ss')}catch{'Not available'}}else{'Not available'}; $domain=if($x.PartOfDomain){if($x.Domain){$x.Domain}else{'Not available'}}else{if($x.Workgroup){$x.Workgroup}else{'Not available'}}; Write-Host ('Computer Name : ' + $(if($x.Name){$x.Name}else{'Not available'})); Write-Host ('Manufacturer  : ' + $(if($x.Manufacturer){$x.Manufacturer}else{'Not available'})); Write-Host ('Model         : ' + $(if($x.Model){$x.Model}else{'Not available'})); Write-Host ('System Type   : ' + $(if($x.SystemType){$x.SystemType}else{'Not available'})); Write-Host ('User Name     : ' + $(if($env:USERNAME){$env:USERNAME}else{'Not available'})); Write-Host ('Uptime        : ' + $uptime); Write-Host ('Boot Time     : ' + $(if($boot){$boot.ToString('yyyy-MM-dd HH:mm:ss')}else{'Not available'})); Write-Host ('Install Date  : ' + $install); Write-Host ('Domain/Group  : ' + $domain)"
powershell -NoProfile -Command "$x=Get-CimInstance Win32_ComputerSystemProduct; Write-Host ('System UUID   : ' + $(if($x.UUID){$x.UUID}else{'Not available'}))"
echo.

:: ============================================================================
:: WINDOWS
:: ============================================================================
echo  [ WINDOWS ]
echo  ----------------------------------------------------------------------------
powershell -NoProfile -Command "$x=Get-CimInstance Win32_OperatingSystem; Write-Host ('Edition      : ' + $(if($x.Caption){$x.Caption}else{'Not available'})); Write-Host ('Version      : ' + $(if($x.Version){$x.Version}else{'Not available'})); Write-Host ('Architecture : ' + $(if($x.OSArchitecture){$x.OSArchitecture}else{'Not available'})); Write-Host ('Build        : ' + $(if($x.BuildNumber){$x.BuildNumber}else{'Not available'}))"
echo.

:: ============================================================================
:: BIOS / FIRMWARE
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
powershell -NoProfile -Command "$x=Get-CimInstance Win32_Processor; $arch=switch($x.Architecture){0{'x86'};1{'MIPS'};2{'Alpha'};3{'PowerPC'};5{'ARM'};6{'Itanium'};9{'x64'};12{'ARM64'};default{'Not available'}}; $virt=if($x.VirtualizationFirmwareEnabled -eq $true){'Enabled'}elseif($x.VirtualizationFirmwareEnabled -eq $false){'Disabled'}else{'Not available'}; $base=if($x.MaxClockSpeed){[math]::Round($x.MaxClockSpeed/1000,2).ToString() + ' GHz'}else{'Not available'}; $l2=if($x.L2CacheSize){[math]::Round($x.L2CacheSize/1024,2).ToString() + ' MB'}else{'Not available'}; $l3=if($x.L3CacheSize){[math]::Round($x.L3CacheSize/1024,2).ToString() + ' MB'}else{'Not available'}; Write-Host ('Name           : ' + $(if($x.Name){$x.Name.Trim()}else{'Not available'})); Write-Host ('Manufacturer   : ' + $(if($x.Manufacturer){$x.Manufacturer}else{'Not available'})); Write-Host ('Processor ID   : ' + $(if($x.ProcessorId){$x.ProcessorId}else{'Not available'})); Write-Host ('Architecture   : ' + $arch); Write-Host ('Cores          : ' + $(if($x.NumberOfCores){$x.NumberOfCores}else{'Not available'})); Write-Host ('Threads        : ' + $(if($x.NumberOfLogicalProcessors){$x.NumberOfLogicalProcessors}else{'Not available'})); Write-Host ('Base Speed     : ' + $base); Write-Host ('L2 Cache       : ' + $l2); Write-Host ('L3 Cache       : ' + $l3); Write-Host ('Virtualization : ' + $virt)"
echo.

:: ============================================================================
:: GRAPHICS
:: ============================================================================
echo  [ GRAPHICS ]
echo  ----------------------------------------------------------------------------
powershell -NoProfile -Command "$g=Get-CimInstance Win32_VideoController; if(!$g){Write-Host 'Graphics information not available'}; $i=1; foreach($x in $g){Write-Host ('GPU ' + $i); Write-Host ('  Name         : ' + $(if($x.Name){$x.Name.Trim()}else{'Not available'})); Write-Host ('  Manufacturer : ' + $(if($x.AdapterCompatibility){$x.AdapterCompatibility}else{'Not available'})); Write-Host ('  Driver       : ' + $(if($x.DriverVersion){$x.DriverVersion}else{'Not available'})); Write-Host ('  Driver Date  : ' + $(if($x.DriverDate){try{[Management.ManagementDateTimeConverter]::ToDateTime($x.DriverDate).ToString('yyyy-MM-dd')}catch{'Not available'}}else{'Not available'})); if($x.AdapterRAM){Write-Host ('  Video Memory : ' + [math]::Round($x.AdapterRAM/1GB,2) + ' GB')}else{Write-Host '  Video Memory : Not available'}; Write-Host ('  Resolution   : ' + $(if($x.CurrentHorizontalResolution -and $x.CurrentVerticalResolution){$x.CurrentHorizontalResolution.ToString() + ' x ' + $x.CurrentVerticalResolution.ToString()}else{'Not available'})); Write-Host ('  Refresh Rate : ' + $(if($x.CurrentRefreshRate){$x.CurrentRefreshRate.ToString() + ' Hz'}else{'Not available'})); Write-Host '';$i++}"
echo.

:: ============================================================================
:: MEMORY
:: ============================================================================
echo  [ MEMORY ]
echo  ----------------------------------------------------------------------------
powershell -NoProfile -Command "$m=@(Get-CimInstance Win32_PhysicalMemory); $cs=Get-CimInstance Win32_ComputerSystem; $total=if($cs.TotalPhysicalMemory){[math]::Round($cs.TotalPhysicalMemory/1GB,2).ToString() + ' GB'}else{'Not available'}; $slots=if($m.Count -gt 0){$m.Count.ToString()}else{'0'}; Write-Host ('Total Memory : ' + $total); Write-Host ('Modules Used : ' + $slots); Write-Host ''; if(!$m){Write-Host 'Memory information not available'}; $i=1; foreach($x in $m){$manufacturer=if($x.Manufacturer -and $x.Manufacturer.Trim() -ne ''){$x.Manufacturer.Trim()}else{'Not available'}; $part=if($x.PartNumber -and $x.PartNumber.Trim() -ne ''){$x.PartNumber.Trim()}else{'Not available'}; $serial=if($x.SerialNumber -and $x.SerialNumber.Trim() -ne ''){$x.SerialNumber.Trim()}else{'Not available'}; $speed=if($x.Speed){$x.Speed.ToString() + ' MHz'}else{'Not available'}; $configured=if($x.ConfiguredClockSpeed){$x.ConfiguredClockSpeed.ToString() + ' MHz'}else{'Not available'}; $capacity=if($x.Capacity){[math]::Round($x.Capacity/1GB,2).ToString() + ' GB'}else{'Not available'}; $type=switch($x.SMBIOSMemoryType){20{'DDR'};21{'DDR2'};22{'DDR2 FB-DIMM'};24{'DDR3'};26{'DDR4'};34{'DDR5'};default{'Not available'}}; $form=switch($x.FormFactor){8{'DIMM'};12{'SODIMM'};default{'Not available'}}; Write-Host ('Module ' + $i); Write-Host ('  Manufacturer : ' + $manufacturer); Write-Host ('  Part Number  : ' + $part); Write-Host ('  Serial       : ' + $serial); Write-Host ('  Capacity     : ' + $capacity); Write-Host ('  Speed        : ' + $speed); Write-Host ('  Configured   : ' + $configured); Write-Host ('  Type         : ' + $type); Write-Host ('  Form Factor  : ' + $form); Write-Host '';$i++}"
echo.

:: ============================================================================
:: STORAGE DEVICES
:: ============================================================================
echo  [ STORAGE DEVICES ]
echo  ----------------------------------------------------------------------------
powershell -NoProfile -Command "$d=Get-CimInstance Win32_DiskDrive; if(!$d){Write-Host 'Storage information not available'}; $i=1; foreach($x in $d){Write-Host ('Drive ' + $i); Write-Host ('  Model        : ' + $(if($x.Model){$x.Model.Trim()}else{'Not available'})); Write-Host ('  Serial       : ' + $(if($x.SerialNumber){$x.SerialNumber.Trim()}else{'Not available'})); Write-Host ('  Interface    : ' + $(if($x.InterfaceType){$x.InterfaceType}else{'Not available'})); Write-Host ('  Capacity     : ' + $(if($x.Size){[math]::Round($x.Size/1GB,2).ToString() + ' GB'}else{'Not available'})); Write-Host '';$i++}"
echo.

:: ============================================================================
:: NETWORK ADAPTERS
:: ============================================================================
echo  [ NETWORK ADAPTERS ]
echo  ----------------------------------------------------------------------------
powershell -NoProfile -Command "$n=Get-CimInstance Win32_NetworkAdapterConfiguration -Filter 'IPEnabled=True'; if(!$n){Write-Host 'Network information not available'}; foreach($x in $n){Write-Host ('Adapter      : ' + $(if($x.Description){$x.Description}else{'Not available'})); Write-Host ('MAC Address  : ' + $(if($x.MACAddress){$x.MACAddress}else{'Not available'})); Write-Host ('IP Address   : ' + $(if($x.IPAddress){$x.IPAddress -join ', '}else{'Not available'})); Write-Host ''}"
echo.

:: ============================================================================
:: SECURITY
:: ============================================================================
echo  [ SECURITY ]
echo  ----------------------------------------------------------------------------
powershell -NoProfile -Command "$secure='Not available'; try{$reg=Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\SecureBoot\State' -Name UEFISecureBootEnabled -ErrorAction Stop; if($reg.UEFISecureBootEnabled -eq 1){$secure='Enabled'}elseif($reg.UEFISecureBootEnabled -eq 0){$secure='Disabled'}}catch{}; Write-Host ('Secure Boot       : ' + $secure); $tpm=Get-CimInstance -Namespace 'root\CIMV2\Security\MicrosoftTpm' -ClassName Win32_Tpm -ErrorAction SilentlyContinue; if($tpm){Write-Host 'TPM Present       : Yes'; $version=if($tpm.SpecVersion){$tpm.SpecVersion}else{'Not available'}; Write-Host ('TPM Version       : ' + $version)}else{Write-Host 'TPM Present       : No'; Write-Host 'TPM Version       : Not available'}; $cpu=Get-CimInstance Win32_Processor; $virt=if($cpu.VirtualizationFirmwareEnabled -eq $true){'Enabled'}elseif($cpu.VirtualizationFirmwareEnabled -eq $false){'Disabled'}else{'Not available'}; Write-Host ('Virtualization    : ' + $virt)"
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
