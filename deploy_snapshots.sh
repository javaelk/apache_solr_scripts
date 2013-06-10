#!/bin/bash -x
TESTSUBJECT="apache_solr_core_snapshots-TM"
TESTSUBJECT_ALT="apache_solr_core_snapshots"
SVNLOCAL="$HOME/sir/workspace/apache-solr"
SVNNAME="solr"
SVNCHECKOUT=true #set to false when not connection to SVN

echo " this script fetches source from SVN, build and deploy to sir versions.alt directory"
echo " versions has no code change in solr-core will not be deployed to sir versions.alt "

echo "1 === fetch from SVN"

cd $SVNLOCAL

if $SVNCHECKOUT; then

	svn checkout  http://svn.apache.org/repos/asf/lucene/dev/trunk/solr
	svn checkout  http://svn.apache.org/repos/asf/lucene/dev/trunk/lucene

	cd $SVNNAME
	echo "2 === extract version numbers "

	#remove -limit later to see all. 
	svn log --limit 2 | grep "^r[0-9]* |" | sed 's/^r\([0-9]*\).*$/\1/' > ../snapshot_build_hashcode.txt
	cd ..
fi

cd $SVNLOCAL
#b is total number of versions
b=$(more snapshot_build_hashcode.txt | wc -l)
LASTVERSION=0  #this points to the previous version number

#iterate for each version
while read VER
do
	echo "3 === check out version $VER"
	if $SVNCHECKOUT; then
		svn checkout  http://svn.apache.org/repos/asf/lucene/dev/trunk/solr -r $VER trunk-$VER
	fi

	if [ "$LASTVERSION" != 0 ]
             then 
             echo "compare version $LASTVERSION with $VER"
		diff_result=` diff -rbB --brief trunk-$LASTVERSION/core/src/java trunk-$VER/core/src/java `
		echo "$diff_result"
		if [ -z "$diff_result" ]
                     then  #empty means they are the same  
		     echo "version $VER and $LASTVERSION have no code change in core, skip to next version"
		     continue
		fi
	fi
	
        #this VER should be different from LASTVERSION


	let " b -=1 "
	cd trunk-$VER

#checkout a Lucene code match the timestamp of solr revision
#svn checkout http://svn.apache.org/repos/asf/lucene/dev/trunk/lucene -r {2013-06-07T20:53-0400}
        echo "3.5 === parse TIMESTAMP of version $VER"
        echo "TIMESTAMP `svn log -r $VER`"
	TIMESTAMP=`svn log -r $VER | grep "$VER" | sed 's/^r[0-9]* | [a-zA-Z]* | \(.*\)(.*) | .*$/\1/' |sed 's/\([0-9-]*\) \([0-9]*:[0-9]*\):[0-9]* \(.*\) $/{\1T\2\3}/' `
        echo "TIMESTAMP of version $VER is $TIMESTAMP"

        cd ..
        rm -rf lucene
        svn checkout http://svn.apache.org/repos/asf/lucene/dev/trunk/lucene -r $TIMESTAMP
cd lucene
ant package
cd build
mkdir $HOME/sir/workspace/apache-solr/lucenelib
cp ./grouping/lucene-grouping-5.0-SNAPSHOT.jar ../../lucenelib
cp ./join/lucene-join-5.0-SNAPSHOT.jar ../../lucenelib
cp ./benchmark/lucene-benchmark-5.0-SNAPSHOT-javadoc.jar ../../lucenelib
cp ./demo/lucene-demo-5.0-SNAPSHOT.jar ../../lucenelib
cp ./classification/lucene-classification-5.0-SNAPSHOT.jar ../../lucenelib
cp ./misc/lucene-misc-5.0-SNAPSHOT.jar ../../lucenelib
cp ./sandbox/lucene-sandbox-5.0-SNAPSHOT.jar ../../lucenelib
cp ./analysis/phonetic/lucene-analyzers-phonetic-5.0-SNAPSHOT.jar ../../lucenelib
cp ./analysis/icu/lucene-analyzers-icu-5.0-SNAPSHOT.jar ../../lucenelib
cp ./analysis/stempel/lucene-analyzers-stempel-5.0-SNAPSHOT.jar ../../lucenelib
cp ./analysis/common/lucene-analyzers-common-5.0-SNAPSHOT.jar ../../lucenelib
cp ./analysis/uima/lucene-analyzers-uima-5.0-SNAPSHOT.jar ../../lucenelib
cp ./analysis/morfologik/lucene-analyzers-morfologik-5.0-SNAPSHOT.jar ../../lucenelib
cp ./analysis/smartcn/lucene-analyzers-smartcn-5.0-SNAPSHOT.jar ../../lucenelib
cp ./analysis/kuromoji/lucene-analyzers-kuromoji-5.0-SNAPSHOT.jar ../../lucenelib
cp ./core/lucene-core-5.0-SNAPSHOT.jar ../../lucenelib
cp ./memory/lucene-memory-5.0-SNAPSHOT.jar ../../lucenelib
cp ./test-framework/lucene-test-framework-5.0-SNAPSHOT.jar ../../lucenelib
cp ./queryparser/lucene-queryparser-5.0-SNAPSHOT.jar ../../lucenelib
cp ./suggest/lucene-suggest-5.0-SNAPSHOT.jar ../../lucenelib
cp ./highlighter/lucene-highlighter-5.0-SNAPSHOT.jar ../../lucenelib
cp ./queries/lucene-queries-5.0-SNAPSHOT.jar ../../lucenelib
cp ./facet/lucene-facet-5.0-SNAPSHOT.jar ../../lucenelib
cp ./spatial/lucene-spatial-5.0-SNAPSHOT.jar ../../lucenelib
cp ./replicator/lucene-replicator-5.0-SNAPSHOT.jar ../../lucenelib
cp ./codecs/lucene-codecs-5.0-SNAPSHOT.jar ../../lucenelib
cd ../..
	cd trunk-$VER

	echo " 4 === build" 
	if $SVNCHECKOUT; then
	 ant ivy-bootstrap
	 ant compile
	 ant compile-test
	 ant test
	 ant dist
	fi

	echo "5 === beautify" 
       # ~/sir/workspace/astyle/build/gcc/bin/astyle --style=allman --recursive --suffix=none core/*.java

	echo "6 === deploy r$VER to versions.alt directory as v$b"
	mkdir $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b
	mkdir $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT
	mkdir $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
	mkdir $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/build
	mkdir $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/build/classes
	mkdir $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/build/src

	echo " copy binary "
	cp -r build/solr-core $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/build/classes

	echo " copy source - only copy source of core"
	cp -r core $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/build/src
 
        echo "copy libs "
	cp -r ./core/lib/* $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
	cp -r ./core/src/test-files/solr/collection1/lib/* $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
	cp -r ./test-framework/lib/* $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
	cp -r ./solrj/lib/* $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
	cp -r ./contrib/langid/lib/* $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
	cp -r ./contrib/analysis-extras/lib/* $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
	cp -r ./contrib/uima/lib/* $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
	cp -r ./contrib/extraction/lib/* $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
	cp -r ./contrib/velocity/lib/* $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
	cp -r ./contrib/dataimporthandler/lib/* $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
	cp -r ./contrib/clustering/lib/* $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib

	echo " move lucenelib "
	mv ../lucenelib $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT

        echo "copy test files"

	cd ..

#TODO: ideally, generate test plan, test execution scripts right here and run it in the loop.
	LASTVERSION=$VER
done < snapshot_build_hashcode.txt


