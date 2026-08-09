#!/bin/bash

read -rp "Please enter username: " USERNAME
read -rp "Please enter group: " GROUP

isUserExist=false
isGroupExist=false

# Check user directly
if getent passwd "$USERNAME" >/dev/null 2>&1; then
    isUserExist=true
fi

# Check group directly
if getent group "$GROUP" >/dev/null 2>&1; then
    isGroupExist=true
fi

if [[ "$isUserExist"  == "false" ]]; then
        echo "Username not found"
elif [[ "$isGroupExist" == "false" ]]; then
        echo "Group not found"
else
        user_home=$(getent passwd "$USERNAME" | cut -d: -f6)
        echo "User Validation Report"
        echo "Username: $USERNAME"
        echo "User home directory: $user_home"
        echo "Group: $GROUP"

        id -nG "$USERNAME" 2>/dev/null | grep -qw "$GROUP" && isMemberOfGroup=true || isMemberOfGroup=false
        if [[ "$isMemberOfGroup" == "false" ]]; then
                echo "FINAL STATUS: GROUP MEMBERSHIP REQUIRED"
        else
                echo "FINAL STATUS: USER CONFIGURATION VALID"
        fi
fi