HOME=/home/edifecs
JAVA_HOME=/usr/lib/jvm/jdk1.8.0_131; export JAVA_HOME
ECRootPath=/opt/Edifecs; export ECRootPath
EdifecsSetup=/opt/EdifecsSetup; export EdifecsSetup
EAMRoot=$ECRootPath/EAM; export EAMRoot
XESRoot=$ECRootPath/XEServer; export XESRoot
XERoot=$ECRootPath/XEngine; export XERoot
XEUSER=$XERoot/user-configs; export XEUSER
LD_LIBRARY_PATH=$XERoot/bin; export LD_LIBRARY_PATH
if [ -f /opt/Edifecs/EAM/Server/bin/setEnv.sh ]; then
    . /opt/Edifecs/EAM/Server/bin/setEnv.sh
fi
if [ -f /opt/Edifecs/XEngine/exec/setEnv.sh ]; then
    . /opt/Edifecs/XEngine/exec/setEnv.sh
fi
if [ -f /opt/Edifecs/XEServer/bin/setEnv.sh ]; then
    . /opt/Edifecs/XEServer/bin/setEnv.sh
fi
PATH=$PATH:$HOME/bin:$JAVA_HOME/bin:$XERoot/bin; export PATH
