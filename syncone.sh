#!/bin/bash

#Write operation log to file
#echo "$1 $2 $3" >> /root/onedrive.op


if [ $3 == "IN_DELETE" ]; then
	echo "delete remote file" >> /root/onedrive.op
	rm -rf /media/enc_onedrive/$2
	/usr/local/bin/onedrive-cli rm $2
	echo "onedrive-cli rm $2"
fi

if [ $3 == "IN_CLOSE_WRITE" ]; then
	echo "modify remote file" >> /root/onedrive.op
	openssl enc -e -in $1/$2 -out /media/enc_onedrive/$2 -k <YOUR_KEY> -iv 0 -des-cbc
	/usr/local/bin/onedrive-cli put /media/enc_onedrive/$2
	echo "onedrive-cli put /media/enc_onedrive/$2"  >> /root/onedrive.op
fi

