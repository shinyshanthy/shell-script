#!/bin/bash
LOGFILE_DIRECTORY=/tmp
DATE=$(date +%F:%H:%M:%S)
SCRIPT_NAME=$0
LOGFILE=$LOGFILE_DIRECTORY/$SCRIPT_NAME=$DATE.log

R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

DISK_USUAGE=$(df -hT | grep -vE 'tmpfs|Filesystem')
DISK_USUAGE_THRESHOLD=1

while IFS= read line
do 
   usage=$(echo $line | awk '{print $6}' | cut -d % -f1)
   partition=$(echo $line | awk '{print $1}')
    if [ $usage -gt $DISK_USAGE_THRESHOLD ];
    then 
        message+="HIGH DISK USAGE ON $partition: $usage \n"
fi
done <<< $DISK_USAGE
echo -e "message: $message"