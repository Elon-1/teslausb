#!/bin/bash -eu

# unmount the archive. Without this, the archive mounts can get into a
# state where the archive is reachable via the network, appears to be
# mounted, but the mount is inoperable and any attempt to access it
# results in a "host is down" message.

log "unmounting $CAM_MOUNT"
if ! umount -f -l "$CAM_MOUNT"
then
  log "unmount failed"
fi