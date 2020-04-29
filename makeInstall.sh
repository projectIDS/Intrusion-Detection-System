#!/bin/bash

echo "--> Installing Project IDS on your device <--"
echo "Checking Dependencies..."

sleep 2

whereis gcc | grep '/usr/bin/gcc' &> /dev/null
if [ $? == 0 ]
then
	echo "gcc is installed..."
else
	echo "gcc NOT installed"
	exit
fi
sleep 1

whereis libpcap | grep '/usr/lib/' &> /dev/null
if [ $? == 0 ]
then
	echo "libpcap is installed..."
else
	echo "libpcap NOT installed"
	exit
fi
sleep 1

whereis zlib | grep '/usr/include/zlib.h' &> /dev/null
if [ $? == 0 ]
then
	echo "Zlib is installed..."
else
	echo "Zlib NOT installed"
	exit
fi
sleep 1

whereis dumpcap | grep '/usr/bin/dumpcap' &> /dev/null
if [ $? == 0 ]
then
	echo "dumpcap is installed..."
else
	echo "dumpcap NOT installed"
	exit
fi
sleep 1

whereis tshark | grep '/usr/bin/tshark' &> /dev/null
if [ $? == 0 ]
then
	echo "tshark is installed..."
else
	echo "tshark NOT installed"
	exit
fi
sleep 1

whereis python2 | grep '/usr/bin/python2.7' &> /dev/null
if [ $? == 0 ]
then
	echo "python is 2 installed..."
else
	echo "python 2 NOT installed"
	exit
fi
sleep 1

whereis python3 | grep '/usr/bin/python3.7' &> /dev/null
if [ $? == 0 ]
then
	echo "python is 3 installed..."
else
	echo "python 3 NOT installed"
	exit
fi
sleep 1

whereis pip | grep '/usr/bin/pip' &> /dev/null
if [ $? == 0 ]
then
	echo "pip is installed..."
else
	echo "pip NOT installed"
	exit
fi
sleep 1


whereis pip3 | grep '/usr/bin/pip3' &> /dev/null
if [ $? == 0 ]
then
	echo "pip 3 is installed..."
else
	echo "pip 3 NOT installed"
	exit
fi
sleep 1

pip3 show tensorflow | grep 'Name: tensorflow' &> /dev/null
if [ $? == 0 ]
then
	echo "Tensorflow is installed..."
else
	echo "Tensorflow NOT installed"
	exit
fi
sleep 1

pip3 show keras | grep 'Name: Keras' &> /dev/null
if [ $? == 0 ]
then
	echo "Keras is installed..."
else
	echo "Keras NOT installed"
	exit
fi
sleep 1

pip3 show pandas | grep 'Name: pandas' &> /dev/null
if [ $? == 0 ]
then
	echo "Pandas is installed..."
else
	echo "Pandas NOT installed"
	exit
fi
sleep 2

echo ""
echo "-->Everything Set <--"
sleep 1
echo "--> Ready to Launch IDS <--"
sleep 1
echo "--> Fire ./ids.sh to Launch IDS <--"
