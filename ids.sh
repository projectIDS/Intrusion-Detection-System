while [ true ]
do
	echo "=======================>>>>>>>CAPTURE STARTED<<<<<<<<=========================="
	dumpcap -i 1 -P -a duration:10 -w cap1.pcap
	echo "=======================>>>>>>>Packets Captured<<<<<<<<========================="
