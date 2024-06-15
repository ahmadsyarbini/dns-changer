@echo off
Title "dnsservers switch"
echo Press 1 to set to cloudflare
echo Press 2 to set to google public
echo Press 3 to set to quad 9
echo Press 4 to set to adguard
echo Press 5 to set to tiarapp
echo Press 6 to reset to dhcp
rem echo Press 5 to set
choice /c:123456 /D:6 /T:10
if errorlevel == 6 goto six
if errorlevel == 5 goto five
if errorlevel == 4 goto four
if errorlevel == 3 goto three
if errorlevel == 2 goto two
if errorlevel == 1 goto one

:six
rem set to dhcp
netsh interface ipv4 set dnsservers "Ethernet" source=dhcp
netsh interface ipv6 set dnsservers "Ethernet" source=dhcp
netsh interface ipv4 set dnsservers "Wi-Fi" source=dhcp
netsh interface ipv6 set dnsservers "Wi-Fi" source=dhcp
ipconfig -flushdns
goto end

:five
rem set to tiarap
netsh interface ipv4 set dnsservers "Ethernet" static 174.138.21.128
netsh interface ipv4 add dnsservers "Ethernet" 188.166.206.224 index=2
netsh interface ipv6 set dnsservers "Ethernet" static 2400:6180:0:d0::5f6e:4001
netsh interface ipv4 set dnsservers "Wi-Fi" static 174.138.21.128
netsh interface ipv4 add dnsservers "Wi-Fi" 188.166.206.224 index=2
netsh interface ipv6 set dnsservers "Wi-Fi" static 2400:6180:0:d0::5f6e:4001
ipconfig -flushdns
goto end

:four
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

:three
rem set to quad 9
netsh interface ipv4 set dnsservers "Ethernet" static 9.9.9.9
netsh interface ipv4 add dnsservers "Ethernet" 149.112.112.112 index=2
netsh interface ipv6 set dnsservers "Ethernet" static 2620:fe::fe
netsh interface ipv6 add dnsservers "Ethernet" 2620:fe::9 index=2
netsh interface ipv4 set dnsservers "Wi-Fi" static 9.9.9.9
netsh interface ipv4 add dnsservers "Wi-Fi" 149.112.112.112 index=2
netsh interface ipv6 set dnsservers "Wi-Fi" static 2620:fe::fe
netsh interface ipv6 add dnsservers "Wi-Fi" 2620:fe::9 index=2
ipconfig -flushdns
goto end

:two
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

:one
rem set to cloudflare
netsh interface ipv4 set dnsservers "Ethernet" static 1.1.1.1
netsh interface ipv4 add dnsservers "Ethernet" 1.0.0.1 index=2
netsh interface ipv6 set dnsservers "Ethernet" static 2606:4700:4700::1111
netsh interface ipv6 add dnsservers "Ethernet" 2606:4700:4700::1001 index=2
netsh interface ipv4 set dnsservers "Wi-Fi" static 1.1.1.1
netsh interface ipv4 add dnsservers "Wi-Fi" 1.0.0.1 index=2
netsh interface ipv6 set dnsservers "Wi-Fi" static 2606:4700:4700::1111
netsh interface ipv6 add dnsservers "Wi-Fi" 2606:4700:4700::1001 index=2
ipconfig -flushdns
goto end

:end
pause
exit