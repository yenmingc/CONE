1. copy syncone.sh & syncboxfs.sh to /root/scripts/  and chmod a+x 
2. copy startup.sh to /root/ and chmod a+x
3. incrontab -e
	/media/boxfs IN_DELETE,IN_CLOSE_WRITE /root/scripts/syncboxfs.sh $@ $# $%
	/media/onedrive IN_DELETE,IN_CLOSE_WRITE /root/scripts/syncone.sh $@ $# $%
	/tmp IN_ALL_EVENTS logger "/tmp action for $# file"
4. reboot system
