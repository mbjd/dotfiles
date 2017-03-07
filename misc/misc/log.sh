#!/bin/sh

# This is/should be run by a cron job every minute

log_file='/home/balduin/misc/log'

printf '%s,%s,%s\n' $(date +%s) $(/usr/lib/i3blocks/temperature | head -n1 | tr -d '°C') $(/home/balduin/scripts/batt) >> "$log_file"
