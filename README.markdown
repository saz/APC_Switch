APC_Switch
==========

Simple script for switching an outlet of an APC Switched PDU on or of using SNMP

Configuration
-------------

Edit the script and change the following variables to fit your requirements:

* host: The hostname or ip address where your APC Switched PDU is listening for SNMP requests.
* community: The write community of your PDU
* snmpVer: The snmp version to use

Usage
-----

apc_switch.sh <outlet> <on|off>

Where:
	outlet: outlet number to switch (e.g. 3)
	on|off: Should the port be turned on or off
