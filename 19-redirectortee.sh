#!/bin/bash/

LOGS_FOLDER="/var/log/shell-script"
SCRIPT_NAME=$(echo $0 | cut -d "." -f1)
TIMESTAMP=$(date +%y-%m-%d-%H-%M-%S)
LOG_FILE="$LOGS_FOLDER/$SCRIPT_NAME-$TIMESTAMP.log"
mkdir -p $LOGS_FOLDER

USERID=$(id -u) #echo "User ID is: $USERID"
R="\e[31m"
G="\e[32m"
N="\e[0m"
Y="\e[33m"

CHECK_ROOT(){
    if [ $USERID -ne 0 ]
    then
        echo -e "$R Please run this script with root privileges $N" &>>$LOG_FILE | tee -a $LOG_FILE
        exit 1
    fi
}

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$2 is..$R FAILED $N" &>>$LOG_FILE | tee -a $LOG_FILE
        exit 1
    else
        echo "$2 is..$G SUCCESS $N" &>>$LOG_FILE | tee -a $LOG_FILE
    fi
}

USAGE(){
    echo -e "$R USAGE:: $N sudo sh 18-redirectors.sh package1 package2 ..." | tee -a $LOG_FILE
    exit 1
}

echo "Script started executing at: $(date)" &>>$LOG_FILE | tee -a $LOG_FILE

CHECK_ROOT

if [ $# -eq 0 ]
then
    USAGE
fi

for package in $@    # $@ is a special varibale where all arguments are passed to it.
do
    dnf list installed $package &>>$LOG_FILE | tee -a $LOG_FILE
    if [ $? -ne 0 ]
    then
        echo " $package is not installed, going to install it.." &>>$LOG_FILE | tee -a $LOG_FILE
        dnf install $package -y &>>$LOG_FILE
        VALIDATE $? "installing $package"
    else
        echo -e "$package $Y in already installed..nothing to do $N" &>>$LOG_FILE | tee -a $LOG_FILE
    fi
done