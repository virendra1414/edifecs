#!/bin/bash
cd /opt/Edifecs/TM/ServiceManager/classes/
./stop_task_manager.sh

cd /opt/Edifecs/XEServer/bin
echo | ./stop.sh TM
echo | ./stop.sh TM_Search_Service
echo | ./stop.sh TM_Search_IndexerGBD
echo | ./stop.sh MemberCorrelation
/opt/Edifecs/XEServer/bin/shutdown_all_profiles.sh
/opt/Edifecs/EAM/Server/bin/stopEAMServer.sh
