#!/bin/bash/

USERID=$(id -u)
#echo "User ID is: $USERID"
R="\e[31m"
G="\e[32m"
N="\e[0m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo "Please run this script with root privileges"
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is..$R FAILED $N"
        exit 1
    else
        echo "$2 is..$G SUCCESS $N"
    fi
}

CHECK_ROOT

# usage : sh 17-loospackage.sh git mysql nginx postfix
for package in $@  # $@ is a special varibale where all arguments are passed to it.
do
    dnf list installed $package

    if [$? - ne 0]
    then
        echo " $package is not installed"
        dnf install $package -y
        VALIDATE $? "installing $package"
    else
        echo "$package in already installed..nothing to do"
    fi
done