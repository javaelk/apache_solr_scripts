#!/bin/bash -xv
echo "this script will clean up after test execution"

TESTSUBJECT="apache_solr_core_snapshots-TM"
TESTSUBJECT_ALT="apache_solr_core_snapshots"

echo "remove all trace results"

for VER in {0..8..1}
do
	cd ${experiment_root}/$TESTSUBJECT/traces.alt/CODECOVERAGE/orig
	rm -rf html/v$VER/*
	rm -rf v$VER/*
done

rm ${experiment_root}/$TESTSUBJECT/outputs/*




