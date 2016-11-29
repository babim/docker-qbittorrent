#!/bin/sh -e

# value
CONFIGFILE=/config/qBittorrent.conf
# Default configuration file
if [ ! -f $CONFIGFILE ]
then
cat <<EOF>> $CONFIGFILE
[Preferences]
General\Locale=C
WebUI\Enabled=true
Downloads\SavePath=/downloads
Connection\PortRangeMin=6881

[LegalNotice]
Accepted=true

[General]
ported_to_new_savepath_system=true
EOF
fi

# Allow groups to change files.
umask 002

exec "$@"
