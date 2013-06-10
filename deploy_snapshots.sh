#!/bin/bash -x
TESTSUBJECT="apache_solr_core_snapshots-TM"
TESTSUBJECT_ALT="apache_solr_core_snapshots"
SVNNAME="solr"
SVNCHECKOUT=false

echo " this script fetches source from SVN, build and deploy to sir versions.alt directory"
echo "fetch from SVN" 
read pause
cd $HOME/sir/workspace/apache-solr

if $SVNCHECKOUT; then

svn checkout  http://svn.apache.org/repos/asf/lucene/dev/trunk/solr
svn checkout  http://svn.apache.org/repos/asf/lucene/dev/trunk/lucene

#Most of the time, you will start using a Subversion repository by performing a checkout of your project. Checking out a directory
#from a repository creates a working copy of that directory on your local machine. Unless otherwise specified, this copy contains
#the youngest (that is, most recently created or modified) versions of the directory and its children found in the Subversion reposit-
#ory:
cd $SVNNAME
ls

echo "extract version numbers "

#remove -limit later to see all. 
svn log --limit 2 | grep "^r[0-9]* |" | sed 's/^r\([0-9]*\).*$/\1/' > ../snapshot_build_hashcode.txt
cd ..
fi

read pause
cd $HOME/sir/workspace/apache-solr
#b is total number of versions
b=$(more snapshot_build_hashcode.txt | wc -l)
LASTVERSION=0  #this is to point to the previous version number

while read VER
do
	let " b -=1 "

	echo "check out version $VER"
	if $SVNCHECKOUT; then
	svn checkout  http://svn.apache.org/repos/asf/lucene/dev/trunk/solr -r $VER trunk-$VER
	fi

	if [ "$LASTVERSION" != 0 ]
             then 
             echo "compare version $LASTVERSION with $VER"
		diff_result=` diff -rbB --brief trunk-$LASTVERSION/core/src/java trunk-$VER//core/src/java `
		echo "$diff_result"
		if [ -z "$diff_result" ]
                     then  #empty means they are the same  
		     echo "2 versions are the same, skip to next version"
		     ##continue
		fi
	fi

	cd trunk-$VER
	echo " build" 
	if $SVNCHECKOUT; then
	 ant ivy-bootstrap
	 ant compile
	 ant compile-test
	 ant test
	 ant dist
	fi
	#beautify
	#~/sir/workspace/astyle/build/gcc/bin/astyle --style=allman --recursive --suffix=none *.java

	echo "deploy to versions.alt directory"
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


	cd ..

echo " copy libs"
cp ./build/lucene-libs/*.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./build/solr-test-framework/lucene-libs/lucene-test-framework-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./build/solr-test-framework/solr-test-framework-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./build/solr-core/solr-core-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./build/contrib/solr-cell/solr-cell-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./build/contrib/solr-dataimporthandler/solr-dataimporthandler-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./build/contrib/solr-clustering/solr-clustering-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./build/contrib/solr-langid/solr-langid-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./build/contrib/solr-velocity/solr-velocity-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./build/contrib/solr-dataimporthandler-extras/solr-dataimporthandler-extras-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./build/contrib/solr-uima/lucene-libs/lucene-analyzers-uima-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./build/contrib/solr-uima/solr-uima-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./build/contrib/solr-analysis-extras/lucene-libs/lucene-analyzers-smartcn-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./build/contrib/solr-analysis-extras/lucene-libs/lucene-analyzers-stempel-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./build/contrib/solr-analysis-extras/lucene-libs/lucene-analyzers-icu-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./build/contrib/solr-analysis-extras/lucene-libs/lucene-analyzers-morfologik-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./build/contrib/solr-analysis-extras/solr-analysis-extras-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./build/solr-solrj/solr-solrj-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./dist/solrj-lib/*.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./dist/test-framework/lucene-libs/lucene-test-framework-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./dist/test-framework/lib/junit4-ant-2.0.10.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./dist/test-framework/lib/randomizedtesting-runner-2.0.10.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./dist/test-framework/lib/junit-4.10.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./dist/test-framework/lib/ant-1.8.2.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./dist/solr-dataimporthandler-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./dist/solr-cell-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./dist/solr-langid-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./dist/solr-analysis-extras-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./dist/solr-dataimporthandler-extras-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./dist/solr-velocity-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./dist/solr-solrj-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./dist/solr-test-framework-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./dist/solr-clustering-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./dist/solr-uima-5.0-SNAPSHOT.jar $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ./core/lib/* $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
cp ../lucene/spatial/lib/* $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib

	LASTVERSION=$VER
done < snapshot_build_hashcode.txt


