#! /bin/bash

read -p "Enter your username": USERNAME
#echo $USERNAME
read -p "Enter required group": USERGRP
#echo $USERGRP

USER=$(cat /etc/passwd | grep -i $USERNAME | cut -d ":" -f 1)
echo $USER
GROUP=$(cat /etc/group | grep -i $USERGRP | cut -d ":" -f 1)
echo $GROUP
USRGRP=$(cat /etc/group | grep -i $USERGRP | cut -d ":" -f 4)

echo "USERNAME = [$USERNAME]"
echo "USER = [$USER]"

  if [[ $USER == "$USERNAME" &&  $GROUP == "$USERGRP" ]]; then

        echo "======= User found =========="
        echo "Username is : $USER"
        echo "User group is: USRGRP"
        echo "Home directory is :$(cat /etc/passwd | grep -i $USERNAME | cut -d ":" -f 6)"
        echo "FINAL STATUS: USER CONFIGURATION VALID."

  elif [[ "$USER" == "$USERNAME" && "$GROUP" != "$USERGRP" ]]; then
       echo "FINAL STATUS: GROUP MEMBERSHIP REQUIRED."


  else
        echo "User or group not found"

 fi