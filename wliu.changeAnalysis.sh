#!/bin/bash -x

TESTSUBJECT="apache-solr_snapshots-TM"
TESTSUBJECT_ALT="apache-solr_snapshots"
BEAUTIFIEDSRC=${experiment_root}/$TESTSUBJECT/versions.alt
CODEVARIANT="orig"


echo "diff beautified versions" 
cd $experiment_root/$TESTSUBJECT/changes

for VERA in {0..4}
do

	let "VERB=$VERA+1"
	diff --ignore-case --ignore-all-space --ignore-blank-lines --recursive $BEAUTIFIEDSRC/$CODEVARIANT/v$VERA/$TESTSUBJECT_ALT/build/src $BEAUTIFIEDSRC/$CODEVARIANT/v$VERB/$TESTSUBJECT_ALT/build/src |egrep -v "\---|>|<" > changes${CODEVARIANT}v${VERA}${CODEVARIANT}v${VERB}.txt
done


