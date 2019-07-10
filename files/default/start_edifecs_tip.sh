#!/bin/bash
cd /opt/Edifecs/XEServer/bin
echo | ./start.sh TrackingInfoProcessor
cd /opt/Edifecs/XEServer/bin/agent
echo | ./start-agent.sh
echo | /opt/Edifecs/EAM/Server/bin/startEAMServer.sh
