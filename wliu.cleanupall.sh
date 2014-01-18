#!/bin/bash -xv
echo "this script will clean up everything"
TESTSUBJECT="apache-solr-core-snapshotsAll-TM"
TESTSUBJECT_ALT="apache-solr-core-snapshots"
SVNLOCAL="/media/svn/svn-apache"

echo "remove all build class and source files in versions.alt"
rm -rf $experiment_root/$TESTSUBJECT/versions.alt/orig/*

echo "remove all trace results"
./wliu.cleanupTrace.sh

echo "clean up changes"
rm ${experiment_root}/$TESTSUBJECT/changes/*

echo "clean up SVNLOCAL"
rm -rf $SVNLOCAL/*

rm $experiment_root/$TESTSUBJECT/scripts/deploy.log

#echo " clean up test plan and test execution scripts" 


