#! /bin/bash

NAME=$1
PASSWORD=$2
STATE=$3
SHOW=$4


if [ "$SHOW" == "true" ]; then
    echo "Hello $NAME,You are from $STATE. Here is your password as plain text : $PASSWORD"
else
    echo "Hello $NAME, You are from $STATE. Your password is hidden. To see your entered password, check the SHOW button"
fi

