#!/bin/bash -xv

for a in {3..19..1}
do 
   cp JacocoReport.v0.xml JacocoReport.v$a.xml
done

