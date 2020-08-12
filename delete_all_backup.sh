#!/bin/bash
# auto delete all backup tars except the latest

# vars
ReservedNum=1
FILEDIR= # 备份地址
DATE=`date "+%Y%m%d-%H%M%S"`

# Some output options:
clear
echo -e "\033[32m------------------ Delete All Backup Script -------------------\033[0m"
echo -e "Are you sure to delete all the backup files? "
echo -e "\033[32mIf sure, please wait for seconds.\033[0m"
echo -e "\033[31mIf not please presss <ctrl+c>.\033[0m"
sleep 5
echo -e "OK, Deleting..."
sleep 1

# Find the lastest file and don't delete it
FILENUM=`ls -l $FILEDIR | grep ^- | wc -l`

while [ $FILENUM -gt $ReservedNum ]
do
    OLDFILE=`ls -rt $FILEDIR | head -1`
    echo -e "\033[36mFile Name: $OLDFILE \t File date: $DATE. \t Delete File: $OLDFILE\033[0m"
    rm -rf $FILEDIR/$OLDFILE
    let "FILENUM--"
done

# Judge if succeed
if [ $? -eq 0 ]; then
    echo -e "\033[32mDelete Successfully!\033[0m"
else
    echo -e "\033[31mDelete Failed! Please check...\033[0m"
fi
