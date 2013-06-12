#!/bin/bash -xv
echo "this script will clean up everything"
TESTSUBJECT="apache_solr_core_snapshots-TM"
TESTSUBJECT_ALT="apache_solr_core_snapshots"
SVNNAME="solr"

echo "remove all build class and source files in versions.alt"
rm -rf $experiment_root/$TESTSUBJECT/versions.alt/orig/*

echo "remove all trace results"
./wliu.cleanupTrace.sh

echo "clean up changes"
rm ${experiment_root}/$TESTSUBJECT/changes/*

echo "clean up SVNLOCAL"
rm -rf $HOME/sir/workspace/apache-solr/*

#echo " clean up test plan and test execution scripts" 


