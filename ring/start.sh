#!/usr/bin/env bash

~/JetBrainsRing/apps/hub/bin/hub.sh start --no-browser
sleep 2

~/JetBrainsRing/apps/youtrack/bin/youtrack.sh start --no-browser
sleep 2

~/JetBrainsRing/apps/upsource/bin/upsource.sh start
sleep 2

~/JetBrainsRing/apps/teamcity/bin/runAll.sh start
sleep 2
