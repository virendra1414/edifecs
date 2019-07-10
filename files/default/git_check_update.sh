#!/bin/bash
###############################################################################
#
# git-check-updates.sh: Checks if local git repository is up to date 
# Context: the script will be executed every 5 mins by cronjob 
#
#
# usage: /opt/Edifecs/sql_repos/git-check-updates.sh 
#
###############################################################################

#We first ensure we are in the git local repository
cd $1 #/opt/Edifecs/sql_repos/git
#git fetch
#HEADHASH=$(git rev-parse HEAD)
#UPSTREAMHASH=$(git rev-parse master@{upstream})

#if [ "$HEADHASH" != "$UPSTREAMHASH" ]
# then
#   echo -e ${ERROR}Not up to date with origin. Aborting.${NOCOLOR}
#   echo
#   exit 0
#else
#   echo -e ${FINISHED}Current branch is up to date with origin/master.${NOCOLOR}
#fi

if [ $(git fetch -q origin master && git log --oneline master...origin/master | wc -l) -gt 0 ]
then
    #Local not equal with remote, we will run chef-client to execute scripts
    chef-client -r recipe[linux::edifecs_exec_sqlscripts]
fi
