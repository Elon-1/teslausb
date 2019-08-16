#!/bin/bash -eu

ap_connections=$(hostapd_cli all_sta | grep dot11RSNAStatsSTAAddress | wc -l)

if [ $ap_connections -ge 1 ]
then
	log "At least one wifi client."
	log "$ap_connections"
	exit 0
	return
fi
log "No wifi clients."
log "$ap_connections"
exit 1
