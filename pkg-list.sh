#!/usr/bin/env sh

BACKUP_FILE=/home/brent/.pacman-installed.txt

echo -e "\n\nAUR installed:\n" >> $BACKUP_FILE
yay -Qm > $BACKUP_FILE

echo -e "\n\nSystem installed:\n" >> $BACKUP_FILE
yay -Qn >> $BACKUP_FILE
