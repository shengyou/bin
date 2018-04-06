#!/usr/bin/env bash

~/JetBrainsRing/apps/teamcity/bin/runAll.sh stop
sleep 3

~/JetBrainsRing/apps/upsource/bin/upsource.sh stop
sleep 5

~/JetBrainsRing/apps/youtrack/bin/youtrack.sh stop
sleep 3

~/JetBrainsRing/apps/hub/bin/hub.sh stop
sleep 2
