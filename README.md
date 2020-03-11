# raspberrygate6_p1.0
Raspberry Gate with IPv6 for Raspberry Guardian. Prototype Version 1.0

## Installation
- RaspberryGate6 manager: raspg-config
```
sh ./install-raspg.sh
```
Finaly, you have to reboot your system.
```
..........
-- done.
Would you like to reboot now? [Y/n]: y
```

- Jool
```
sh ./install-jool.sh
```

## Usage
- raspg-config

This script configures and run RaspberryGate6 with a UI similar to rasp-config.
You can start RaspberryGate6 in the set mode by selecting `Commit` button.

## Configuration
The raspg.conf file is assumed to be located in the same directory as raspg-config.

Parameters (Mode section):
 - `MODE_RG`=\<0-2\> **(M1)** - Specifies the Raspberry Gate operation mode. (default: 2)
 	- **0** Bridge(TBD in this version): This mode use bridging between WAN and LAN.
	- **1** Secure-Bridge(TBD in this version): This mode use bridging between WAN and LAN with FW.
	- **2** Router: This mode use routing.
 - `MODE_IPV4`=\<0-2\> **(M2)** - Specifies the IPv4 operation mode (for router mode). (default: 1)
	- **0** NAT64: This mode dose not use IPv4 (using NAT64/DNS64).
	- **1** DHCP: This mode use DHCP.
	- **2** no-NAT: This mode dose not use NAT (w/o dynamic routing).
 - `MODE_IPV6`=\<0-10\> **(M3)** - Specifies the IPv6 operation mode (for router mode). (default: 2)
	- **0** not-use: This mode dose not use IPv6.
	- **1** SLAAC-only: This mode use only SLAAC (no IPv6 DNS server).
	- **2** SLAAC-RDNSS: This mode use SLAAC with RDNSS option.
	- **3** SLAAC-OFLAG: This mode use SLAAC with stateless DHCPv6.
	- **4** SLAAC-RDNSS-OFLAG: This mode use SLAAC with RDNSS option and stateless DHCPv6.
	- **5** MFLAG: This mode use statefull DHCPv6.
	- **6** RDNSS-MFLAG: This mode use RDNSS option and statefull DHCPv6.
	- **7** SLAAC-RDNSS-MFLAG: This mode use SLAAC with RDNSS option and statefull DHCPv6.
	- **8** SLAAC-RDNSS-MOFLAG: This mode use SLAAC with RDNSS option and statefull DHCPv6 (+o-flag).
	- **9** SLAAC-DHCPv6: This mode use SLAAC and statefull DHCPv6 (no m-flag).
	- **10** RFC8273: This mode use unique prefix per host (RFC 8273). 
 - `MODE_NAT6`=\<0-2\> **(M4)** - Specifies the IPv6 NAT mode (for router mode). (default: 2)
	- **0** no-NAT: This mode dose not use NAT (w/o dynamic routing).
	- **1** NPTv6: This mode use IPv6-to-IPv6 Network Prefix Transration (RFC 6296) (not working in this version).
	- **2** NAPT6: This mode use Network Address Port Transration (IP masquerade for IPv6).

Parameters (WAN section):
 - `WAN_IF`=\<device name\> **(W1)** - Specifies the device name for WAN interface (e.g. eth0/eth1/wlan0/ra0). (default: eth0)
 - `LAST_WANIF`=\<device name\> - This parameter is for script state management. Do not change manually.
 - `WAN_ADDR4`=\<IPv4 address or auto\> **(W2)** - Specifies the IPv4 address on WAN interface (CIDR format). If 'auto', it will be set automatically. (default: auto)
 - `WAN_ADDR6`=\<IPv6 address or auto\> **(W3)** - Specifies the IPv6 address on WAN interface (CIDR format). If 'auto', it will be set automatically. (default: auto)
 - `GW_ADDR4`=\<IPv4 address or auto\> **(W4)** - Specifies the IPv4 address of Default Gateway. If 'auto', it will be set automatically. (default: auto)
 - `GW_ADDR6`=\<IPv6 address or auto\> **(W5)** - Specifies the IPv6 address of Default Gateway. If 'auto', it will be set automatically. (default: auto)

Parameters (LAN section):
 - `LAN_IF`=\<device name\> **(L1)** - Specifies the device name for LAN interface (e.g. eth0/eth1/wlan0/ra0). (default: wlan0)
 - `LAST_LANIF`=\<device name\> - This parameter is for script state management. Do not change manually.
 - `LAN_ADDR4`=\<IPv4 address\> **(L3)** - Specifies the IPv4 address on LAN interface (CIDR format). (default: 192.168.222.1/24)
 - `LAN_ADDR6`=\<IPv6 address\> **(L4)** - Specifies the IPv6 address on LAN interface (CIDR format). (default: fd00:222::1/64)
 - `USE_HOSTAPD`=\<yes or no\> **(L2)** - Switch using hostapd at LAN interface. (default: yes)

Parameters (Service section):
 - `DOMAIN`=\<donain name\> **(S1)** - Specifies the domain name for DHCP service. (default: raspberrygate.local)
 - `DNS_RDNSS_ID`=\<interface id\> **(S2)** - Specifies the interface id of DNS server's IPv6 address for RDNSS option. DNS server's IPv6 address is generated by automatically adding the LAN prefix to this id. (default: 53:1)
 - `DNS_DHCP6_ID`=\<interface id\> **(S3)** - Specifies the interface id of DNS server's IPv6 address for DHCPv6 service. DNS server's IPv6 address is generated by automatically adding the LAN prefix to this id. (default: 53:2)
 - `DHCP4_START`/`DHCP4_END`=\<number\> **(S4)** - Specifies the address range for DHCPv4 address pool. (default: 10 and 100)
	 - address_range=\<LAN prefix4\>.\<DHCP4_START\> - \<LAN prefix\>.\<DHCP4_END\>
 - `DHCP6_START`/`DHCP6_END`=\<number\> **(S5)** - Specifies the address range for DHCPv6 address pool. (default: 546:1 and 546:100)
	 - address_range=\<LAN prefix6\>::\<DHCP6_START\> - \<LAN prefix\>::\<DHCP6_END\>
- `NAT64_PREF`=\<IPv6 prefix\> - Specifies the NAT64 prefix. (default: 64:ff9b::/96)

Parameters (Wireless section):
 - `HOSTAPD_SSID`=\<ssid\> **(A2)** - Specifies SSID for hostapd service. (default: raspg)
 - `HOSTAPD_PASS`=\<password\> **(A2)** - Specifies passphrase for hostapd service. (default: raspberry)
 - `HOSTAPD_CC`=\<country code\> **(A3)** - Specifies country code for hostapd service. (default: JP)
 - `HOSTAPD_MODE`=\<country code\> **(A3)** - Specifies Wi-Fi mode (a/g/n) for hostapd service. (default: g)
 - `HOSTAPD_CH`=\<country code\> **(A3)** - Specifies Wi-Fi channel for hostapd service. (default: 11)

Parameters (Others): These parameters can not be changed via raspg-conf script.
 - `VERBOSE`=\<yes or no\> - If yes, output detailed information from raspg-config script.
 - `BRG_IF`=\<device name\> - Specifies the device name for bridge mode. (default: br0)

## Authors
- **Yoshiaki KITAGUCHI** - [@kitaguch](https://github.com/kitaguch)

See also the list of [contributors](https://github.com/RaspberryGuardian/raspberrygate6_p1.0/graphs/contributors) who participated in this project.

## License
This project is licensed under GNU Lesser General Public License v3.0. - see the [LICENSE](LICENSE) file for details.
