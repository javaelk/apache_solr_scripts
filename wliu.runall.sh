#!/bin/bash -xv
TESTSUBJECT="jacoco_core_snapshots-TM"

for VER in {0..8}
do

cd $experiment_root/$TESTSUBJECT/scripts/TestScripts
./scriptR${VER}coverage.cls >v$VER.log
mkdir $experiment_root/$TESTSUBJECT/outputs/v$VER
mv $experiment_root/$TESTSUBJECT/outputs/t* $experiment_root/$TESTSUBJECT/outputs/v$VER

done


