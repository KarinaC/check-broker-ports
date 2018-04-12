#!/bin/bash

####################################################################
# This scripts checks the IP and PORT being use by the kafka brokers
####################################################################

DATE=`date '+%d-%m-%Y %H:%M'`

################
# Scripts begins
################

printf "\n"
echo "################################################"
echo "Checking ip and port for date: $DATE"
echo "################################################"

for n in `seq 0 2`; 
   do 
       printf "\n"
       echo This is the IP and PORT for broker-$n.kafka-prod.mesos
       nslookup -type=A broker-$n.kafka-prod.mesos | grep 'Address: ' | awk -F':' '{print "Ip:  " $2}'
       nslookup -type=SRV _broker-$n._tcp.kafka-prod.mesos | grep service | awk -F' ' '{print "Port: " $6}'
       printf "\n\n"
 done

