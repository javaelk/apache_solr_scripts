#!/bin/bash -xv
echo "this script will clean up after test execution"

TESTSUBJECT="apache-solr-core-snapshotsAll-TM"
TESTSUBJECT_ALT="apache-solr-core-snapshots"
SVNLOCAL="/media/svn/svn-apache"

echo "remove all trace results"

for VER in {0..17..1}
do
	cd ${experiment_root}/$TESTSUBJECT/traces.alt/CODECOVERAGE/orig
	rm -rf html/v$VER/*
        rm html/*
	rm -rf v$VER/*
        rm ${experiment_root}/$TESTSUBJECT/outputs/v$VER/*
done
        rm ${experiment_root}/$TESTSUBJECT/outputs/*.log





