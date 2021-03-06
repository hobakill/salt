#!/bin/bash

# Written by Nicholas W Hobart - 2014 - See LICENSE file for fair-use.
# Version 1.0.4 (12 July 2014)
# Specical thanks to Jeffrey G Thomas for the inspiration.

MAC=$(</sys/class/net/eth0/address) #this will print the MAC of the machine being booted
TEMPLATEMAC="08:00:27:z5:3b:03" #fill this in wth the current MAC address of your base template machine. 
FILE="/root/.minioncheck"
HOSTNAME=`hostname -s`

if [[ "$HOSTNAME" = 'fixme' ]] # you need to change this to the shortname version of your hostname
  then
    echo "This is the template - can't install salt minion on this computer"

elif [[ -f "$FILE" ]]
  then
    echo "$FILE exists proving SaltMinion is on here already. Nothing to see"


elif [[ "$MAC" != "$TEMPLATEMAC" ]] 
  then
    echo "this is not the template - we need to do work"
      sleep 5 #adding this in to try to wait out the vmware customization reboot

      yum install -y http://dl.fedoraproject.org/pub/epel/6/x86_64/epel-release-6-8.noarch.rpm #EPEL should be in the existing template
      yum install -y salt-minion  #installs salt-minion from EPEL
      chkconfig salt-minion on
      printf "schedule:\n" >> /etc/salt/minion
      printf "  highstate:\n" >> /etc/salt/minion
      printf "    function: state.highstate\n" >> /etc/salt/minion
      printf "    minutes: 60\n" >> /etc/salt/minion

      service salt-minion start
      touch /root/.minioncheck #eventually will have to figure out how to make this not try to install on each boot. with this file's existance we can make an if statement to not do the installation of the minion. 

fi
