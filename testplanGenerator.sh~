#!/bin/bash -x
TESTSUBJECT="apache_solr_core_snapshots-TM"
TESTSUBJECT_ALT="apache_solr_core_snapshots"
export JAVA_HOME=/home/wliu/java/jdk1.7.0_17/bin
echo $JAVA_HOME
export PATH=/home/wliu/java/jdk1.7.0_17/bin:$PATH
echo $PATH
#Its also worth noting that when you use the  java -jar command line option to run your Java program as an executable JAR, then the CLASSPATH environment variable will be ignored, and also the -cp and -classpath switches will be ignored.
#http://stackoverflow.com/questions/219585/setting-multiple-jars-in-java-classpath

for VER in {0..5}
do
CLASS_DIR="/home/wliu/sir/$TESTSUBJECT/versions.alt/orig/v$VER/$TESTSUBJECT_ALT/build/classes"
echo $CLASS_DIR

	echo " running version $VER" 
	export CLASSPATH="./artsTestPlanGenerator.jar:/home/wliu/workspace/ARTS/lib/*:/home/wliu/sir/$TESTSUBJECT/versions.alt/orig/v$VER/$TESTSUBJECT_ALT/lib/*:$CLASS_DIR/solr-core/classes/test:$CLASS_DIR/solr-core/classes/java:$CLASS_DIR/solr-solrj/classes/test:$CLASS_DIR/solr-solrj/classes/java:$CLASS_DIR/solr-test-framework/classes/java:$CLASS_DIR/contrib/solr-clustering/classes/test:$CLASS_DIR/contrib/solr-clustering/classes/java:$CLASS_DIR/contrib/solr-dataimporthandler-extras/classes/test:$CLASS_DIR/contrib/solr-dataimporthandler-extras/classes/java:$CLASS_DIR/contrib/solr-langid/classes/test:$CLASS_DIR/contrib/solr-langid/classes/java:$CLASS_DIR/contrib/solr-dataimporthandler/classes/test:$CLASS_DIR/contrib/solr-dataimporthandler/classes/java:$CLASS_DIR/contrib/solr-velocity/classes/test:$CLASS_DIR/contrib/solr-velocity/classes/java:$CLASS_DIR/contrib/solr-cell/classes/test:$CLASS_DIR/contrib/solr-cell/classes/java:$CLASS_DIR/contrib/solr-uima/classes/test:$CLASS_DIR/contrib/solr-uima/classes/java:$CLASS_DIR/contrib/solr-analysis-extras/classes/test:$CLASS_DIR/contrib/solr-analysis-extras/classes/java"
	echo $CLASSPATH

	java -cp $CLASSPATH uw.star.rts.testsubject.sir_java.TestPlanGenerator /home/wliu/sir/$TESTSUBJECT/versions.alt/orig/v$VER/$TESTSUBJECT_ALT/build/src/core/src/test > /home/wliu/sir/$TESTSUBJECT/testplans.alt/v$VER/v$VER.class.junit.universe.all
done




