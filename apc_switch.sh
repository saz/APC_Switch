#!/bin/sh
# Simple script for switching an outlet of an APC Switched PDU on or off using SNMP
# Author: Steffen Zieger <me@saz.sh>
# License: GPLv3
# URL: https://github.com/saz/APC_Switch
# Version: 1.1

usage() {
	echo "Usage: $0 <host> <community> <outlet> <on|off>"
	exit 1
}

if [ $# -ne 4 ]; then
	usage
fi

host="$1"
community="$2"
outlet=$3
action=$4
snmpVer=1

if [ ! -x `which snmpset` ]; then
	echo "snmpset not found. Exiting!"
	exit 1
fi

cmd="snmpset -v$snmpVer -c $community $host .1.3.6.1.4.1.318.1.1.4.4.2.1.3.$outlet i"

case $action in
	on)	$cmd 1 > /dev/null
		;;

	off)	$cmd 2 > /dev/null
		;;

	*)	usage
		;;
esac
