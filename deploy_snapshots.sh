#!/bin/bash
TESTSUBJECT="apache-solr-core-snapshotsAll-TM"
TESTSUBJECT_ALT="apache-solr-core-snapshots"
SVNLOCAL="/media/svn/svn-apache"
ENABLETEST=false #set to false to skip ant test- takes long time and many failed
LOGLOCATION="$HOME/sir/workspace/log"
java1_5=$HOME/java/jdk1.5.0_22
java1_6=$HOME/java/jdk1.6.0_45
java1_7=$HOME/java/jdk1.7.0_51
ant1_8_2=$HOME/java/apache-ant-1.8.2
ant1_7_1=$HOME/java/apache-ant-1.7.1
ant1_7_0=$HOME/java/apache-ant-1.7.0

export experiment_root=/media/data/wliu/sir
export JAVA_HOME=$java1_6
export CLASSPATH=.

echo " this script fetches source from SVN, build and deploy to sir versions.alt directory"
echo " versions has no code change in solr-core will not be deployed to sir versions.alt "
echo " make sure to have $SVNLOCAL directory created or cleaned before proceeed"
echo " start time is `date` "
echo "1 === fetch from SVN"

cd $SVNLOCAL

svn checkout -q http://svn.apache.org/repos/asf/lucene/dev/trunk

cd trunk/solr
echo "2 === extract version numbers "

#remove --limit 5 later to see all.  -r 1487914:1491470 
svn log --limit 1000 | grep "^r[0-9]* |" | sed 's/^r\([0-9]*\).*$/\1/' > ../../snapshot_build_hashcode.txt

cd $SVNLOCAL   
#b is total number of versions
b=$(more snapshot_build_hashcode.txt | wc -l)
LASTVERSION=0  #this points to the previous version number

#iterate for each version   
while read VER
do
   echo "3 === check out version $VER"
   svn checkout -q http://svn.apache.org/repos/asf/lucene/dev/trunk -r $VER trunk-$VER
   
   echo "4 === beautify" 
   ~/sir/workspace/astyle/build/gcc/bin/astyle --style=allman --recursive --suffix=none --quiet trunk-$VER/solr/core/*.java     

	if [ "$LASTVERSION" != 0 ]
             then 
             echo "5.1 === compare version $LASTVERSION with $VER"
		diff_result=` diff --ignore-case --ignore-all-space --ignore-blank-lines --recursive --brief --exclude='.svn' trunk-$LASTVERSION/solr/core/src/java trunk-$VER/solr/core/src/java `

		if [ -z "$diff_result" ]
                     then  #empty means they are the same  
		     echo "5.2 === version $VER and $LASTVERSION have no code change in core, skip to next version"
		     continue
		fi
	fi
	
        #this VER should be different from LASTVERSION
	let " b -=1 "
	cd trunk-$VER/solr

	echo " 6 === build" 
        
        #each major revisions and use different java versions.
	if [ $VER -ge 1457734 ]
	then
	    export JAVA_HOME=$java1_7
	elif [ $VER -ge  1198039 ]
	then 
	    export JAVA_HOME=$java1_6
	else 
	    export JAVA_HOME=$java1_5
	fi  
        echo $JAVA_HOME

        #each major revisions and use different ant versions.
	if [ $VER -ge 1331284 ]
	then
	    export ANT_HOME=$ant1_8_2
	elif [ $VER -ge 1138821 ]
	then 
	    export ANT_HOME=$ant1_7_1
	else 
	    export ANT_HOME=$ant1_7_0
	fi
        echo $ANT_HOME

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
	 
         if $ENABLETEST; then
		 build_result=` ant test |grep "BUILD SUCCESSFUL" `
		 if [ -z "$build_result" ] 
		     then 
		       echo " ant test BUILD $VER failed" 
		 #exit - do not exit even when ant test failed 
		 fi
		 echo "ant test $VER $build_result" 
        fi

        build_result=` ant dist |grep "BUILD SUCCESSFUL" `
         if [ -z "$build_result" ] 
             then 
               echo "ant dist BUILD $VER failed" 
               exit
         fi
         echo "ant dist $VER $build_result" 

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

	cd $SVNLOCAL

#TODO: ideally, generate test plan, run test scripts right here and run it in the loop.
	LASTVERSION=$VER
done < snapshot_build_hashcode.txt

echo " end time is `date` "
