#!/usr/bin/env sh

BACKUP_FILE=/home/brent/.pacman-installed.txt

echo -e "\n\nAUR installed:\n" >> $BACKUP_FILE
sudo -u brent yay -Qm > $BACKUP_FILE

echo -e "\n\nSystem installed:\n" >> $BACKUP_FILE
sudo -u brent yay -Qn >> $BACKUP_FILE
