#!/bin/bash

USERID=$(id -u)

if [$USERID -no 0 ]
then  
    echo "ERROR: please this script this root access"
    exit 1
fi

yum install mysql -y 