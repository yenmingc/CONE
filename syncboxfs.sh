#!/bin/bash

#Write operation to log file
#echo "$1 $2 $3" >> /root/boxfs.op


if [ $3 == "IN_DELETE" ]; then
	echo "delete remote file"
	rm -f /media/enc_boxfs/$2
fi

if [ $3 == "IN_CLOSE_WRITE" ]; then
	echo "modify remote file"
    openssl enc -e -in $1/$2 -out /media/enc_boxfs/$2 -k <YOUR_KEY> -iv 0 -des-cbc
fi

