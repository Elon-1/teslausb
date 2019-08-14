#!/bin/bash -eu

ap_connections=$(hostapd_cli all_sta | wc -l)

if [ "$ap_connections" > 1 ]
then
	exit 0
	return
fi
exit 1
