#!/bin/bash
# auther zephyrlin

BAK_DIR= # 备份地址
BAK_NAME=`date +%Y%m%d`.tar.gz
BAK_CMD="tar zcvf"
MC_DIR= # 游戏地址

clear
echo "------------------ Start Backuping Zephyr Minecraft Server -------------------"

# Judge DIR
if [ ! -f $BAK_DIR$BAK_NAME ]; then
    echo -e "\033[32mCreate file $BAK_NAME...\033[0m"
    sleep 1
else
    echo "\033[31mThis $BAK_NAME is exists...Recover...\033[0m"
    sleep 5
fi

# MineCraft Backup command
cd $MC_DIR
$BAK_CMD $BAK_DIR$BAK_NAME ./ # 文件夹名称 和游戏服务端有关 

# Judge if succeed
if [ $? -eq 0 ]; then
    echo -e "\033[32mThe Minecraft Server Backup Successfully!\033[0m"
else
    echo -e "\033[31mThe Minecraft Server Backup Failed! Please check...\033[0m"
fi
