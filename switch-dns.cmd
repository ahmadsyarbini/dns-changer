@echo off
:: Check for admin privileges
net session >nul 2>&1
if %errorLevel% neq 0 (
    echo Requesting admin privileges...
    powershell -Command "Start-Process '%~f0' -Verb RunAs"
    exit /b 1
)

rem set network name value
set "wifi-name=Wi-Fi"
set "ethernet-name=Ethernet"

Title "dnsservers switch"
echo Press 1 to set to dhcp
echo Press 2 to set to google public
echo Press 3 to set to cloudflare
echo Press 4 to set to adguard 80 percent
echo Press 5 to set to blissdns 94 percent
echo Press 6 to set to doh tiarapp
rem echo Press 6 to set to bancuh 97 precent too much fp
choice /c 123456 /D:1 /T:10 /m "Enter your choice: "
if %errorlevel% == 1 goto dhcp
if %errorlevel% == 2 goto google
if %errorlevel% == 3 goto cloudflare
if %errorlevel% == 4 goto adguard
if %errorlevel% == 5 goto blissdns
if %errorlevel% == 6 goto tiarapp

:dhcp
rem set to dhcp
netsh interface ipv4 set dnsservers "%ethernet-name%" source=dhcp
netsh interface ipv6 set dnsservers "%ethernet-name%" source=dhcp
netsh interface ipv4 set dnsservers "%wifi-name%" source=dhcp
netsh interface ipv6 set dnsservers "%wifi-name%" source=dhcp
ipconfig -flushdns
goto end

:google
rem set to google public
netsh interface ipv4 set dnsservers "%ethernet-name%" static 8.8.8.8
netsh interface ipv4 add dnsservers "%ethernet-name%" 8.8.4.4 index=2
netsh interface ipv6 set dnsservers "%ethernet-name%" static 2001:4860:4860::8888
netsh interface ipv6 add dnsservers "%ethernet-name%" 2001:4860:4860::8844 index=2
netsh interface ipv4 set dnsservers "%wifi-name%" static 8.8.8.8
netsh interface ipv4 add dnsservers "%wifi-name%" 8.8.4.4 index=2
netsh interface ipv6 set dnsservers "%wifi-name%" static 2001:4860:4860::8888
netsh interface ipv6 add dnsservers "%wifi-name%" 2001:4860:4860::8844 index=2
ipconfig -flushdns
goto end

:cloudflare
rem set to cloudflare antimalware
netsh interface ipv4 set dnsservers "%ethernet-name%" static 1.1.1.2
netsh interface ipv4 add dnsservers "%ethernet-name%" 1.0.0.2 index=2
netsh interface ipv6 set dnsservers "%ethernet-name%" static 2606:4700:4700::1112
netsh interface ipv6 add dnsservers "%ethernet-name%" 2606:4700:4700::1002 index=2
netsh interface ipv4 set dnsservers "%wifi-name%" static 1.1.1.2
netsh interface ipv4 add dnsservers "%wifi-name%" 1.0.0.2 index=2
netsh interface ipv6 set dnsservers "%wifi-name%" static 2606:4700:4700::1112
netsh interface ipv6 add dnsservers "%wifi-name%" 2606:4700:4700::1002 index=2
ipconfig -flushdns
goto end

:adguard
rem set to adguard
netsh interface ipv4 set dnsservers "%ethernet-name%" static 94.140.14.14
netsh interface ipv4 add dnsservers "%ethernet-name%" 94.140.15.15 index=2
netsh interface ipv6 set dnsservers "%ethernet-name%" static 2a10:50c0::ad1:ff
netsh interface ipv6 add dnsservers "%ethernet-name%" 2a10:50c0::ad2:ff index=2
netsh interface ipv4 set dnsservers "%wifi-name%" static 94.140.14.14
netsh interface ipv4 add dnsservers "%wifi-name%" 94.140.15.15 index=2
netsh interface ipv6 set dnsservers "%wifi-name%" static 2a10:50c0::ad1:ff
netsh interface ipv6 add dnsservers "%wifi-name%" 2a10:50c0::ad2:ff index=2
ipconfig -flushdns
goto end

:blissdns
rem set to blissdns
netsh interface ipv4 set dnsservers "%ethernet-name%" static 173.255.201.254
netsh interface ipv6 set dnsservers "%ethernet-name%" static 2600:3c00::f03c:93ff:feca:d2be
netsh interface ipv4 set dnsservers "%wifi-name%" static 173.255.201.254
netsh interface ipv6 set dnsservers "%wifi-name%" static 2600:3c00::f03c:93ff:feca:d2be
ipconfig -flushdns
goto end

:tiarapp
rem set to tiarapp
netsh interface ipv4 set dnsservers "%ethernet-name%" static 174.138.21.128
netsh interface ipv4 add dnsservers "%ethernet-name%" 188.166.206.224 index=2
netsh interface ipv6 set dnsservers "%ethernet-name%" static 2400:6180:0:d0::5f6e:4001
netsh interface ipv4 set dnsservers "%wifi-name%" static 174.138.21.128
netsh interface ipv4 add dnsservers "%wifi-name%" 188.166.206.224 index=2
netsh interface ipv6 set dnsservers "%wifi-name%" static 2400:6180:0:d0::5f6e:4001
ipconfig -flushdns
goto end

:end
exit
