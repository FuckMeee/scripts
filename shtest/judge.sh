#!/bin/bash
[ 23 -gt 22 ] && echo success
if [ -e /zwh/judge.sh ]
then
    echo "存在"
fi

case $1 in
    "1")
        echo "周一"
    ;;
    "2")
        echo "周二"
    ;;
    *)
	echo "晴天"
    ;;
esac
