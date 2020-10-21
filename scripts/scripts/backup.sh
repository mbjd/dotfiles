#!/bin/bash
# 500G partition auf GDS.FM-Festplatte ist für Backups
# die andere für anderes
sudo rsync -avAX --exclude=.cache /home/balduin/ /mnt/balduin/
date >> /mnt/balduin/lastbackup.txt
