#!/bin/bash
cd /opt/Edifecs/TM/ETLBATCH/classes/
./stop_task_manager.sh
cd /opt/Edifecs/TM/ETLResubmission/classes/
./stop_task_manager.sh
/opt/Edifecs/EAM/Server/bin/stopEAMServer.sh
