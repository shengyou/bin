#!/usr/bin/env bash

# prepare directory
mkdir -p ~/JetBrainsRing/apps
mkdir -p ~/JetBrainsRing/data

# install Hub
wget https://download-cf.jetbrains.com/hub/hub-2018.1.8871.zip
unzip hub-2018.1.8871.zip
mv hub-2018.1.8871 hub
mv hub ~/JetBrainsRing/apps/

# install YouTrack
wget https://download-cf.jetbrains.com/charisma/youtrack-2018.1.40341.zip
unzip youtrack-2018.1.40341.zip
mv youtrack-2018.1.40341 youtrack
mv youtrack ~/JetBrainsRing/apps/

# install Upsource
wget https://download-cf.jetbrains.com/upsource/upsource-2017.3.2888.zip
unzip upsource-2017.3.2888.zip
mv upsource-2017.3.2888 upsource
mv upsource ~/JetBrainsRing/apps/

# install TeamCity
wget https://download-cf.jetbrains.com/teamcity/TeamCity-2017.2.3.tar.gz
tar -zxvf TeamCity-2017.2.3.tar.gz
mv TeamCity teamcity
mv teamcity ~/JetBrainsRing/apps

# cleanup
rm hub-2018.1.8871.zip
rm youtrack-2018.1.40341.zip
rm upsource-2017.3.2888.zip
rm TeamCity-2017.2.3.tar.gz
