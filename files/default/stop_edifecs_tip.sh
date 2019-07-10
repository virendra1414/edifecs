#!/bin/bash
cd /opt/Edifecs/XEServer/bin/agent
echo | ./stop-agent.sh
/opt/Edifecs/EAM/Server/bin/stopEAMServer.sh
