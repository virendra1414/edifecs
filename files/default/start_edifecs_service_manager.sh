#!/bin/bash
cd /opt/Edifecs/TM/ServiceManager/classes/
(./run_task_manager.sh > $HOME/bin/start.log 2>&1 &) &

cd /opt/Edifecs/XEServer/bin
echo | ./start.sh TM
echo | ./start.sh TM_Search_Service
echo | ./start.sh TM_Search_IndexerGBD
echo | ./start.sh MemberCorrelation

echo | /opt/Edifecs/EAM/Server/bin/startEAMServer.sh
