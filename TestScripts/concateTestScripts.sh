#!/bin/bash -xv
for VER in {0..19}
do
 cat scriptheader.txt > scriptR${VER}coverage.cls
 echo "VER=v$VER" >> scriptR${VER}coverage.cls
 cat scriptR${VER}coverage.tmp >>scriptR${VER}coverage.cls
 chmod +x scriptR${VER}coverage.cls
done
