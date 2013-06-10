#!/bin/bash -xv
echo "this script will clean up everything"

TESTSUBJECT="apache-solr_snapshots-TM"
TESTSUBJECT_ALT="apache-solr_snapshots"
SVNNAME="solr"

echo "remove all build class and source files in versions.alt"
echo "remove all trace results"

rm -rf $experiment_root/$TESTSUBJECT/versions.alt/orig/*

for VER in {0..5..1}
do

	rm -rf ${experiment_root}/$TESTSUBJECT/traces.alt/CODECOVERAGE/orig/html/v$VER/*
	rm -rf${experiment_root}/$TESTSUBJECT/traces.alt/CODECOVERAGE/orig/v$VER/*
done

echo "clean up outputs"
rm -rf ${experiment_root}/$TESTSUBJECT/outputs/*
rm ${experiment_root}/$TESTSUBJECT/changes/*
rm -rf $HOME/sir/workspace/apache-solr/*





