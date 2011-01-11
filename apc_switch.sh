#!/bin/bash
# Simple script for switching an outlet of an APC Switched PDU on or off using SNMP
# Author: Steffen Zieger <me@saz.sh>
# License: GPLv3
# URL: https://github.com/saz/APC_Switch
# Version: 1.0

host="APC_PDU_IP_ADDRESS"
community="SNMP_WRITE_COMMUNITY_NAME"
snmpVer=1

usage()
{
	echo "Usage: $0 <outlet> <on|off>"
	exit 1
}

if [ $# -ne 2 ]; then
	usage
fi

if [ ! -x `which snmpset` ]; then
	echo "snmpset not found. Exiting!"
	exit 1
fi

outlet=$1
action=$2
cmd="snmpset -v$snmpVer -c $community $host .1.3.6.1.4.1.318.1.1.4.4.2.1.3.$outlet i"

case $action in
	on)	$cmd 1 > /dev/null
		;;

	off)	$cmd 2 > /dev/null
		;;

	*)	usage
		;;
esac
