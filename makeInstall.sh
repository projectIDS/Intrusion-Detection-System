#!/bin/bash

echo "--> Installing Project IDS on your device <--"
echo "Checking Dependencies..."

sleep 2

whereis gcc | grep '/usr/bin/gcc' &> /dev/null
if [ $? == 0 ]
then
	echo "gcc installed..."
else
	echo "gcc NOT installed"
	exit
fi
sleep 1

whereis libpcap | grep '/usr/lib/' &> /dev/null
if [ $? == 0 ]
then
	echo "libpcap installed..."
else
	echo "libpcap NOT installed"
	exit
fi
sleep 1

whereis zlib | grep '/usr/include/zlib.h' &> /dev/null
if [ $? == 0 ]
then
	echo "Zlib installed..."
else
	echo "Zlib NOT installed"
fi
sleep 1

whereis dumpcap | grep '/usr/bin/dumpcap' &> /dev/null
if [ $? == 0 ]
then
	echo "dumpcap installed..."
else
	echo "dumpcap NOT installed"
	exit
fi
sleep 1

whereis tshark | grep '/usr/bin/tshark' &> /dev/null
if [ $? == 0 ]
then
	echo "tshark installed..."
else
	echo "tshark NOT installed"
	exit
fi
sleep 1

whereis python3 | grep '/usr/bin/python3.7' &> /dev/null
if [ $? == 0 ]
then
	echo "python 3 installed..."
else
	echo "python 3 NOT installed"
	exit
fi
sleep 1

whereis pip3 | grep '/usr/bin/pip3' &> /dev/null
if [ $? == 0 ]
then
	echo "pip 3 installed..."
else
	echo "pip 3 NOT installed"
	exit
fi
sleep 1

pip3 show tensorflow | grep 'Name: tensorflow' &> /dev/null
if [ $? == 0 ]
then
	echo "Tensorflow installed..."
else
	echo "Tensorflow NOT installed"
fi
sleep 1

pip3 show keras | grep 'Name: Keras' &> /dev/null
if [ $? == 0 ]
then
	echo "Keras installed..."
else
	echo "Keras NOT installed"
fi
sleep 2

echo ""
echo "-->Everything Set <--"
sleep 1
echo "--> Ready to Launch IDS <--"
sleep 1
echo "--> Fire ./ids.sh to Launch IDS <--"
