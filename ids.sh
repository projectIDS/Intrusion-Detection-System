#!/bin/bash

# Script for Live capture of network packets and converting them to csv file

echo "./cap.sh -h for help                                                                  "
echo "Dependencies--> dumpcap,tshark,python2.x,python3.x,tenserflow                         "
echo "Capture duration by default is 15sec                                                  "
echo ""
echo "-----------------------------------By Group 10---------------------------------       "
sleep 0.25
echo "|                                                                              |      "
echo "|               =============    ||===                ======                   |      "
sleep 0.25
echo "|                     ||         ||   ==            ==                         |      "
sleep 0.25
echo "|                     ||         ||    ==          ==                          |      "
sleep 0.25
echo "|                     ||         ||     ==          ==                         |      "
sleep 0.25
echo "|                                             ==>     ======                   |      "
sleep 0.25
echo "|                     ||         ||     ==                  ==                 |      "
sleep 0.25
echo "|                     ||         ||    ==                    ==                |      "
sleep 0.25
echo "|                     ||         ||   ==                    ==                 |      "
sleep 0.25
echo "|               =============    ||===                ======                   |      "
sleep 0.25
echo "|                                                                              |"
echo "-------------------------------------------------------------------------------                                               "
echo "                  Starting the Intrusion Detection system in:                                        "

for (( c=5; c>=0; c-- ))
do
	echo -ne "                                         $c\033[K\r"
	sleep 1
done

echo "                      Intrusion Detection System Started:) "

echo "                                               "
echo "                                               "
echo "                                               "
#echo " Insert the duration(in sec) for the packet capture:"
#read duration_time
#echo " Insert the output file name:"
#read output_file
#echo " Insert the features to be extracted from packets:"
#read -a features


while [ true ]
do
	echo "                  Starting the Packet Capture in:                               "

	for (( c=3; c>=0; c-- ))
	do
		echo -ne "                                   $c\033[K\r"
		sleep 1
	done

	echo "=======================>>>>>>>CAPTURE STARTED<<<<<<<<=========================="
	dumpcap -i 1 -P -a duration:10 -w cap1.pcap
	echo "=======================>>>>>>>Packets Captured<<<<<<<<========================="
	echo ""
	echo ""
	echo ""
	echo "---------------------------Converting to csv file------------------------------"
	tshark -T fields -n -r cap1.pcap -E separator=, -e frame.len -e frame.cap_len -e frame.protocols -e eth.type -e ip.version -e ip.hdr_len -e ip.len -e ip.ttl -e ip.proto -e ip.src -e ip.dst -e tcp.srcport -e tcp.dstport -e tcp.len -e tcp.seq -e tcp.seq_raw -e tcp.ack -e tcp.ack_raw -e tcp.flags.ack -e tcp.flags.push -e tcp.flags.syn -e tcp.analysis.bytes_in_flight -e tcp.analysis.push_bytes_sent -e tcp.time_relative -e tcp.time_delta > test2.csv
	echo "----------------------------pcap to csv done-----------------------------------"
	echo ""
	echo ""
	echo ""
	echo "----------------Output written in opt.csv file in directory--------------------"
	echo ""
	echo "====================>>>>>>>>CAPTURE STOPPED<<<<<<<<<==========================="	
	echo ""
	echo ""
	echo ""
	echo ""
	echo "========================Entering Detection Mode================================"
	python3 detection.py 	
	echo "=================>>Attacker IP stored in ip_details.txt file<<================="
	echo ""
	echo ""
	echo ""
	echo ">>>>>>>>>>>>>>>>>>>>>>>>>>Detecting ATTACK or NOT<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"
	echo ""
	echo ""
	echo ""
	python checkAttackerFile.py
	echo "==============================================================================="
	echo ""
	echo ""
	echo ""
	./mitigation.sh
	echo ""
	echo ""
	echo ""
done












