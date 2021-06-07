#!/bin/bash

## Automate the process of salt-master configuration changes

## clearn previous configuration
sudo rm -rf /srv/*

## copy salt content into /srv
sudo cp -R salt /srv

## copy pillar content into /srv/pillar
sudo cp -R pillar /srv/pillar

# copy salt master conf into /etc/salt
sudo cp master /etc/salt

# restart salt master service and check its status
sudo /etc/init.d/salt-master restart
sudo /etc/init.d/salt-master status

