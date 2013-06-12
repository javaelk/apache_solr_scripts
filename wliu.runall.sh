#!/bin/bash -xv
TESTSUBJECT="apache_solr_core_snapshots-TM"
SVNLOCAL="/home/wliu/sir/workspace/apache-solr"
b=0
for VER in 1487914 1487976 1488349 1488365 1488431 1489081 1489138 1489222 1489676 1489914 1490782 1490889 1490971 1491031 1491102 1491310 1491446 1491449 1491459 1491470
	do
	cd $SVNLOCAL/trunk-$VER
	$experiment_root/$TESTSUBJECT/scripts/TestScripts/scriptR${b}coverage.cls >$experiment_root/$TESTSUBJECT/outputs/v$b.log 2>&1
	let " b +=1 " 
	cd ..
done



