#!/bin/sh

fileDate=`date "+%Y-%m-%d_%H%M%S"`
backupFileName="fintech-media_bak_"$fileDate"-all"
backupPath=/home/jyapp/backup/fintech-media_backup
echo "del backup"
find /home/jyapp/backup/fintech-media_backup -mtime +7 -name "fintech-media_bak_*.tar.gz" -exec rm -rf {} \; &

echo "start backup"
cd /home/jyapp/fintech-media
tar -zcf $backupFileName.tar.gz * --exclude=nohup.out  --exclude=*.tar.gz
mv $backupFileName.tar.gz ${backupPath}

sh /home/jyapp/fintech-media/stop.sh

sleep 6

sh /home/jyapp/fintech-media/start.sh
