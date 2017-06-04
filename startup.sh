#!/bin/bash



mkdir -p /media/gdrive
mkdir -p /media/boxfs
mkdir -p /media/dropbox
mkdir -p /media/onedrive
mkdir -p /media/enc_gdrive
mkdir -p /media/enc_boxfs
mkdir -p /media/enc_dropbox
mkdir -p /media/enc_onedrive



touch /var/cache/gdfs.creds
echo "gdrive fuse"
/usr/local/bin/gdfstool mount /var/cache/gdfs.creds /media/enc_gdrive
sleep 5

echo "dropbox fuse"
/root/ff4d/ff4d.py -ap <YOUR_SECRET> /media/enc_dropbox &
sleep 5


echo "boxfs fuse"
/root/boxfs2-master/boxfs -f /root/.boxfs/conf /media/enc_boxfs/
sleep 5

echo "onedrive fuse"
#Debug Only /root/onedrive-fuse-fs/onedrivefs -o direct_io,allow_other,api_cache=False --debug /media/enc_onedrive/ &
/root/onedrive-fuse-fs/onedrivefs -o direct_io,allow_other,api_cache=False /media/enc_onedrive/ &
sleep 5


echo "Mount encfs"
echo "Mount gdrive encfs"
encfs --extpass=/root/scripts/showkey --public /media/enc_gdrive /media/gdrive 
sleep 5
echo "Mount dropbox encfs"
encfs --extpass=/root/scripts/showkey --public /media/enc_dropbox /media/dropbox 
sleep 5

echo "process done"
