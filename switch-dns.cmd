@echo off
:: Check for admin privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting admin privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b 1
)
Title "dnsservers switch"
echo Press 1 to set to dhcp
echo Press 2 to set to google public
echo Press 3 to set to adguard
echo Press 4 to set to blissdns
rem choice /c:1234 /D:1 /T:10 yang lama
choice /c 1234 /m "Enter your choice: "
if %errorlevel% == 1 goto dhcp
if %errorlevel% == 2 goto google
if %errorlevel% == 3 goto adguard
if %errorlevel% == 4 goto blissdns

:dhcp
rem set to dhcp
netsh interface ipv4 set dnsservers "Ethernet" source=dhcp
netsh interface ipv6 set dnsservers "Ethernet" source=dhcp
netsh interface ipv4 set dnsservers "Wi-Fi" source=dhcp
netsh interface ipv6 set dnsservers "Wi-Fi" source=dhcp
ipconfig -flushdns
goto end

:google
rem set to google public
netsh interface ipv4 set dnsservers "Ethernet" static 8.8.8.8
netsh interface ipv4 add dnsservers "Ethernet" 8.8.4.4 index=2
netsh interface ipv6 set dnsservers "Ethernet" static 2001:4860:4860::8888
netsh interface ipv6 add dnsservers "Ethernet" 2001:4860:4860::8844 index=2
netsh interface ipv4 set dnsservers "Wi-Fi" static 8.8.8.8
netsh interface ipv4 add dnsservers "Wi-Fi" 8.8.4.4 index=2
netsh interface ipv6 set dnsservers "Wi-Fi" static 2001:4860:4860::8888
netsh interface ipv6 add dnsservers "Wi-Fi" 2001:4860:4860::8844 index=2
ipconfig -flushdns
goto end

:adguard
rem set to adguard
netsh interface ipv4 set dnsservers "Ethernet" static 94.140.14.14
netsh interface ipv4 add dnsservers "Ethernet" 94.140.15.15 index=2
netsh interface ipv6 set dnsservers "Ethernet" static 2a10:50c0::ad1:ff
netsh interface ipv6 add dnsservers "Ethernet" 2a10:50c0::ad2:ff index=2
netsh interface ipv4 set dnsservers "Wi-Fi" static 94.140.14.14
netsh interface ipv4 add dnsservers "Wi-Fi" 94.140.15.15 index=2
netsh interface ipv6 set dnsservers "Wi-Fi" static 2a10:50c0::ad1:ff
netsh interface ipv6 add dnsservers "Wi-Fi" 2a10:50c0::ad2:ff index=2
ipconfig -flushdns
goto end

:blissdns
rem set to blissdns
netsh interface ipv4 set dnsservers "Ethernet" static 173.255.201.254
netsh interface ipv6 set dnsservers "Ethernet" static 2600:3c00::f03c:93ff:feca:d2be
netsh interface ipv4 set dnsservers "Wi-Fi" static 173.255.201.254
netsh interface ipv6 set dnsservers "Wi-Fi" static 2600:3c00::f03c:93ff:feca:d2be
ipconfig -flushdns
goto end

:end
exit
