#!/usr/bin/env bash

~/JetBrainsRing/apps/hub/bin/hub.sh status
sleep 2

~/JetBrainsRing/apps/youtrack/bin/youtrack.sh status
sleep 2

~/JetBrainsRing/apps/upsource/bin/upsource.sh status
sleep 2

~/JetBrainsRing/apps/teamcity/bin/runAll.sh status
sleep 2
