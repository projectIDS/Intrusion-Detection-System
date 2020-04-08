while [ true ]
do
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
done
