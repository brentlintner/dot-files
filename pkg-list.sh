#/usr/bin/env sh

BACKUP_FILE=/home/brent/.pacman-installed.txt

rm $BACKUP_FILE

trizen --stats > $BACKUP_FILE

echo -e "\n\nAUR installed:\n" >> $BACKUP_FILE
trizen -Qm >> $BACKUP_FILE

echo -e "\n\nSystem installed:\n" >> $BACKUP_FILE
trizen -Qn >> $BACKUP_FILE
