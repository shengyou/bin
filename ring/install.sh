#!/usr/bin/env bash

# prepare directory
mkdir -p ~/JetBrainsRing/apps
mkdir -p ~/JetBrainsRing/data

# install Hub
wget https://download-cf.jetbrains.com/hub/hub-2018.2.10527.zip
unzip hub-2018.2.10527.zip
mv hub-2018.2.10527 hub
mv hub ~/JetBrainsRing/apps/

# install YouTrack
wget https://download-cf.jetbrains.com/charisma/youtrack-2018.2.45146.zip
unzip youtrack-2018.2.45146.zip
mv youtrack-2018.2.45146 youtrack
mv youtrack ~/JetBrainsRing/apps/

# install Upsource
wget https://download-cf.jetbrains.com/upsource/upsource-2018.1.584.zip
unzip upsource-2018.1.584.zip
mv upsource-2018.1.584 upsource
mv upsource ~/JetBrainsRing/apps/

# install TeamCity
wget https://download-cf.jetbrains.com/teamcity/TeamCity-2018.1.2.tar.gz
tar -zxvf TeamCity-2018.1.2.tar.gz
mv TeamCity teamcity
mv teamcity ~/JetBrainsRing/apps

# cleanup
rm hub-2018.2.10527.zip
rm youtrack-2018.2.45146.zip
rm upsource-2018.1.584.zip
rm TeamCity-2018.1.2.tar.gz
