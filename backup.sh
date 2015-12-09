#!/bin/bash
TMP_DIR="/tmp/"
DATE=$(date +"%d-%m-%Y_%H%M")
BKP_FILE="$TMP_DIR/server_backup_$DATE.tar"
BKP_DIRS="/var/www /etc/automysqlbackup"
DROPBOX_UPLOADER=/root/dropbox/dropbox_uploader.sh
tar cf "$BKP_FILE" $BKP_DIRS
gzip "$BKP_FILE"
$DROPBOX_UPLOADER -f /root/dropbox/.dropbox_uploader upload "$BKP_FILE.gz" /vps/server-name-here/
rm -fr "$BKP_FILE.gz"
