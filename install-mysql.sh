#!/bin/bash

USERID=$(id -u)

if [$USERID -no 0 ]
then  
    echo "ERROR: please this script this root access"
    exit 1
fi

yum install mysql -y 

if [ $? -no 0 ]
then
    echo "installation of mysql is error"
    exit 1
else
    echo "installation of mysql is success"
fi


yum install postfix -y

if [ $? -no 0 ]
then 
    echo "installation of postfix is error"
    exit 1
else
    echo "installation of postfix is success"
fi
