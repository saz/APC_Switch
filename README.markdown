APC_Switch
==========

Simple script for switching an outlet of an APC Switched PDU on or of using SNMP

Usage
-----

apc_switch.sh <host> <writeCommunity> <outlet> <on|off>

Where:
    host: IP or hostname of your APC Switched PDU
    writeCommunity: name of write community (e.g. private)
	outlet: outlet number to switch (e.g. 3)
	on|off: Should the port be turned on or off
