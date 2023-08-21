#!/bin/bash
APP_LOGS_DIR=/home/centos/app-logs
 DATE=$(DATE +%F:%H:%M:%S)
 LOGDIR=/home/centos/shell-script-logs

 SCRIPT_NAME=$0
 LOGFILE=$LOGDIR/$0-$DATE.log

 FILES_TO_DELETE=$(find $APP_LOGS_DIR -name "*.log" -type f -ntime +14)

 echo "script started executing at $DATE"

 while read line
 do     
    echo "Deleting $line" &>> $LOGFILE
    rm -rf $line
done <<< $FILES_TO_DELETE

