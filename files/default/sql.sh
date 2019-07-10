. ~/.bash_profile
array=($(find $1 -iname "*.sql"))
date=`date '+%A_%Y_%m_%d_%H:%M:%S'`
for i in "${array[@]}"
do
 echo exit | sqlplus -v 
 #echo exit | sqlplus edi/H3lloIp\!\@'(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=CERNRDCDEVTESTDB1.NORTHAMERICA.CERNER.NET)(PORT = 1521))(CONNECT_DATA = (SERVER = DEDICATED)(SID = editst1)))'  @$i > /tmp/tmp.log 
 grep "ERROR" /tmp/tmp.log
if [ $? -eq 0 ]
then
echo exit | sqlplus -v 
 #echo ROLLBACK | sqlplus edi/H3lloIp\!\@'(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=CERNRDCDEVTESTDB1.NORTHAMERICA.CERNER.NET)(PORT = 1521))(CONNECT_DATA = (SERVER = DEDICATED)(SID = editst1)))'  >> /tmp/sql_success_$date.log
echo "Following error has been found in file $i" >> /tmp/sql_error_$date.log
 cat /tmp/tmp.log >> /tmp/sql_error_$date.log
 #cat /tmp/tmp.log >> /tmp/error_`date +%Y-%m-%d %H:%M:%S`.log 
 exit 2;
else
 cat /tmp/tmp.log >> /tmp/sql_success_$date.log
fi
done
echo exit | sqlplus -v 
#echo COMMIT | sqlplus edi/H3lloIp\!\@'(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=CERNRDCDEVTESTDB1.NORTHAMERICA.CERNER.NET)(PORT = 1521))(CONNECT_DATA = (SERVER = DEDICATED)(SID = editst1)))' >> /tmp/sql_success_$date.log

if [ $status -eq 0 ]
then
   scriptstatus = "success"
else
  scriptstatus = "error"
fi

echo "Status of script execution: $scriptstatus" | mail -A /tmp/sql_$scriptstatus_$date.log -s "SQL Script Execution Report" 
exit 0
