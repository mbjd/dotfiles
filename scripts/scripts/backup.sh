#!/bin/bash
# This makes a backup of (almost) the entire ~ path to /Volumes/Daten/backup/home
# It's run automatically every day at 03:00 by a cron job.

out_filename="/Users/balduin/misc/backup-logs/$(date -u +"%Y-%m-%dT%H-%M-%SZ").txt"
touch "$out_filename"

rsync -aE --progress --exclude .Trash --exclude Downloads/transmission --exclude Dropbox --exclude Drive --exclude Pictures/Fotos-Mediathek.photoslibrary --exclude 'Pictures/iPhoto old' --exclude 'Pictures/Upload to Google Photos' /Users/balduin /Volumes/Daten/backup 2>&1 > "$out_filename"

echo Done at $(date -u +"%Y-%m-%dT%H-%M-%SZ") >> "$out_filename"
