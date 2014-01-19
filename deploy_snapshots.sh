#!/bin/bash
TESTSUBJECT="apache-solr-core-snapshotsAll-TM"
TESTSUBJECT_ALT="apache-solr-core-snapshots"
SVNLOCAL="/media/svn/svn-apache"
SVNNAME="solr"
SVNCHECKOUT=true #set to false when no connection to SVN
LOGLOCATION="$HOME/sir/workspace/log"
java1_5=$HOME/java/jdk1.5.0_22
java1_6=$HOME/java/jdk1.6.0_45
java1_7=$HOME/java/jdk1.7.0_51


export experiment_root=/media/data/wliu/sir
export JAVA_HOME=$java1_6
export CLASSPATH=.

echo " this script fetches source from SVN, build and deploy to sir versions.alt directory"
echo " versions has no code change in solr-core will not be deployed to sir versions.alt "
echo " make sure to have $SVNLOCAL directory created or cleaned before proceeed"
echo " start time is `date` "
echo "1 === fetch from SVN"

cd $SVNLOCAL

if $SVNCHECKOUT; then

	svn checkout -q http://svn.apache.org/repos/asf/lucene/dev/trunk/solr
	svn checkout -q http://svn.apache.org/repos/asf/lucene/dev/trunk/lucene

	cd $SVNNAME
	echo "2 === extract version numbers "

	#remove --limit 5 later to see all.  -r 1487914:1491470 
	svn log --limit 10 | grep "^r[0-9]* |" | sed 's/^r\([0-9]*\).*$/\1/' > ../snapshot_build_hashcode.txt
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
		svn checkout -q http://svn.apache.org/repos/asf/lucene/dev/trunk/solr -r $VER trunk-$VER
	fi

   	echo "4 === beautify" 
        ~/sir/workspace/astyle/build/gcc/bin/astyle --style=allman --recursive --suffix=none --quiet trunk-$VER/core/*.java     

	if [ "$LASTVERSION" != 0 ]
             then 
             echo "5.1 === compare version $LASTVERSION with $VER"
		diff_result=` diff --ignore-case --ignore-all-space --ignore-blank-lines --recursive --brief --exclude='.svn' trunk-$LASTVERSION/core/src/java trunk-$VER/core/src/java `

		if [ -z "$diff_result" ]
                     then  #empty means they are the same  
		     echo "5.2 === version $VER and $LASTVERSION have no code change in core, skip to next version"
		     continue
		fi
	fi
	
        #this VER should be different from LASTVERSION
	let " b -=1 "
	cd trunk-$VER

#checkout a Lucene code match the timestamp of solr revision
#svn checkout http://svn.apache.org/repos/asf/lucene/dev/trunk/lucene -r {2013-06-07T20:53-0400}
        echo "5.5 === parse TIMESTAMP of version $VER"
        echo "TIMESTAMP `svn log -r $VER`"
	TIMESTAMP=`svn log -r $VER | grep "$VER" | sed 's/^r[0-9]* | [a-zA-Z]* | \(.*\)(.*) | .*$/\1/' |sed 's/\([0-9-]*\) \([0-9]*:[0-9]*\):[0-9]* \(.*\) $/{\1T\2\3}/' `
        echo "TIMESTAMP of version $VER is $TIMESTAMP"

        cd ..
        rm -rf lucene
        svn checkout -q http://svn.apache.org/repos/asf/lucene/dev/trunk/lucene -r $TIMESTAMP
	cd trunk-$VER


	echo " 6 === build" 
	if $SVNCHECKOUT; then
#change this later to build differently for each major revisions and use different java versions.
        export JAVA_HOME=$java1_7
        build_result=` ant compile |grep "BUILD SUCCESSFUL" `
         if [ -z "$build_result" ] 
             then 
               echo "ant compile BUILD $VER failed" 
               exit
         fi
         echo "ant compile $VER $build_result" 

        build_result=` ant compile-test |grep "BUILD SUCCESSFUL" `
         if [ -z "$build_result" ] 
             then 
               echo "ant compile-test BUILD $VER failed" 
               exit
         fi
         echo "ant compile-test $VER $build_result" 
	 
	 build_result=` ant test |grep "BUILD SUCCESSFUL" `
         if [ -z "$build_result" ] 
             then 
               echo " ant test BUILD $VER failed" 
         #exit - do not exit even when ant test failed 
         fi
         echo "ant test $VER $build_result" 

        build_result=` ant dist |grep "BUILD SUCCESSFUL" `
         if [ -z "$build_result" ] 
             then 
               echo "ant dist BUILD $VER failed" 
               exit
         fi
         echo "ant dist $VER $build_result" 
	fi

	echo "7 === deploy r$VER to versions.alt directory as v$b"
	mkdir -p $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b
	mkdir $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT
	mkdir $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/lib
	mkdir $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/build
	mkdir $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/build/classes
	mkdir $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/build/src

	echo " copy binary "
	cp -r build/solr-core $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/build/classes

	echo " copy source - only copy source of core" 
	tar cvf core.tar --exclude='.svn' core >/dev/null 2>&1
	tar xvf core.tar -C $HOME/sir/$TESTSUBJECT/versions.alt/orig/v$b/$TESTSUBJECT_ALT/build/src >/dev/null 2>&1

	echo " libs will not be copied. test scripts are run directly in SVN local directories"

	cd ..

#TODO: ideally, generate test plan, run test scripts right here and run it in the loop.
	LASTVERSION=$VER
done < snapshot_build_hashcode.txt

echo " end time is `date` "
