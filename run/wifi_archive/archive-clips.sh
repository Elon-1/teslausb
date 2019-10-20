#!/bin/bash -eu

log "Setting up hotspot..."

function connectionmonitor {
  while true
  do
    if timeout 5 /root/bin/archive-is-reachable.sh
    then
      log "Sleep for 2"
      sleep 2
    elif timeout 5 /root/bin/archive-is-reachable.sh # try one more time
    then
      log "Sleep for 2"
      sleep 2
    else
      log "connection dead, killing archive-clips"
      # The archive loop might be stuck on an unresponsive server, so kill it hard.
      # (should be no worse than losing power in the middle of an operation)
      kill -9 $1
      return
    fi
  done
}

connectionmonitor $$ &

sleep 360

kill %1

# delete empty directories under SavedClips
rmdir --ignore-fail-on-non-empty "$CAM_MOUNT/TeslaCam/SavedClips"/* || true

log "Done with hotspot."