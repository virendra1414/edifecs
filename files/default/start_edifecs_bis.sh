#!/bin/bash
cd /opt/Edifecs/TM/BIService/classes/
(./run_task_manager.sh > $HOME/bin/start.log 2>&1 &) &
echo | /opt/Edifecs/EAM/Server/bin/startEAMServer.sh
