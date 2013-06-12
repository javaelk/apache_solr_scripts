#!/bin/bash -x
TESTSUBJECT="apache_solr_core_snapshots-TM"
TESTSUBJECT_ALT="apache_solr_core_snapshots"
EXCLUDEDCLASSES=""

unset CLASSPATH
CLASSPATH=".:./build/solr-core/classes/test:./build/solr-core/classes/java:./build/solr-core/test:./build/solr-core/test-files:/home/wliu/sir/$TESTSUBJECT/scripts/TestScripts:./build/solr-test-framework/lucene-libs/lucene-test-framework-5.0-SNAPSHOT.jar:./build/solr-test-framework/solr-test-framework-5.0-SNAPSHOT.jar:./build/lucene-libs/*:./build/solr-core/solr-core-5.0-SNAPSHOT.jar:./build/contrib/solr-cell/solr-cell-5.0-SNAPSHOT.jar:./build/contrib/solr-dataimporthandler/solr-dataimporthandler-5.0-SNAPSHOT.jar:./build/contrib/solr-clustering/solr-clustering-5.0-SNAPSHOT.jar:./build/contrib/solr-langid/solr-langid-5.0-SNAPSHOT.jar:./build/contrib/solr-velocity/solr-velocity-5.0-SNAPSHOT.jar:./build/contrib/solr-dataimporthandler-extras/solr-dataimporthandler-extras-5.0-SNAPSHOT.jar:./build/contrib/solr-uima/lucene-libs/lucene-analyzers-uima-5.0-SNAPSHOT.jar:./build/contrib/solr-uima/solr-uima-5.0-SNAPSHOT.jar:./build/contrib/solr-analysis-extras/lucene-libs/lucene-analyzers-smartcn-5.0-SNAPSHOT.jar:./build/contrib/solr-analysis-extras/lucene-libs/lucene-analyzers-stempel-5.0-SNAPSHOT.jar:./build/contrib/solr-analysis-extras/lucene-libs/lucene-analyzers-icu-5.0-SNAPSHOT.jar:./build/contrib/solr-analysis-extras/lucene-libs/lucene-analyzers-morfologik-5.0-SNAPSHOT.jar:./build/contrib/solr-analysis-extras/solr-analysis-extras-5.0-SNAPSHOT.jar:./build/solr-solrj/solr-solrj-5.0-SNAPSHOT.jar:./dist/solrj-lib/*:./dist/test-framework/lib/*:./dist/solr-dataimporthandler-5.0-SNAPSHOT.jar:./dist/solr-cell-5.0-SNAPSHOT.jar:./dist/solr-langid-5.0-SNAPSHOT.jar:./dist/solr-analysis-extras-5.0-SNAPSHOT.jar:./dist/solr-dataimporthandler-extras-5.0-SNAPSHOT.jar:./dist/solr-velocity-5.0-SNAPSHOT.jar:./dist/solr-solrj-5.0-SNAPSHOT.jar:./dist/solr-clustering-5.0-SNAPSHOT.jar:./dist/solr-uima-5.0-SNAPSHOT.jar:./core/lib/*:./example/lib/*"
export CLASSPATH
VER=v2
echo " running test 1"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.EchoParamsTest.test> $experiment_root/$TESTSUBJECT/outputs/$VER/t1 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.EchoParamsTest.test $VER

echo " running test 2"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.response.TestCSVResponseWriter.testCSVOutput> $experiment_root/$TESTSUBJECT/outputs/$VER/t2 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.response.TestCSVResponseWriter.testCSVOutput $VER

echo " running test 3"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.response.TestCSVResponseWriter.testPseudoFields> $experiment_root/$TESTSUBJECT/outputs/$VER/t3 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.response.TestCSVResponseWriter.testPseudoFields $VER

echo " running test 4"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.response.TestPHPSerializedResponseWriter.testSimple> $experiment_root/$TESTSUBJECT/outputs/$VER/t4 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.response.TestPHPSerializedResponseWriter.testSimple $VER

echo " running test 5"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.response.TestPHPSerializedResponseWriter.testSolrDocuments> $experiment_root/$TESTSUBJECT/outputs/$VER/t5 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.response.TestPHPSerializedResponseWriter.testSolrDocuments $VER

echo " running test 6"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.logging.TestLogWatcher.testLog4jWatcher> $experiment_root/$TESTSUBJECT/outputs/$VER/t6 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.logging.TestLogWatcher.testLog4jWatcher $VER

echo " running test 7"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.util.SolrPluginUtilsTest.testDocListConversion> $experiment_root/$TESTSUBJECT/outputs/$VER/t7 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.util.SolrPluginUtilsTest.testDocListConversion $VER

echo " running test 8"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.util.SolrPluginUtilsTest.testPartialEscape> $experiment_root/$TESTSUBJECT/outputs/$VER/t8 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.util.SolrPluginUtilsTest.testPartialEscape $VER

echo " running test 9"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.util.SolrPluginUtilsTest.testStripUnbalancedQuotes> $experiment_root/$TESTSUBJECT/outputs/$VER/t9 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.util.SolrPluginUtilsTest.testStripUnbalancedQuotes $VER

echo " running test 10"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.util.SolrPluginUtilsTest.testStripIllegalOperators> $experiment_root/$TESTSUBJECT/outputs/$VER/t10 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.util.SolrPluginUtilsTest.testStripIllegalOperators $VER

echo " running test 11"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.util.SolrPluginUtilsTest.testParseFieldBoosts> $experiment_root/$TESTSUBJECT/outputs/$VER/t11 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.util.SolrPluginUtilsTest.testParseFieldBoosts $VER

echo " running test 12"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.util.SolrPluginUtilsTest.testDisjunctionMaxQueryParser> $experiment_root/$TESTSUBJECT/outputs/$VER/t12 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.util.SolrPluginUtilsTest.testDisjunctionMaxQueryParser $VER

echo " running test 13"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.util.SolrPluginUtilsTest.testMinShouldMatchCalculator> $experiment_root/$TESTSUBJECT/outputs/$VER/t13 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.util.SolrPluginUtilsTest.testMinShouldMatchCalculator $VER

echo " running test 14"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.util.SimplePostToolTest.testParseArgsAndInit> $experiment_root/$TESTSUBJECT/outputs/$VER/t14 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.util.SimplePostToolTest.testParseArgsAndInit $VER

echo " running test 15"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.util.SimplePostToolTest.testNormalizeUrlEnding> $experiment_root/$TESTSUBJECT/outputs/$VER/t15 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.util.SimplePostToolTest.testNormalizeUrlEnding $VER

echo " running test 16"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.util.SimplePostToolTest.testComputeFullUrl> $experiment_root/$TESTSUBJECT/outputs/$VER/t16 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.util.SimplePostToolTest.testComputeFullUrl $VER

echo " running test 17"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.util.SimplePostToolTest.testTypeSupported> $experiment_root/$TESTSUBJECT/outputs/$VER/t17 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.util.SimplePostToolTest.testTypeSupported $VER

echo " running test 18"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.util.SimplePostToolTest.testIsOn> $experiment_root/$TESTSUBJECT/outputs/$VER/t18 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.util.SimplePostToolTest.testIsOn $VER

echo " running test 19"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.util.SimplePostToolTest.testAppendParam> $experiment_root/$TESTSUBJECT/outputs/$VER/t19 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.util.SimplePostToolTest.testAppendParam $VER

echo " running test 20"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.util.SimplePostToolTest.testAppendUrlPath> $experiment_root/$TESTSUBJECT/outputs/$VER/t20 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.util.SimplePostToolTest.testAppendUrlPath $VER

echo " running test 21"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.util.SimplePostToolTest.testGuessType> $experiment_root/$TESTSUBJECT/outputs/$VER/t21 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.util.SimplePostToolTest.testGuessType $VER

echo " running test 22"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.util.SimplePostToolTest.testDoFilesMode> $experiment_root/$TESTSUBJECT/outputs/$VER/t22 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.util.SimplePostToolTest.testDoFilesMode $VER

echo " running test 23"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.util.SimplePostToolTest.testDoWebMode> $experiment_root/$TESTSUBJECT/outputs/$VER/t23 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.util.SimplePostToolTest.testDoWebMode $VER

echo " running test 24"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.util.SimplePostToolTest.testRobotsExclusion> $experiment_root/$TESTSUBJECT/outputs/$VER/t24 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.util.SimplePostToolTest.testRobotsExclusion $VER

echo " running test 25"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.util.CircularListTest.testCircularList> $experiment_root/$TESTSUBJECT/outputs/$VER/t25 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.util.CircularListTest.testCircularList $VER

echo " running test 26"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestTrie.testTokenizer> $experiment_root/$TESTSUBJECT/outputs/$VER/t26 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestTrie.testTokenizer $VER

echo " running test 27"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestTrie.testTrieIntRangeSearch> $experiment_root/$TESTSUBJECT/outputs/$VER/t27 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestTrie.testTrieIntRangeSearch $VER

echo " running test 28"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestTrie.testTrieTermQuery> $experiment_root/$TESTSUBJECT/outputs/$VER/t28 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestTrie.testTrieTermQuery $VER

echo " running test 29"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestTrie.testTrieFloatRangeSearch> $experiment_root/$TESTSUBJECT/outputs/$VER/t29 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestTrie.testTrieFloatRangeSearch $VER

echo " running test 30"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestTrie.testTrieLongRangeSearch> $experiment_root/$TESTSUBJECT/outputs/$VER/t30 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestTrie.testTrieLongRangeSearch $VER

echo " running test 31"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestTrie.testTrieDoubleRangeSearch> $experiment_root/$TESTSUBJECT/outputs/$VER/t31 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestTrie.testTrieDoubleRangeSearch $VER

echo " running test 32"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestTrie.testTrieDateRangeSearch> $experiment_root/$TESTSUBJECT/outputs/$VER/t32 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestTrie.testTrieDateRangeSearch $VER

echo " running test 33"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestTrie.testTrieDoubleRangeSearch_CustomPrecisionStep> $experiment_root/$TESTSUBJECT/outputs/$VER/t33 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestTrie.testTrieDoubleRangeSearch_CustomPrecisionStep $VER

echo " running test 34"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestTrie.testTrieFacet_PrecisionStep> $experiment_root/$TESTSUBJECT/outputs/$VER/t34 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestTrie.testTrieFacet_PrecisionStep $VER

echo " running test 35"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.servlet.CacheHeaderTest.testCacheVetoHandler> $experiment_root/$TESTSUBJECT/outputs/$VER/t35 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.servlet.CacheHeaderTest.testCacheVetoHandler $VER

echo " running test 36"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.servlet.CacheHeaderTest.testCacheVetoException> $experiment_root/$TESTSUBJECT/outputs/$VER/t36 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.servlet.CacheHeaderTest.testCacheVetoException $VER

echo " running test 37"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.servlet.CacheHeaderTest.testLastModified> $experiment_root/$TESTSUBJECT/outputs/$VER/t37 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.servlet.CacheHeaderTest.testLastModified $VER

echo " running test 38"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.servlet.CacheHeaderTest.testEtag> $experiment_root/$TESTSUBJECT/outputs/$VER/t38 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.servlet.CacheHeaderTest.testEtag $VER

echo " running test 39"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.servlet.CacheHeaderTest.testCacheControl> $experiment_root/$TESTSUBJECT/outputs/$VER/t39 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.servlet.CacheHeaderTest.testCacheControl $VER

echo " running test 40"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.servlet.NoCacheHeaderTest.testLastModified> $experiment_root/$TESTSUBJECT/outputs/$VER/t40 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.servlet.NoCacheHeaderTest.testLastModified $VER

echo " running test 41"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.servlet.NoCacheHeaderTest.testEtag> $experiment_root/$TESTSUBJECT/outputs/$VER/t41 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.servlet.NoCacheHeaderTest.testEtag $VER

echo " running test 42"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.servlet.NoCacheHeaderTest.testCacheControl> $experiment_root/$TESTSUBJECT/outputs/$VER/t42 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.servlet.NoCacheHeaderTest.testCacheControl $VER

echo " running test 43"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.servlet.SolrRequestParserTest.testStreamBody> $experiment_root/$TESTSUBJECT/outputs/$VER/t43 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.servlet.SolrRequestParserTest.testStreamBody $VER

echo " running test 44"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.servlet.SolrRequestParserTest.testStreamURL> $experiment_root/$TESTSUBJECT/outputs/$VER/t44 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.servlet.SolrRequestParserTest.testStreamURL $VER

echo " running test 45"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.servlet.SolrRequestParserTest.testUrlParamParsing> $experiment_root/$TESTSUBJECT/outputs/$VER/t45 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.servlet.SolrRequestParserTest.testUrlParamParsing $VER

echo " running test 46"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.servlet.SolrRequestParserTest.testStandardParseParamsAndFillStreams> $experiment_root/$TESTSUBJECT/outputs/$VER/t46 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.servlet.SolrRequestParserTest.testStandardParseParamsAndFillStreams $VER

echo " running test 47"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.servlet.SolrRequestParserTest.testStandardFormdataUploadLimit> $experiment_root/$TESTSUBJECT/outputs/$VER/t47 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.servlet.SolrRequestParserTest.testStandardFormdataUploadLimit $VER

echo " running test 48"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.servlet.SolrRequestParserTest.testParameterIncompatibilityException1> $experiment_root/$TESTSUBJECT/outputs/$VER/t48 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.servlet.SolrRequestParserTest.testParameterIncompatibilityException1 $VER

echo " running test 49"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.servlet.SolrRequestParserTest.testParameterIncompatibilityException2> $experiment_root/$TESTSUBJECT/outputs/$VER/t49 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.servlet.SolrRequestParserTest.testParameterIncompatibilityException2 $VER

echo " running test 50"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.servlet.SolrRequestParserTest.testAddHttpRequestToContext> $experiment_root/$TESTSUBJECT/outputs/$VER/t50 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.servlet.SolrRequestParserTest.testAddHttpRequestToContext $VER

echo " running test 51"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.JSONWriterTest.testTypes> $experiment_root/$TESTSUBJECT/outputs/$VER/t51 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.JSONWriterTest.testTypes $VER

echo " running test 52"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.JSONWriterTest.testJSON> $experiment_root/$TESTSUBJECT/outputs/$VER/t52 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.JSONWriterTest.testJSON $VER

echo " running test 53"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.JSONWriterTest.testJSONSolrDocument> $experiment_root/$TESTSUBJECT/outputs/$VER/t53 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.JSONWriterTest.testJSONSolrDocument $VER

echo " running test 54"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testCachingBigTerms> $experiment_root/$TESTSUBJECT/outputs/$VER/t54 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testCachingBigTerms $VER

echo " running test 55"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testSimpleGroupedQueryRangeFacets> $experiment_root/$TESTSUBJECT/outputs/$VER/t55 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testSimpleGroupedQueryRangeFacets $VER

echo " running test 56"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testSimpleGroupedFacets> $experiment_root/$TESTSUBJECT/outputs/$VER/t56 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testSimpleGroupedFacets $VER

echo " running test 57"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testEmptyFacetCounts> $experiment_root/$TESTSUBJECT/outputs/$VER/t57 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testEmptyFacetCounts $VER

echo " running test 58"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testSimpleFacetCounts> $experiment_root/$TESTSUBJECT/outputs/$VER/t58 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testSimpleFacetCounts $VER

echo " running test 59"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testTrieDateFacets> $experiment_root/$TESTSUBJECT/outputs/$VER/t59 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testTrieDateFacets $VER

echo " running test 60"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testDateFacets> $experiment_root/$TESTSUBJECT/outputs/$VER/t60 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testDateFacets $VER

echo " running test 61"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testTrieDateRangeFacets> $experiment_root/$TESTSUBJECT/outputs/$VER/t61 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testTrieDateRangeFacets $VER

echo " running test 62"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testDateRangeFacets> $experiment_root/$TESTSUBJECT/outputs/$VER/t62 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testDateRangeFacets $VER

echo " running test 63"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testTrieDateFacetsWithIncludeOption> $experiment_root/$TESTSUBJECT/outputs/$VER/t63 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testTrieDateFacetsWithIncludeOption $VER

echo " running test 64"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testDateFacetsWithIncludeOption> $experiment_root/$TESTSUBJECT/outputs/$VER/t64 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testDateFacetsWithIncludeOption $VER

echo " running test 65"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testTrieDateRangeFacetsWithIncludeOption> $experiment_root/$TESTSUBJECT/outputs/$VER/t65 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testTrieDateRangeFacetsWithIncludeOption $VER

echo " running test 66"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testDateRangeFacetsWithIncludeOption> $experiment_root/$TESTSUBJECT/outputs/$VER/t66 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testDateRangeFacetsWithIncludeOption $VER

echo " running test 67"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testDateFacetsWithTz> $experiment_root/$TESTSUBJECT/outputs/$VER/t67 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testDateFacetsWithTz $VER

echo " running test 68"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testNumericRangeFacetsTrieFloat> $experiment_root/$TESTSUBJECT/outputs/$VER/t68 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testNumericRangeFacetsTrieFloat $VER

echo " running test 69"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testNumericRangeFacetsTrieDouble> $experiment_root/$TESTSUBJECT/outputs/$VER/t69 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testNumericRangeFacetsTrieDouble $VER

echo " running test 70"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testNumericRangeFacetsSortableFloat> $experiment_root/$TESTSUBJECT/outputs/$VER/t70 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testNumericRangeFacetsSortableFloat $VER

echo " running test 71"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testNumericRangeFacetsSortableDouble> $experiment_root/$TESTSUBJECT/outputs/$VER/t71 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testNumericRangeFacetsSortableDouble $VER

echo " running test 72"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testNumericRangeFacetsOverflowTrieDouble> $experiment_root/$TESTSUBJECT/outputs/$VER/t72 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testNumericRangeFacetsOverflowTrieDouble $VER

echo " running test 73"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testNumericRangeFacetsOverflowSortableDouble> $experiment_root/$TESTSUBJECT/outputs/$VER/t73 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testNumericRangeFacetsOverflowSortableDouble $VER

echo " running test 74"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testNumericRangeFacetsTrieInt> $experiment_root/$TESTSUBJECT/outputs/$VER/t74 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testNumericRangeFacetsTrieInt $VER

echo " running test 75"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testNumericRangeFacetsTrieLong> $experiment_root/$TESTSUBJECT/outputs/$VER/t75 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testNumericRangeFacetsTrieLong $VER

echo " running test 76"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testNumericRangeFacetsSortableInt> $experiment_root/$TESTSUBJECT/outputs/$VER/t76 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testNumericRangeFacetsSortableInt $VER

echo " running test 77"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testNumericRangeFacetsSortableLong> $experiment_root/$TESTSUBJECT/outputs/$VER/t77 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testNumericRangeFacetsSortableLong $VER

echo " running test 78"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testNumericRangeFacetsOverflowTrieLong> $experiment_root/$TESTSUBJECT/outputs/$VER/t78 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testNumericRangeFacetsOverflowTrieLong $VER

echo " running test 79"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testNumericRangeFacetsOverflowSortableLong> $experiment_root/$TESTSUBJECT/outputs/$VER/t79 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testNumericRangeFacetsOverflowSortableLong $VER

echo " running test 80"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testFacetSingleValued> $experiment_root/$TESTSUBJECT/outputs/$VER/t80 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testFacetSingleValued $VER

echo " running test 81"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testFacetSingleValuedFcs> $experiment_root/$TESTSUBJECT/outputs/$VER/t81 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testFacetSingleValuedFcs $VER

echo " running test 82"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testFacetPrefixMultiValued> $experiment_root/$TESTSUBJECT/outputs/$VER/t82 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testFacetPrefixMultiValued $VER

echo " running test 83"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testFacetPrefixSingleValued> $experiment_root/$TESTSUBJECT/outputs/$VER/t83 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testFacetPrefixSingleValued $VER

echo " running test 84"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.SimpleFacetsTest.testFacetPrefixSingleValuedFcs> $experiment_root/$TESTSUBJECT/outputs/$VER/t84 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.SimpleFacetsTest.testFacetPrefixSingleValuedFcs $VER

echo " running test 85"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.TestRemoteStreaming.testMakeDeleteAllUrl> $experiment_root/$TESTSUBJECT/outputs/$VER/t85 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.TestRemoteStreaming.testMakeDeleteAllUrl $VER

echo " running test 86"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.TestRemoteStreaming.testStreamUrl> $experiment_root/$TESTSUBJECT/outputs/$VER/t86 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.TestRemoteStreaming.testStreamUrl $VER

echo " running test 87"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.TestRemoteStreaming.testNoUrlAccess> $experiment_root/$TESTSUBJECT/outputs/$VER/t87 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.TestRemoteStreaming.testNoUrlAccess $VER

echo " running test 88"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.TestRemoteStreaming.testQtUpdateFails> $experiment_root/$TESTSUBJECT/outputs/$VER/t88 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.TestRemoteStreaming.testQtUpdateFails $VER

echo " running test 89"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.TestFaceting.testTermEnum> $experiment_root/$TESTSUBJECT/outputs/$VER/t89 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.TestFaceting.testTermEnum $VER

echo " running test 90"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.TestFaceting.testFacets> $experiment_root/$TESTSUBJECT/outputs/$VER/t90 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.TestFaceting.testFacets $VER

echo " running test 91"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.TestFaceting.testRegularBig> $experiment_root/$TESTSUBJECT/outputs/$VER/t91 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.TestFaceting.testRegularBig $VER

echo " running test 92"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.TestFaceting.testTrieFields> $experiment_root/$TESTSUBJECT/outputs/$VER/t92 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.TestFaceting.testTrieFields $VER

echo " running test 93"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.request.TestFaceting.testFacetSortWithMinCount> $experiment_root/$TESTSUBJECT/outputs/$VER/t93 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.request.TestFaceting.testFacetSortWithMinCount $VER

echo " running test 94"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestRandomFaceting.testRandomFaceting> $experiment_root/$TESTSUBJECT/outputs/$VER/t94 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestRandomFaceting.testRandomFaceting $VER

echo " running test 95"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.BasicFunctionalityTest.testIgnoredFields> $experiment_root/$TESTSUBJECT/outputs/$VER/t95 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.BasicFunctionalityTest.testIgnoredFields $VER

echo " running test 96"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.BasicFunctionalityTest.testSomeStuff> $experiment_root/$TESTSUBJECT/outputs/$VER/t96 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.BasicFunctionalityTest.testSomeStuff $VER

echo " running test 97"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.BasicFunctionalityTest.testHTMLStrip> $experiment_root/$TESTSUBJECT/outputs/$VER/t97 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.BasicFunctionalityTest.testHTMLStrip $VER

echo " running test 98"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.BasicFunctionalityTest.testClientErrorOnMalformedNumbers> $experiment_root/$TESTSUBJECT/outputs/$VER/t98 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.BasicFunctionalityTest.testClientErrorOnMalformedNumbers $VER

echo " running test 99"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.BasicFunctionalityTest.testRequestHandlerBaseException> $experiment_root/$TESTSUBJECT/outputs/$VER/t99 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.BasicFunctionalityTest.testRequestHandlerBaseException $VER

echo " running test 100"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.BasicFunctionalityTest.testMultipleUpdatesPerAdd> $experiment_root/$TESTSUBJECT/outputs/$VER/t100 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.BasicFunctionalityTest.testMultipleUpdatesPerAdd $VER

echo " running test 101"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.BasicFunctionalityTest.testDocBoost> $experiment_root/$TESTSUBJECT/outputs/$VER/t101 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.BasicFunctionalityTest.testDocBoost $VER

echo " running test 102"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.BasicFunctionalityTest.testFieldBoost> $experiment_root/$TESTSUBJECT/outputs/$VER/t102 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.BasicFunctionalityTest.testFieldBoost $VER

echo " running test 103"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.BasicFunctionalityTest.testXMLWriter> $experiment_root/$TESTSUBJECT/outputs/$VER/t103 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.BasicFunctionalityTest.testXMLWriter $VER

echo " running test 104"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.BasicFunctionalityTest.testLocalSolrQueryRequestParams> $experiment_root/$TESTSUBJECT/outputs/$VER/t104 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.BasicFunctionalityTest.testLocalSolrQueryRequestParams $VER

echo " running test 105"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.BasicFunctionalityTest.testKeywordTokenizerFactory> $experiment_root/$TESTSUBJECT/outputs/$VER/t105 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.BasicFunctionalityTest.testKeywordTokenizerFactory $VER

echo " running test 106"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.BasicFunctionalityTest.testTermVectorFields> $experiment_root/$TESTSUBJECT/outputs/$VER/t106 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.BasicFunctionalityTest.testTermVectorFields $VER

echo " running test 107"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.BasicFunctionalityTest.testSolrParams> $experiment_root/$TESTSUBJECT/outputs/$VER/t107 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.BasicFunctionalityTest.testSolrParams $VER

echo " running test 108"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.BasicFunctionalityTest.testDefaultFieldValues> $experiment_root/$TESTSUBJECT/outputs/$VER/t108 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.BasicFunctionalityTest.testDefaultFieldValues $VER

echo " running test 109"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.BasicFunctionalityTest.testTokenizer> $experiment_root/$TESTSUBJECT/outputs/$VER/t109 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.BasicFunctionalityTest.testTokenizer $VER

echo " running test 110"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.BasicFunctionalityTest.testConfigDefaults> $experiment_root/$TESTSUBJECT/outputs/$VER/t110 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.BasicFunctionalityTest.testConfigDefaults $VER

echo " running test 111"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.BasicFunctionalityTest.testNotLazyField> $experiment_root/$TESTSUBJECT/outputs/$VER/t111 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.BasicFunctionalityTest.testNotLazyField $VER

echo " running test 112"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.BasicFunctionalityTest.testLazyField> $experiment_root/$TESTSUBJECT/outputs/$VER/t112 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.BasicFunctionalityTest.testLazyField $VER

echo " running test 113"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.BasicFunctionalityTest.testDateMath> $experiment_root/$TESTSUBJECT/outputs/$VER/t113 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.BasicFunctionalityTest.testDateMath $VER

echo " running test 114"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.BasicFunctionalityTest.testPatternReplaceFilter> $experiment_root/$TESTSUBJECT/outputs/$VER/t114 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.BasicFunctionalityTest.testPatternReplaceFilter $VER

echo " running test 115"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.BasicFunctionalityTest.testAbuseOfSort> $experiment_root/$TESTSUBJECT/outputs/$VER/t115 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.BasicFunctionalityTest.testAbuseOfSort $VER

echo " running test 116"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.BasicFunctionalityTest.testDeepPaging> $experiment_root/$TESTSUBJECT/outputs/$VER/t116 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.BasicFunctionalityTest.testDeepPaging $VER

echo " running test 117"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestSchemaVersionResource.testGetSchemaVersion> $experiment_root/$TESTSUBJECT/outputs/$VER/t117 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestSchemaVersionResource.testGetSchemaVersion $VER

echo " running test 118"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestFieldResource.testGetField> $experiment_root/$TESTSUBJECT/outputs/$VER/t118 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestFieldResource.testGetField $VER

echo " running test 119"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestFieldResource.testGetNotFoundField> $experiment_root/$TESTSUBJECT/outputs/$VER/t119 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestFieldResource.testGetNotFoundField $VER

echo " running test 120"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestFieldResource.testJsonGetField> $experiment_root/$TESTSUBJECT/outputs/$VER/t120 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestFieldResource.testJsonGetField $VER

echo " running test 121"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestFieldResource.testGetFieldIncludeDynamic> $experiment_root/$TESTSUBJECT/outputs/$VER/t121 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestFieldResource.testGetFieldIncludeDynamic $VER

echo " running test 122"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestFieldResource.testGetFieldDontShowDefaults> $experiment_root/$TESTSUBJECT/outputs/$VER/t122 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestFieldResource.testGetFieldDontShowDefaults $VER

echo " running test 123"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestFieldResource.testJsonPutFieldToNonMutableIndexSchema> $experiment_root/$TESTSUBJECT/outputs/$VER/t123 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestFieldResource.testJsonPutFieldToNonMutableIndexSchema $VER

echo " running test 124"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestFieldResource.testJsonPostFieldsToNonMutableIndexSchema> $experiment_root/$TESTSUBJECT/outputs/$VER/t124 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestFieldResource.testJsonPostFieldsToNonMutableIndexSchema $VER

echo " running test 125"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestDefaultSearchFieldResource.testGetDefaultSearchField> $experiment_root/$TESTSUBJECT/outputs/$VER/t125 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestDefaultSearchFieldResource.testGetDefaultSearchField $VER

echo " running test 126"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestSchemaNameResource.testGetSchemaName> $experiment_root/$TESTSUBJECT/outputs/$VER/t126 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestSchemaNameResource.testGetSchemaName $VER

echo " running test 127"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestCopyFieldCollectionResource.testGetAllCopyFields> $experiment_root/$TESTSUBJECT/outputs/$VER/t127 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestCopyFieldCollectionResource.testGetAllCopyFields $VER

echo " running test 128"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestCopyFieldCollectionResource.testJsonGetAllCopyFields> $experiment_root/$TESTSUBJECT/outputs/$VER/t128 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestCopyFieldCollectionResource.testJsonGetAllCopyFields $VER

echo " running test 129"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestCopyFieldCollectionResource.testRestrictSource> $experiment_root/$TESTSUBJECT/outputs/$VER/t129 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestCopyFieldCollectionResource.testRestrictSource $VER

echo " running test 130"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestCopyFieldCollectionResource.testRestrictDest> $experiment_root/$TESTSUBJECT/outputs/$VER/t130 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestCopyFieldCollectionResource.testRestrictDest $VER

echo " running test 131"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestCopyFieldCollectionResource.testRestrictSourceAndDest> $experiment_root/$TESTSUBJECT/outputs/$VER/t131 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestCopyFieldCollectionResource.testRestrictSourceAndDest $VER

echo " running test 132"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestDynamicFieldResource.testGetDynamicField> $experiment_root/$TESTSUBJECT/outputs/$VER/t132 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestDynamicFieldResource.testGetDynamicField $VER

echo " running test 133"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestDynamicFieldResource.testGetNotFoundDynamicField> $experiment_root/$TESTSUBJECT/outputs/$VER/t133 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestDynamicFieldResource.testGetNotFoundDynamicField $VER

echo " running test 134"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestDynamicFieldResource.testJsonGetDynamicField> $experiment_root/$TESTSUBJECT/outputs/$VER/t134 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestDynamicFieldResource.testJsonGetDynamicField $VER

echo " running test 135"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestManagedSchemaFieldResource.testAddFieldBadFieldType> $experiment_root/$TESTSUBJECT/outputs/$VER/t135 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestManagedSchemaFieldResource.testAddFieldBadFieldType $VER

echo " running test 136"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestManagedSchemaFieldResource.testAddFieldMismatchedName> $experiment_root/$TESTSUBJECT/outputs/$VER/t136 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestManagedSchemaFieldResource.testAddFieldMismatchedName $VER

echo " running test 137"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestManagedSchemaFieldResource.testAddFieldBadProperty> $experiment_root/$TESTSUBJECT/outputs/$VER/t137 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestManagedSchemaFieldResource.testAddFieldBadProperty $VER

echo " running test 138"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestManagedSchemaFieldResource.testAddField> $experiment_root/$TESTSUBJECT/outputs/$VER/t138 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestManagedSchemaFieldResource.testAddField $VER

echo " running test 139"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestManagedSchemaFieldResource.testPostMultipleFields> $experiment_root/$TESTSUBJECT/outputs/$VER/t139 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestManagedSchemaFieldResource.testPostMultipleFields $VER

echo " running test 140"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestFieldTypeCollectionResource.testGetAllFieldTypes> $experiment_root/$TESTSUBJECT/outputs/$VER/t140 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestFieldTypeCollectionResource.testGetAllFieldTypes $VER

echo " running test 141"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestFieldTypeCollectionResource.testJsonGetAllFieldTypes> $experiment_root/$TESTSUBJECT/outputs/$VER/t141 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestFieldTypeCollectionResource.testJsonGetAllFieldTypes $VER

echo " running test 142"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestFieldCollectionResource.testGetAllFields> $experiment_root/$TESTSUBJECT/outputs/$VER/t142 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestFieldCollectionResource.testGetAllFields $VER

echo " running test 143"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestFieldCollectionResource.testGetTwoFields> $experiment_root/$TESTSUBJECT/outputs/$VER/t143 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestFieldCollectionResource.testGetTwoFields $VER

echo " running test 144"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestFieldCollectionResource.testGetThreeFieldsDontIncludeDynamic> $experiment_root/$TESTSUBJECT/outputs/$VER/t144 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestFieldCollectionResource.testGetThreeFieldsDontIncludeDynamic $VER

echo " running test 145"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestFieldCollectionResource.testGetThreeFieldsIncludeDynamic> $experiment_root/$TESTSUBJECT/outputs/$VER/t145 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestFieldCollectionResource.testGetThreeFieldsIncludeDynamic $VER

echo " running test 146"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestFieldCollectionResource.testNotFoundFields> $experiment_root/$TESTSUBJECT/outputs/$VER/t146 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestFieldCollectionResource.testNotFoundFields $VER

echo " running test 147"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestFieldCollectionResource.testJsonGetAllFields> $experiment_root/$TESTSUBJECT/outputs/$VER/t147 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestFieldCollectionResource.testJsonGetAllFields $VER

echo " running test 148"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestFieldCollectionResource.testJsonGetTwoFields> $experiment_root/$TESTSUBJECT/outputs/$VER/t148 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestFieldCollectionResource.testJsonGetTwoFields $VER

echo " running test 149"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestFieldTypeResource.testGetFieldType> $experiment_root/$TESTSUBJECT/outputs/$VER/t149 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestFieldTypeResource.testGetFieldType $VER

echo " running test 150"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestFieldTypeResource.testGetNotFoundFieldType> $experiment_root/$TESTSUBJECT/outputs/$VER/t150 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestFieldTypeResource.testGetNotFoundFieldType $VER

echo " running test 151"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestFieldTypeResource.testJsonGetFieldType> $experiment_root/$TESTSUBJECT/outputs/$VER/t151 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestFieldTypeResource.testJsonGetFieldType $VER

echo " running test 152"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestFieldTypeResource.testGetFieldTypeDontShowDefaults> $experiment_root/$TESTSUBJECT/outputs/$VER/t152 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestFieldTypeResource.testGetFieldTypeDontShowDefaults $VER

echo " running test 153"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestSolrQueryParserResource.testGetSolrQueryParser> $experiment_root/$TESTSUBJECT/outputs/$VER/t153 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestSolrQueryParserResource.testGetSolrQueryParser $VER

echo " running test 154"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestDynamicFieldCollectionResource.testGetAllDynamicFields> $experiment_root/$TESTSUBJECT/outputs/$VER/t154 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestDynamicFieldCollectionResource.testGetAllDynamicFields $VER

echo " running test 155"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestDynamicFieldCollectionResource.testGetTwoDynamicFields> $experiment_root/$TESTSUBJECT/outputs/$VER/t155 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestDynamicFieldCollectionResource.testGetTwoDynamicFields $VER

echo " running test 156"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestDynamicFieldCollectionResource.testNotFoundDynamicFields> $experiment_root/$TESTSUBJECT/outputs/$VER/t156 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestDynamicFieldCollectionResource.testNotFoundDynamicFields $VER

echo " running test 157"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestDynamicFieldCollectionResource.testJsonGetAllDynamicFields> $experiment_root/$TESTSUBJECT/outputs/$VER/t157 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestDynamicFieldCollectionResource.testJsonGetAllDynamicFields $VER

echo " running test 158"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestDynamicFieldCollectionResource.testJsonGetTwoDynamicFields> $experiment_root/$TESTSUBJECT/outputs/$VER/t158 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestDynamicFieldCollectionResource.testJsonGetTwoDynamicFields $VER

echo " running test 159"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestClassNameShortening.testClassNamesNotShortened> $experiment_root/$TESTSUBJECT/outputs/$VER/t159 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestClassNameShortening.testClassNamesNotShortened $VER

echo " running test 160"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestClassNameShortening.testShortenedGlobalSimilarityStaysShortened> $experiment_root/$TESTSUBJECT/outputs/$VER/t160 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestClassNameShortening.testShortenedGlobalSimilarityStaysShortened $VER

echo " running test 161"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestClassNameShortening.testShortenedClassNamesStayShortened> $experiment_root/$TESTSUBJECT/outputs/$VER/t161 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestClassNameShortening.testShortenedClassNamesStayShortened $VER

echo " running test 162"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestSolrQueryParserDefaultOperatorResource.testGetDefaultOperator> $experiment_root/$TESTSUBJECT/outputs/$VER/t162 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestSolrQueryParserDefaultOperatorResource.testGetDefaultOperator $VER

echo " running test 163"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestSerializedLuceneMatchVersion.testExplicitLuceneMatchVersions> $experiment_root/$TESTSUBJECT/outputs/$VER/t163 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestSerializedLuceneMatchVersion.testExplicitLuceneMatchVersions $VER

echo " running test 164"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestSerializedLuceneMatchVersion.testNoLuceneMatchVersions> $experiment_root/$TESTSUBJECT/outputs/$VER/t164 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestSerializedLuceneMatchVersion.testNoLuceneMatchVersions $VER

echo " running test 165"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestUniqueKeyFieldResource.testGetUniqueKey> $experiment_root/$TESTSUBJECT/outputs/$VER/t165 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestUniqueKeyFieldResource.testGetUniqueKey $VER

echo " running test 166"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestSchemaSimilarityResource.testGetSchemaSimilarity> $experiment_root/$TESTSUBJECT/outputs/$VER/t166 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestSchemaSimilarityResource.testGetSchemaSimilarity $VER

echo " running test 167"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestSchemaResource.testXMLResponse> $experiment_root/$TESTSUBJECT/outputs/$VER/t167 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestSchemaResource.testXMLResponse $VER

echo " running test 168"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestSchemaResource.testJSONResponse> $experiment_root/$TESTSUBJECT/outputs/$VER/t168 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestSchemaResource.testJSONResponse $VER

echo " running test 169"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.rest.schema.TestSchemaResource.testSchemaXmlResponse> $experiment_root/$TESTSUBJECT/outputs/$VER/t169 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.rest.schema.TestSchemaResource.testSchemaXmlResponse $VER

echo " running test 170"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.FastVectorHighlighterTest.testConfig> $experiment_root/$TESTSUBJECT/outputs/$VER/t170 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.FastVectorHighlighterTest.testConfig $VER

echo " running test 171"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.FastVectorHighlighterTest.test> $experiment_root/$TESTSUBJECT/outputs/$VER/t171 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.FastVectorHighlighterTest.test $VER

echo " running test 172"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.HighlighterTest.testConfig> $experiment_root/$TESTSUBJECT/outputs/$VER/t172 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.HighlighterTest.testConfig $VER

echo " running test 173"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.HighlighterTest.testMergeContiguous> $experiment_root/$TESTSUBJECT/outputs/$VER/t173 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.HighlighterTest.testMergeContiguous $VER

echo " running test 174"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.HighlighterTest.testTermVecHighlight> $experiment_root/$TESTSUBJECT/outputs/$VER/t174 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.HighlighterTest.testTermVecHighlight $VER

echo " running test 175"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.HighlighterTest.testTermVectorWithoutOffsetsHighlight> $experiment_root/$TESTSUBJECT/outputs/$VER/t175 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.HighlighterTest.testTermVectorWithoutOffsetsHighlight $VER

echo " running test 176"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.HighlighterTest.testTermOffsetsTokenStream> $experiment_root/$TESTSUBJECT/outputs/$VER/t176 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.HighlighterTest.testTermOffsetsTokenStream $VER

echo " running test 177"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.HighlighterTest.testTermVecMultiValuedHighlight> $experiment_root/$TESTSUBJECT/outputs/$VER/t177 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.HighlighterTest.testTermVecMultiValuedHighlight $VER

echo " running test 178"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.HighlighterTest.testTermVecMultiValuedHighlight2> $experiment_root/$TESTSUBJECT/outputs/$VER/t178 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.HighlighterTest.testTermVecMultiValuedHighlight2 $VER

echo " running test 179"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.HighlighterTest.testDisMaxHighlight> $experiment_root/$TESTSUBJECT/outputs/$VER/t179 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.HighlighterTest.testDisMaxHighlight $VER

echo " running test 180"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.HighlighterTest.testMultiValueAnalysisHighlight> $experiment_root/$TESTSUBJECT/outputs/$VER/t180 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.HighlighterTest.testMultiValueAnalysisHighlight $VER

echo " running test 181"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.HighlighterTest.testMultiValueBestFragmentHighlight> $experiment_root/$TESTSUBJECT/outputs/$VER/t181 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.HighlighterTest.testMultiValueBestFragmentHighlight $VER

echo " running test 182"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.HighlighterTest.testPreserveMulti> $experiment_root/$TESTSUBJECT/outputs/$VER/t182 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.HighlighterTest.testPreserveMulti $VER

echo " running test 183"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.HighlighterTest.testDefaultFieldHighlight> $experiment_root/$TESTSUBJECT/outputs/$VER/t183 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.HighlighterTest.testDefaultFieldHighlight $VER

echo " running test 184"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.HighlighterTest.testHighlightDisabled> $experiment_root/$TESTSUBJECT/outputs/$VER/t184 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.HighlighterTest.testHighlightDisabled $VER

echo " running test 185"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.HighlighterTest.testTwoFieldHighlight> $experiment_root/$TESTSUBJECT/outputs/$VER/t185 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.HighlighterTest.testTwoFieldHighlight $VER

echo " running test 186"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.HighlighterTest.testFieldMatch> $experiment_root/$TESTSUBJECT/outputs/$VER/t186 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.HighlighterTest.testFieldMatch $VER

echo " running test 187"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.HighlighterTest.testCustomSimpleFormatterHighlight> $experiment_root/$TESTSUBJECT/outputs/$VER/t187 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.HighlighterTest.testCustomSimpleFormatterHighlight $VER

echo " running test 188"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.HighlighterTest.testLongFragment> $experiment_root/$TESTSUBJECT/outputs/$VER/t188 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.HighlighterTest.testLongFragment $VER

echo " running test 189"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.HighlighterTest.testMaxChars> $experiment_root/$TESTSUBJECT/outputs/$VER/t189 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.HighlighterTest.testMaxChars $VER

echo " running test 190"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.HighlighterTest.testRegexFragmenter> $experiment_root/$TESTSUBJECT/outputs/$VER/t190 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.HighlighterTest.testRegexFragmenter $VER

echo " running test 191"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.HighlighterTest.testVariableFragsize> $experiment_root/$TESTSUBJECT/outputs/$VER/t191 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.HighlighterTest.testVariableFragsize $VER

echo " running test 192"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.HighlighterTest.testAlternateSummary> $experiment_root/$TESTSUBJECT/outputs/$VER/t192 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.HighlighterTest.testAlternateSummary $VER

echo " running test 193"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.HighlighterTest.testPhraseHighlighter> $experiment_root/$TESTSUBJECT/outputs/$VER/t193 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.HighlighterTest.testPhraseHighlighter $VER

echo " running test 194"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.HighlighterTest.testGetHighlightFields> $experiment_root/$TESTSUBJECT/outputs/$VER/t194 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.HighlighterTest.testGetHighlightFields $VER

echo " running test 195"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.HighlighterTest.testDefaultFieldPrefixWildcardHighlight> $experiment_root/$TESTSUBJECT/outputs/$VER/t195 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.HighlighterTest.testDefaultFieldPrefixWildcardHighlight $VER

echo " running test 196"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.HighlighterTest.testDefaultFieldNonPrefixWildcardHighlight> $experiment_root/$TESTSUBJECT/outputs/$VER/t196 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.HighlighterTest.testDefaultFieldNonPrefixWildcardHighlight $VER

echo " running test 197"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.highlight.HighlighterTest.testMaxMvParams> $experiment_root/$TESTSUBJECT/outputs/$VER/t197 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.highlight.HighlighterTest.testMaxMvParams $VER

echo " running test 198"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.analysis.TestReversedWildcardFilterFactory.testReversedTokens> $experiment_root/$TESTSUBJECT/outputs/$VER/t198 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.analysis.TestReversedWildcardFilterFactory.testReversedTokens $VER

echo " running test 199"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.analysis.TestReversedWildcardFilterFactory.testIndexingAnalysis> $experiment_root/$TESTSUBJECT/outputs/$VER/t199 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.analysis.TestReversedWildcardFilterFactory.testIndexingAnalysis $VER

echo " running test 200"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.analysis.TestReversedWildcardFilterFactory.testQueryParsing> $experiment_root/$TESTSUBJECT/outputs/$VER/t200 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.analysis.TestReversedWildcardFilterFactory.testQueryParsing $VER

echo " running test 201"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.analysis.TestReversedWildcardFilterFactory.testFalsePositives> $experiment_root/$TESTSUBJECT/outputs/$VER/t201 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.analysis.TestReversedWildcardFilterFactory.testFalsePositives $VER

echo " running test 202"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.analysis.TestWordDelimiterFilterFactory.testRetainPositionIncrement> $experiment_root/$TESTSUBJECT/outputs/$VER/t202 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.analysis.TestWordDelimiterFilterFactory.testRetainPositionIncrement $VER

echo " running test 203"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.analysis.TestWordDelimiterFilterFactory.testNoGenerationEdgeCase> $experiment_root/$TESTSUBJECT/outputs/$VER/t203 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.analysis.TestWordDelimiterFilterFactory.testNoGenerationEdgeCase $VER

echo " running test 204"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.analysis.TestWordDelimiterFilterFactory.testIgnoreCaseChange> $experiment_root/$TESTSUBJECT/outputs/$VER/t204 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.analysis.TestWordDelimiterFilterFactory.testIgnoreCaseChange $VER

echo " running test 205"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.analysis.TestWordDelimiterFilterFactory.testPreserveOrignalTrue> $experiment_root/$TESTSUBJECT/outputs/$VER/t205 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.analysis.TestWordDelimiterFilterFactory.testPreserveOrignalTrue $VER

echo " running test 206"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.analysis.TestWordDelimiterFilterFactory.testAlphaNumericWords> $experiment_root/$TESTSUBJECT/outputs/$VER/t206 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.analysis.TestWordDelimiterFilterFactory.testAlphaNumericWords $VER

echo " running test 207"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.analysis.TestWordDelimiterFilterFactory.testProtectedWords> $experiment_root/$TESTSUBJECT/outputs/$VER/t207 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.analysis.TestWordDelimiterFilterFactory.testProtectedWords $VER

echo " running test 208"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.analysis.TestWordDelimiterFilterFactory.testCustomTypes> $experiment_root/$TESTSUBJECT/outputs/$VER/t208 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.analysis.TestWordDelimiterFilterFactory.testCustomTypes $VER

echo " running test 209"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.AlternateDirectoryTest.testAltDirectoryUsed> $experiment_root/$TESTSUBJECT/outputs/$VER/t209 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.AlternateDirectoryTest.testAltDirectoryUsed $VER

echo " running test 210"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.PluginInfoTest.testNameRequired> $experiment_root/$TESTSUBJECT/outputs/$VER/t210 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.PluginInfoTest.testNameRequired $VER

echo " running test 211"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.PluginInfoTest.testClassRequired> $experiment_root/$TESTSUBJECT/outputs/$VER/t211 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.PluginInfoTest.testClassRequired $VER

echo " running test 212"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.PluginInfoTest.testIsEnabled> $experiment_root/$TESTSUBJECT/outputs/$VER/t212 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.PluginInfoTest.testIsEnabled $VER

echo " running test 213"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.PluginInfoTest.testIsDefault> $experiment_root/$TESTSUBJECT/outputs/$VER/t213 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.PluginInfoTest.testIsDefault $VER

echo " running test 214"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.PluginInfoTest.testNoChildren> $experiment_root/$TESTSUBJECT/outputs/$VER/t214 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.PluginInfoTest.testNoChildren $VER

echo " running test 215"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.PluginInfoTest.testHasChildren> $experiment_root/$TESTSUBJECT/outputs/$VER/t215 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.PluginInfoTest.testHasChildren $VER

echo " running test 216"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.PluginInfoTest.testChild> $experiment_root/$TESTSUBJECT/outputs/$VER/t216 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.PluginInfoTest.testChild $VER

echo " running test 217"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.PluginInfoTest.testChildren> $experiment_root/$TESTSUBJECT/outputs/$VER/t217 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.PluginInfoTest.testChildren $VER

echo " running test 218"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.PluginInfoTest.testInitArgsCount> $experiment_root/$TESTSUBJECT/outputs/$VER/t218 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.PluginInfoTest.testInitArgsCount $VER

echo " running test 219"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestQuerySenderNoQuery.testRequestHandlerRegistry> $experiment_root/$TESTSUBJECT/outputs/$VER/t219 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestQuerySenderNoQuery.testRequestHandlerRegistry $VER

echo " running test 220"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestQuerySenderNoQuery.testSearcherEvents> $experiment_root/$TESTSUBJECT/outputs/$VER/t220 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestQuerySenderNoQuery.testSearcherEvents $VER

echo " running test 221"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.QueryResultKeyTest.testFiltersHashCode> $experiment_root/$TESTSUBJECT/outputs/$VER/t221 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.QueryResultKeyTest.testFiltersHashCode $VER

echo " running test 222"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestCoreDiscovery.testDiscovery> $experiment_root/$TESTSUBJECT/outputs/$VER/t222 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestCoreDiscovery.testDiscovery $VER

echo " running test 223"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestCoreDiscovery.testDuplicateNames> $experiment_root/$TESTSUBJECT/outputs/$VER/t223 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestCoreDiscovery.testDuplicateNames $VER

echo " running test 224"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestCoreDiscovery.testAlternateCoreDir> $experiment_root/$TESTSUBJECT/outputs/$VER/t224 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestCoreDiscovery.testAlternateCoreDir $VER

echo " running test 225"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestCoreDiscovery.testNoCoreDir> $experiment_root/$TESTSUBJECT/outputs/$VER/t225 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestCoreDiscovery.testNoCoreDir $VER

echo " running test 226"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestJmxIntegration.testJmxRegistration> $experiment_root/$TESTSUBJECT/outputs/$VER/t226 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestJmxIntegration.testJmxRegistration $VER

echo " running test 227"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestJmxIntegration.testJmxUpdate> $experiment_root/$TESTSUBJECT/outputs/$VER/t227 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestJmxIntegration.testJmxUpdate $VER

echo " running test 228"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestJmxIntegration.testJmxOnCoreReload> $experiment_root/$TESTSUBJECT/outputs/$VER/t228 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestJmxIntegration.testJmxOnCoreReload $VER

echo " running test 229"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.RequestHandlersTest.testInitCount> $experiment_root/$TESTSUBJECT/outputs/$VER/t229 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.RequestHandlersTest.testInitCount $VER

echo " running test 230"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.RequestHandlersTest.testLazyLoading> $experiment_root/$TESTSUBJECT/outputs/$VER/t230 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.RequestHandlersTest.testLazyLoading $VER

echo " running test 231"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.RequestHandlersTest.testPathNormalization> $experiment_root/$TESTSUBJECT/outputs/$VER/t231 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.RequestHandlersTest.testPathNormalization $VER

echo " running test 232"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.RequestHandlersTest.testStatistics> $experiment_root/$TESTSUBJECT/outputs/$VER/t232 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.RequestHandlersTest.testStatistics $VER

echo " running test 233"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.SolrCoreCheckLockOnStartupTest.testSimpleLockErrorOnStartup> $experiment_root/$TESTSUBJECT/outputs/$VER/t233 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.SolrCoreCheckLockOnStartupTest.testSimpleLockErrorOnStartup $VER

echo " running test 234"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.SolrCoreCheckLockOnStartupTest.testNativeLockErrorOnStartup> $experiment_root/$TESTSUBJECT/outputs/$VER/t234 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.SolrCoreCheckLockOnStartupTest.testNativeLockErrorOnStartup $VER

echo " running test 235"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestLazyCores.testLazyLoad> $experiment_root/$TESTSUBJECT/outputs/$VER/t235 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestLazyCores.testLazyLoad $VER

echo " running test 236"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestLazyCores.testLazySearch> $experiment_root/$TESTSUBJECT/outputs/$VER/t236 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestLazyCores.testLazySearch $VER

echo " running test 237"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestLazyCores.testCachingLimit> $experiment_root/$TESTSUBJECT/outputs/$VER/t237 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestLazyCores.testCachingLimit $VER

echo " running test 238"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestLazyCores.testRace> $experiment_root/$TESTSUBJECT/outputs/$VER/t238 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestLazyCores.testRace $VER

echo " running test 239"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestLazyCores.testCreateSame> $experiment_root/$TESTSUBJECT/outputs/$VER/t239 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestLazyCores.testCreateSame $VER

echo " running test 240"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestLazyCores.testPersistence> $experiment_root/$TESTSUBJECT/outputs/$VER/t240 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestLazyCores.testPersistence $VER

echo " running test 241"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.SolrCoreTest.testRemoveThenAddDefaultCore> $experiment_root/$TESTSUBJECT/outputs/$VER/t241 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.SolrCoreTest.testRemoveThenAddDefaultCore $VER

echo " running test 242"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.SolrCoreTest.testRequestHandlerRegistry> $experiment_root/$TESTSUBJECT/outputs/$VER/t242 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.SolrCoreTest.testRequestHandlerRegistry $VER

echo " running test 243"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.SolrCoreTest.testClose> $experiment_root/$TESTSUBJECT/outputs/$VER/t243 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.SolrCoreTest.testClose $VER

echo " running test 244"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.SolrCoreTest.testRefCount> $experiment_root/$TESTSUBJECT/outputs/$VER/t244 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.SolrCoreTest.testRefCount $VER

echo " running test 245"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.SolrCoreTest.testRefCountMT> $experiment_root/$TESTSUBJECT/outputs/$VER/t245 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.SolrCoreTest.testRefCountMT $VER

echo " running test 246"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.SolrCoreTest.testInfoRegistry> $experiment_root/$TESTSUBJECT/outputs/$VER/t246 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.SolrCoreTest.testInfoRegistry $VER

echo " running test 247"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestConfig.testLib> $experiment_root/$TESTSUBJECT/outputs/$VER/t247 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestConfig.testLib $VER

echo " running test 248"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestConfig.testJavaProperty> $experiment_root/$TESTSUBJECT/outputs/$VER/t248 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestConfig.testJavaProperty $VER

echo " running test 249"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestConfig.testLucene23Upgrades> $experiment_root/$TESTSUBJECT/outputs/$VER/t249 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestConfig.testLucene23Upgrades $VER

echo " running test 250"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestConfig.testAutomaticDeprecationSupport> $experiment_root/$TESTSUBJECT/outputs/$VER/t250 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestConfig.testAutomaticDeprecationSupport $VER

echo " running test 251"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestConfig.testTermIndexInterval> $experiment_root/$TESTSUBJECT/outputs/$VER/t251 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestConfig.testTermIndexInterval $VER

echo " running test 252"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestConfig.testTermIndexDivisor> $experiment_root/$TESTSUBJECT/outputs/$VER/t252 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestConfig.testTermIndexDivisor $VER

echo " running test 253"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestConfig.testDefaults> $experiment_root/$TESTSUBJECT/outputs/$VER/t253 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestConfig.testDefaults $VER

echo " running test 254"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestJmxMonitoredMap.testTypeName> $experiment_root/$TESTSUBJECT/outputs/$VER/t254 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestJmxMonitoredMap.testTypeName $VER

echo " running test 255"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestJmxMonitoredMap.testPutRemoveClear> $experiment_root/$TESTSUBJECT/outputs/$VER/t255 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestJmxMonitoredMap.testPutRemoveClear $VER

echo " running test 256"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestCoreContainer.testShareSchema> $experiment_root/$TESTSUBJECT/outputs/$VER/t256 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestCoreContainer.testShareSchema $VER

echo " running test 257"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestCoreContainer.testReloadSequential> $experiment_root/$TESTSUBJECT/outputs/$VER/t257 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestCoreContainer.testReloadSequential $VER

echo " running test 258"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestCoreContainer.testReloadThreaded> $experiment_root/$TESTSUBJECT/outputs/$VER/t258 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestCoreContainer.testReloadThreaded $VER

echo " running test 259"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestCoreContainer.testPersist> $experiment_root/$TESTSUBJECT/outputs/$VER/t259 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestCoreContainer.testPersist $VER

echo " running test 260"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestCoreContainer.testNoCores> $experiment_root/$TESTSUBJECT/outputs/$VER/t260 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestCoreContainer.testNoCores $VER

echo " running test 261"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestCoreContainer.testClassLoaderHierarchy> $experiment_root/$TESTSUBJECT/outputs/$VER/t261 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestCoreContainer.testClassLoaderHierarchy $VER

echo " running test 262"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestCoreContainer.testSharedLib> $experiment_root/$TESTSUBJECT/outputs/$VER/t262 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestCoreContainer.testSharedLib $VER

echo " running test 263"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestSolrXml.testAllInfoPresent> $experiment_root/$TESTSUBJECT/outputs/$VER/t263 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestSolrXml.testAllInfoPresent $VER

echo " running test 264"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestArbitraryIndexDir.testLoadNewIndexDir> $experiment_root/$TESTSUBJECT/outputs/$VER/t264 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestArbitraryIndexDir.testLoadNewIndexDir $VER

echo " running test 265"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestQuerySenderListener.testRequestHandlerRegistry> $experiment_root/$TESTSUBJECT/outputs/$VER/t265 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestQuerySenderListener.testRequestHandlerRegistry $VER

echo " running test 266"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestQuerySenderListener.testSearcherEvents> $experiment_root/$TESTSUBJECT/outputs/$VER/t266 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestQuerySenderListener.testSearcherEvents $VER

echo " running test 267"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestPropInjectDefaults.testMergePolicyDefaults> $experiment_root/$TESTSUBJECT/outputs/$VER/t267 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestPropInjectDefaults.testMergePolicyDefaults $VER

echo " running test 268"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestPropInjectDefaults.testPropsDefaults> $experiment_root/$TESTSUBJECT/outputs/$VER/t268 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestPropInjectDefaults.testPropsDefaults $VER

echo " running test 269"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestSolrDeletionPolicy1.testKeepOptimizedOnlyCommits> $experiment_root/$TESTSUBJECT/outputs/$VER/t269 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestSolrDeletionPolicy1.testKeepOptimizedOnlyCommits $VER

echo " running test 270"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestSolrDeletionPolicy1.testNumCommitsConfigured> $experiment_root/$TESTSUBJECT/outputs/$VER/t270 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestSolrDeletionPolicy1.testNumCommitsConfigured $VER

echo " running test 271"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestSolrDeletionPolicy1.testCommitAge> $experiment_root/$TESTSUBJECT/outputs/$VER/t271 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestSolrDeletionPolicy1.testCommitAge $VER

echo " running test 272"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestSolrXMLSerializer.basicUsageTest> $experiment_root/$TESTSUBJECT/outputs/$VER/t272 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestSolrXMLSerializer.basicUsageTest $VER

echo " running test 273"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.OpenCloseCoreStressTest.test30SecondsOld> $experiment_root/$TESTSUBJECT/outputs/$VER/t273 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.OpenCloseCoreStressTest.test30SecondsOld $VER

echo " running test 274"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.OpenCloseCoreStressTest.test30SecondsNew> $experiment_root/$TESTSUBJECT/outputs/$VER/t274 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.OpenCloseCoreStressTest.test30SecondsNew $VER

echo " running test 275"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.OpenCloseCoreStressTest.test10MinutesOld> $experiment_root/$TESTSUBJECT/outputs/$VER/t275 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.OpenCloseCoreStressTest.test10MinutesOld $VER

echo " running test 276"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.OpenCloseCoreStressTest.test10MinutesNew> $experiment_root/$TESTSUBJECT/outputs/$VER/t276 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.OpenCloseCoreStressTest.test10MinutesNew $VER

echo " running test 277"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.OpenCloseCoreStressTest.test1HourOld> $experiment_root/$TESTSUBJECT/outputs/$VER/t277 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.OpenCloseCoreStressTest.test1HourOld $VER

echo " running test 278"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.OpenCloseCoreStressTest.test1HourNew> $experiment_root/$TESTSUBJECT/outputs/$VER/t278 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.OpenCloseCoreStressTest.test1HourNew $VER

echo " running test 279"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.TestSolrDeletionPolicy2.testFakeDeletionPolicyClass> $experiment_root/$TESTSUBJECT/outputs/$VER/t279 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.TestSolrDeletionPolicy2.testFakeDeletionPolicyClass $VER

echo " running test 280"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.core.CachingDirectoryFactoryTest.stressTest> $experiment_root/$TESTSUBJECT/outputs/$VER/t280 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.core.CachingDirectoryFactoryTest.stressTest $VER

echo " running test 281"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.ConvertedLegacyTest.testABunchOfConvertedStuff> $experiment_root/$TESTSUBJECT/outputs/$VER/t281 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.ConvertedLegacyTest.testABunchOfConvertedStuff $VER

echo " running test 282"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.CurrencyFieldOpenExchangeTest.testCurrencySchema> $experiment_root/$TESTSUBJECT/outputs/$VER/t282 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.CurrencyFieldOpenExchangeTest.testCurrencySchema $VER

echo " running test 283"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.CurrencyFieldOpenExchangeTest.testCurrencyFieldType> $experiment_root/$TESTSUBJECT/outputs/$VER/t283 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.CurrencyFieldOpenExchangeTest.testCurrencyFieldType $VER

echo " running test 284"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.CurrencyFieldOpenExchangeTest.testMockExchangeRateProvider> $experiment_root/$TESTSUBJECT/outputs/$VER/t284 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.CurrencyFieldOpenExchangeTest.testMockExchangeRateProvider $VER

echo " running test 285"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.CurrencyFieldOpenExchangeTest.testCurrencyRangeSearch> $experiment_root/$TESTSUBJECT/outputs/$VER/t285 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.CurrencyFieldOpenExchangeTest.testCurrencyRangeSearch $VER

echo " running test 286"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.CurrencyFieldOpenExchangeTest.testBogusCurrency> $experiment_root/$TESTSUBJECT/outputs/$VER/t286 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.CurrencyFieldOpenExchangeTest.testBogusCurrency $VER

echo " running test 287"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.CurrencyFieldOpenExchangeTest.testCurrencyPointQuery> $experiment_root/$TESTSUBJECT/outputs/$VER/t287 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.CurrencyFieldOpenExchangeTest.testCurrencyPointQuery $VER

echo " running test 288"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.CurrencyFieldOpenExchangeTest.testCurrencySort> $experiment_root/$TESTSUBJECT/outputs/$VER/t288 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.CurrencyFieldOpenExchangeTest.testCurrencySort $VER

echo " running test 289"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.CurrencyFieldOpenExchangeTest.testMockFieldType> $experiment_root/$TESTSUBJECT/outputs/$VER/t289 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.CurrencyFieldOpenExchangeTest.testMockFieldType $VER

echo " running test 290"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.OpenExchangeRatesOrgProviderTest.testInit> $experiment_root/$TESTSUBJECT/outputs/$VER/t290 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.OpenExchangeRatesOrgProviderTest.testInit $VER

echo " running test 291"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.OpenExchangeRatesOrgProviderTest.testList> $experiment_root/$TESTSUBJECT/outputs/$VER/t291 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.OpenExchangeRatesOrgProviderTest.testList $VER

echo " running test 292"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.OpenExchangeRatesOrgProviderTest.testGetExchangeRate> $experiment_root/$TESTSUBJECT/outputs/$VER/t292 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.OpenExchangeRatesOrgProviderTest.testGetExchangeRate $VER

echo " running test 293"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.OpenExchangeRatesOrgProviderTest.testReload> $experiment_root/$TESTSUBJECT/outputs/$VER/t293 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.OpenExchangeRatesOrgProviderTest.testReload $VER

echo " running test 294"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.OpenExchangeRatesOrgProviderTest.testNoInit> $experiment_root/$TESTSUBJECT/outputs/$VER/t294 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.OpenExchangeRatesOrgProviderTest.testNoInit $VER

echo " running test 295"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.IndexSchemaTest.testDynamicCopy> $experiment_root/$TESTSUBJECT/outputs/$VER/t295 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.IndexSchemaTest.testDynamicCopy $VER

echo " running test 296"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.IndexSchemaTest.testIsDynamicField> $experiment_root/$TESTSUBJECT/outputs/$VER/t296 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.IndexSchemaTest.testIsDynamicField $VER

echo " running test 297"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.IndexSchemaTest.testProperties> $experiment_root/$TESTSUBJECT/outputs/$VER/t297 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.IndexSchemaTest.testProperties $VER

echo " running test 298"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.PrimitiveFieldTypeTest.testDefaultOmitNorms> $experiment_root/$TESTSUBJECT/outputs/$VER/t298 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.PrimitiveFieldTypeTest.testDefaultOmitNorms $VER

echo " running test 299"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.SynonymTokenizerTest.testSchemaLoading> $experiment_root/$TESTSUBJECT/outputs/$VER/t299 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.SynonymTokenizerTest.testSchemaLoading $VER

echo " running test 300"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.NumericFieldsTest.testSortMissingFirstLast> $experiment_root/$TESTSUBJECT/outputs/$VER/t300 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.NumericFieldsTest.testSortMissingFirstLast $VER

echo " running test 301"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.IndexSchemaRuntimeFieldTest.testRuntimeFieldCreation> $experiment_root/$TESTSUBJECT/outputs/$VER/t301 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.IndexSchemaRuntimeFieldTest.testRuntimeFieldCreation $VER

echo " running test 302"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.NotRequiredUniqueKeyTest.testSchemaLoading> $experiment_root/$TESTSUBJECT/outputs/$VER/t302 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.NotRequiredUniqueKeyTest.testSchemaLoading $VER

echo " running test 303"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.PolyFieldTest.testSchemaBasics> $experiment_root/$TESTSUBJECT/outputs/$VER/t303 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.PolyFieldTest.testSchemaBasics $VER

echo " running test 304"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.PolyFieldTest.testPointFieldType> $experiment_root/$TESTSUBJECT/outputs/$VER/t304 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.PolyFieldTest.testPointFieldType $VER

echo " running test 305"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.PolyFieldTest.testSearching> $experiment_root/$TESTSUBJECT/outputs/$VER/t305 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.PolyFieldTest.testSearching $VER

echo " running test 306"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.PolyFieldTest.testSearchDetails> $experiment_root/$TESTSUBJECT/outputs/$VER/t306 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.PolyFieldTest.testSearchDetails $VER

echo " running test 307"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.CurrencyFieldXmlFileTest.testAsymetricPointQuery> $experiment_root/$TESTSUBJECT/outputs/$VER/t307 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.CurrencyFieldXmlFileTest.testAsymetricPointQuery $VER

echo " running test 308"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.CurrencyFieldXmlFileTest.testCurrencySchema> $experiment_root/$TESTSUBJECT/outputs/$VER/t308 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.CurrencyFieldXmlFileTest.testCurrencySchema $VER

echo " running test 309"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.CurrencyFieldXmlFileTest.testCurrencyFieldType> $experiment_root/$TESTSUBJECT/outputs/$VER/t309 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.CurrencyFieldXmlFileTest.testCurrencyFieldType $VER

echo " running test 310"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.CurrencyFieldXmlFileTest.testMockExchangeRateProvider> $experiment_root/$TESTSUBJECT/outputs/$VER/t310 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.CurrencyFieldXmlFileTest.testMockExchangeRateProvider $VER

echo " running test 311"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.CurrencyFieldXmlFileTest.testCurrencyRangeSearch> $experiment_root/$TESTSUBJECT/outputs/$VER/t311 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.CurrencyFieldXmlFileTest.testCurrencyRangeSearch $VER

echo " running test 312"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.CurrencyFieldXmlFileTest.testBogusCurrency> $experiment_root/$TESTSUBJECT/outputs/$VER/t312 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.CurrencyFieldXmlFileTest.testBogusCurrency $VER

echo " running test 313"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.CurrencyFieldXmlFileTest.testCurrencyPointQuery> $experiment_root/$TESTSUBJECT/outputs/$VER/t313 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.CurrencyFieldXmlFileTest.testCurrencyPointQuery $VER

echo " running test 314"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.CurrencyFieldXmlFileTest.testCurrencySort> $experiment_root/$TESTSUBJECT/outputs/$VER/t314 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.CurrencyFieldXmlFileTest.testCurrencySort $VER

echo " running test 315"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.CurrencyFieldXmlFileTest.testMockFieldType> $experiment_root/$TESTSUBJECT/outputs/$VER/t315 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.CurrencyFieldXmlFileTest.testMockFieldType $VER

echo " running test 316"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.ExternalFileFieldSortTest.testSort> $experiment_root/$TESTSUBJECT/outputs/$VER/t316 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.ExternalFileFieldSortTest.testSort $VER

echo " running test 317"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.RequiredFieldsTest.testRequiredFieldsConfig> $experiment_root/$TESTSUBJECT/outputs/$VER/t317 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.RequiredFieldsTest.testRequiredFieldsConfig $VER

echo " running test 318"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.RequiredFieldsTest.testRequiredFieldsSingleAdd> $experiment_root/$TESTSUBJECT/outputs/$VER/t318 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.RequiredFieldsTest.testRequiredFieldsSingleAdd $VER

echo " running test 319"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.RequiredFieldsTest.testAddMultipleDocumentsWithErrors> $experiment_root/$TESTSUBJECT/outputs/$VER/t319 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.RequiredFieldsTest.testAddMultipleDocumentsWithErrors $VER

echo " running test 320"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.CopyFieldTest.testCopyFieldSchemaFieldSchemaField> $experiment_root/$TESTSUBJECT/outputs/$VER/t320 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.CopyFieldTest.testCopyFieldSchemaFieldSchemaField $VER

echo " running test 321"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.CopyFieldTest.testCopyFieldSchemaFieldSchemaFieldInt> $experiment_root/$TESTSUBJECT/outputs/$VER/t321 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.CopyFieldTest.testCopyFieldSchemaFieldSchemaFieldInt $VER

echo " running test 322"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.CopyFieldTest.testGetSource> $experiment_root/$TESTSUBJECT/outputs/$VER/t322 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.CopyFieldTest.testGetSource $VER

echo " running test 323"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.CopyFieldTest.testGetDestination> $experiment_root/$TESTSUBJECT/outputs/$VER/t323 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.CopyFieldTest.testGetDestination $VER

echo " running test 324"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.CopyFieldTest.testGetMaxChars> $experiment_root/$TESTSUBJECT/outputs/$VER/t324 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.CopyFieldTest.testGetMaxChars $VER

echo " running test 325"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.CopyFieldTest.testCopyFieldFunctionality> $experiment_root/$TESTSUBJECT/outputs/$VER/t325 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.CopyFieldTest.testCopyFieldFunctionality $VER

echo " running test 326"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.CopyFieldTest.testExplicitSourceGlob> $experiment_root/$TESTSUBJECT/outputs/$VER/t326 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.CopyFieldTest.testExplicitSourceGlob $VER

echo " running test 327"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.CopyFieldTest.testSourceGlobMatchesNoDynamicOrExplicitField> $experiment_root/$TESTSUBJECT/outputs/$VER/t327 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.CopyFieldTest.testSourceGlobMatchesNoDynamicOrExplicitField $VER

echo " running test 328"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.PreAnalyzedFieldTest.testValidSimple> $experiment_root/$TESTSUBJECT/outputs/$VER/t328 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.PreAnalyzedFieldTest.testValidSimple $VER

echo " running test 329"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.PreAnalyzedFieldTest.testInvalidSimple> $experiment_root/$TESTSUBJECT/outputs/$VER/t329 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.PreAnalyzedFieldTest.testInvalidSimple $VER

echo " running test 330"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.PreAnalyzedFieldTest.testParsers> $experiment_root/$TESTSUBJECT/outputs/$VER/t330 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.PreAnalyzedFieldTest.testParsers $VER

echo " running test 331"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.MultiTermTest.testMultiFound> $experiment_root/$TESTSUBJECT/outputs/$VER/t331 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.MultiTermTest.testMultiFound $VER

echo " running test 332"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.MultiTermTest.testQueryCopiedToMulti> $experiment_root/$TESTSUBJECT/outputs/$VER/t332 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.MultiTermTest.testQueryCopiedToMulti $VER

echo " running test 333"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.schema.MultiTermTest.testDefaultCopiedToMulti> $experiment_root/$TESTSUBJECT/outputs/$VER/t333 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.schema.MultiTermTest.testDefaultCopiedToMulti $VER

echo " running test 334"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestPluginEnable.testSimple> $experiment_root/$TESTSUBJECT/outputs/$VER/t334 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestPluginEnable.testSimple $VER

echo " running test 335"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.OutputWriterTest.testSOLR59responseHeaderVersions> $experiment_root/$TESTSUBJECT/outputs/$VER/t335 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.OutputWriterTest.testSOLR59responseHeaderVersions $VER

echo " running test 336"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.OutputWriterTest.testUselessWriter> $experiment_root/$TESTSUBJECT/outputs/$VER/t336 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.OutputWriterTest.testUselessWriter $VER

echo " running test 337"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.OutputWriterTest.testTrivialXsltWriter> $experiment_root/$TESTSUBJECT/outputs/$VER/t337 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.OutputWriterTest.testTrivialXsltWriter $VER

echo " running test 338"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.OutputWriterTest.testTrivialXsltWriterInclude> $experiment_root/$TESTSUBJECT/outputs/$VER/t338 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.OutputWriterTest.testTrivialXsltWriterInclude $VER

echo " running test 339"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestReload.testGetRealtimeReload> $experiment_root/$TESTSUBJECT/outputs/$VER/t339 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestReload.testGetRealtimeReload $VER

echo " running test 340"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestElisionMultitermQuery.testElisionMultitermQuery> $experiment_root/$TESTSUBJECT/outputs/$VER/t340 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestElisionMultitermQuery.testElisionMultitermQuery $VER

echo " running test 341"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestStressReorder.testStressReorderVersions> $experiment_root/$TESTSUBJECT/outputs/$VER/t341 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestStressReorder.testStressReorderVersions $VER

echo " running test 342"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestValueSourceCache.testGeodistSource> $experiment_root/$TESTSUBJECT/outputs/$VER/t342 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestValueSourceCache.testGeodistSource $VER

echo " running test 343"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestValueSourceCache.testNumerics> $experiment_root/$TESTSUBJECT/outputs/$VER/t343 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestValueSourceCache.testNumerics $VER

echo " running test 344"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestComponentsName.testComponentsName> $experiment_root/$TESTSUBJECT/outputs/$VER/t344 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestComponentsName.testComponentsName $VER

echo " running test 345"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.QueryParsingTest.testSort> $experiment_root/$TESTSUBJECT/outputs/$VER/t345 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.QueryParsingTest.testSort $VER

echo " running test 346"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.QueryParsingTest.testBad> $experiment_root/$TESTSUBJECT/outputs/$VER/t346 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.QueryParsingTest.testBad $VER

echo " running test 347"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestFiltering.testRandomFiltering> $experiment_root/$TESTSUBJECT/outputs/$VER/t347 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestFiltering.testRandomFiltering $VER

echo " running test 348"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestStressVersions.testStressGetRealtimeVersions> $experiment_root/$TESTSUBJECT/outputs/$VER/t348 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestStressVersions.testStressGetRealtimeVersions $VER

echo " running test 349"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.ReturnFieldsTest.testCopyRename> $experiment_root/$TESTSUBJECT/outputs/$VER/t349 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.ReturnFieldsTest.testCopyRename $VER

echo " running test 350"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.ReturnFieldsTest.testSeparators> $experiment_root/$TESTSUBJECT/outputs/$VER/t350 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.ReturnFieldsTest.testSeparators $VER

echo " running test 351"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.ReturnFieldsTest.testWilcards> $experiment_root/$TESTSUBJECT/outputs/$VER/t351 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.ReturnFieldsTest.testWilcards $VER

echo " running test 352"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.ReturnFieldsTest.testManyParameters> $experiment_root/$TESTSUBJECT/outputs/$VER/t352 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.ReturnFieldsTest.testManyParameters $VER

echo " running test 353"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.ReturnFieldsTest.testFunctions> $experiment_root/$TESTSUBJECT/outputs/$VER/t353 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.ReturnFieldsTest.testFunctions $VER

echo " running test 354"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.ReturnFieldsTest.testTransformers> $experiment_root/$TESTSUBJECT/outputs/$VER/t354 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.ReturnFieldsTest.testTransformers $VER

echo " running test 355"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.ReturnFieldsTest.testAliases> $experiment_root/$TESTSUBJECT/outputs/$VER/t355 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.ReturnFieldsTest.testAliases $VER

echo " running test 356"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.ReturnFieldsTest.testHyphenInFieldName> $experiment_root/$TESTSUBJECT/outputs/$VER/t356 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.ReturnFieldsTest.testHyphenInFieldName $VER

echo " running test 357"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.ReturnFieldsTest.testTrailingDotInFieldName> $experiment_root/$TESTSUBJECT/outputs/$VER/t357 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.ReturnFieldsTest.testTrailingDotInFieldName $VER

echo " running test 358"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.ReturnFieldsTest.testTrailingDollarInFieldName> $experiment_root/$TESTSUBJECT/outputs/$VER/t358 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.ReturnFieldsTest.testTrailingDollarInFieldName $VER

echo " running test 359"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.ReturnFieldsTest.testFunkyFieldNames> $experiment_root/$TESTSUBJECT/outputs/$VER/t359 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.ReturnFieldsTest.testFunkyFieldNames $VER

echo " running test 360"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestRealTimeGet.testGetRealtime> $experiment_root/$TESTSUBJECT/outputs/$VER/t360 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestRealTimeGet.testGetRealtime $VER

echo " running test 361"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestRealTimeGet.testVersions> $experiment_root/$TESTSUBJECT/outputs/$VER/t361 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestRealTimeGet.testVersions $VER

echo " running test 362"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestRealTimeGet.testOptimisticLocking> $experiment_root/$TESTSUBJECT/outputs/$VER/t362 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestRealTimeGet.testOptimisticLocking $VER

echo " running test 363"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestRealTimeGet.testStressGetRealtime> $experiment_root/$TESTSUBJECT/outputs/$VER/t363 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestRealTimeGet.testStressGetRealtime $VER

echo " running test 364"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.SpatialFilterTest.testPoints> $experiment_root/$TESTSUBJECT/outputs/$VER/t364 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.SpatialFilterTest.testPoints $VER

echo " running test 365"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.SpatialFilterTest.testGeoHash> $experiment_root/$TESTSUBJECT/outputs/$VER/t365 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.SpatialFilterTest.testGeoHash $VER

echo " running test 366"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.SpatialFilterTest.testLatLonType> $experiment_root/$TESTSUBJECT/outputs/$VER/t366 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.SpatialFilterTest.testLatLonType $VER

echo " running test 367"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestStressLucene.testStressLuceneNRT> $experiment_root/$TESTSUBJECT/outputs/$VER/t367 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestStressLucene.testStressLuceneNRT $VER

echo " running test 368"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestMaxScoreQueryParser.testFallbackToLucene> $experiment_root/$TESTSUBJECT/outputs/$VER/t368 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestMaxScoreQueryParser.testFallbackToLucene $VER

echo " running test 369"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestMaxScoreQueryParser.testNoShouldClauses> $experiment_root/$TESTSUBJECT/outputs/$VER/t369 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestMaxScoreQueryParser.testNoShouldClauses $VER

echo " running test 370"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestMaxScoreQueryParser.testPureMax> $experiment_root/$TESTSUBJECT/outputs/$VER/t370 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestMaxScoreQueryParser.testPureMax $VER

echo " running test 371"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestMaxScoreQueryParser.testMaxAndProhibited> $experiment_root/$TESTSUBJECT/outputs/$VER/t371 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestMaxScoreQueryParser.testMaxAndProhibited $VER

echo " running test 372"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestMaxScoreQueryParser.testTie> $experiment_root/$TESTSUBJECT/outputs/$VER/t372 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestMaxScoreQueryParser.testTie $VER

echo " running test 373"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestMaxScoreQueryParser.testBoost> $experiment_root/$TESTSUBJECT/outputs/$VER/t373 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestMaxScoreQueryParser.testBoost $VER

echo " running test 374"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestPseudoReturnFields.testMultiValued> $experiment_root/$TESTSUBJECT/outputs/$VER/t374 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestPseudoReturnFields.testMultiValued $VER

echo " running test 375"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestPseudoReturnFields.testAllRealFields> $experiment_root/$TESTSUBJECT/outputs/$VER/t375 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestPseudoReturnFields.testAllRealFields $VER

echo " running test 376"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestPseudoReturnFields.testScoreAndAllRealFields> $experiment_root/$TESTSUBJECT/outputs/$VER/t376 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestPseudoReturnFields.testScoreAndAllRealFields $VER

echo " running test 377"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestPseudoReturnFields.testScoreAndExplicitRealFields> $experiment_root/$TESTSUBJECT/outputs/$VER/t377 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestPseudoReturnFields.testScoreAndExplicitRealFields $VER

echo " running test 378"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestPseudoReturnFields.testFunctions> $experiment_root/$TESTSUBJECT/outputs/$VER/t378 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestPseudoReturnFields.testFunctions $VER

echo " running test 379"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestPseudoReturnFields.testFunctionsAndExplicit> $experiment_root/$TESTSUBJECT/outputs/$VER/t379 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestPseudoReturnFields.testFunctionsAndExplicit $VER

echo " running test 380"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestPseudoReturnFields.testFunctionsAndScore> $experiment_root/$TESTSUBJECT/outputs/$VER/t380 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestPseudoReturnFields.testFunctionsAndScore $VER

echo " running test 381"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestPseudoReturnFields.testGlobs> $experiment_root/$TESTSUBJECT/outputs/$VER/t381 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestPseudoReturnFields.testGlobs $VER

echo " running test 382"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestPseudoReturnFields.testGlobsAndExplicit> $experiment_root/$TESTSUBJECT/outputs/$VER/t382 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestPseudoReturnFields.testGlobsAndExplicit $VER

echo " running test 383"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestPseudoReturnFields.testGlobsAndScore> $experiment_root/$TESTSUBJECT/outputs/$VER/t383 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestPseudoReturnFields.testGlobsAndScore $VER

echo " running test 384"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestPseudoReturnFields.testAugmenters> $experiment_root/$TESTSUBJECT/outputs/$VER/t384 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestPseudoReturnFields.testAugmenters $VER

echo " running test 385"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestPseudoReturnFields.testAugmentersAndExplicit> $experiment_root/$TESTSUBJECT/outputs/$VER/t385 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestPseudoReturnFields.testAugmentersAndExplicit $VER

echo " running test 386"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestPseudoReturnFields.testAugmentersAndScore> $experiment_root/$TESTSUBJECT/outputs/$VER/t386 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestPseudoReturnFields.testAugmentersAndScore $VER

echo " running test 387"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestPseudoReturnFields.testAugmentersGlobsExplicitAndScoreOhMy> $experiment_root/$TESTSUBJECT/outputs/$VER/t387 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestPseudoReturnFields.testAugmentersGlobsExplicitAndScoreOhMy $VER

echo " running test 388"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestSolr4Spatial.testBadShapeParse400> $experiment_root/$TESTSUBJECT/outputs/$VER/t388 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestSolr4Spatial.testBadShapeParse400 $VER

echo " running test 389"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestSolr4Spatial.testIntersectFilter> $experiment_root/$TESTSUBJECT/outputs/$VER/t389 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestSolr4Spatial.testIntersectFilter $VER

echo " running test 390"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestSolr4Spatial.checkResultFormat> $experiment_root/$TESTSUBJECT/outputs/$VER/t390 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestSolr4Spatial.checkResultFormat $VER

echo " running test 391"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestSolr4Spatial.checkQueryEmptyIndex> $experiment_root/$TESTSUBJECT/outputs/$VER/t391 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestSolr4Spatial.checkQueryEmptyIndex $VER

echo " running test 392"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestSolr4Spatial.testRangeSyntax> $experiment_root/$TESTSUBJECT/outputs/$VER/t392 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestSolr4Spatial.testRangeSyntax $VER

echo " running test 393"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestSolr4Spatial.testSort> $experiment_root/$TESTSUBJECT/outputs/$VER/t393 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestSolr4Spatial.testSort $VER

echo " running test 394"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestSolr4Spatial.testSortMultiVal> $experiment_root/$TESTSUBJECT/outputs/$VER/t394 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestSolr4Spatial.testSortMultiVal $VER

echo " running test 395"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestExtendedDismaxParser.testSyntax> $experiment_root/$TESTSUBJECT/outputs/$VER/t395 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestExtendedDismaxParser.testSyntax $VER

echo " running test 396"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestExtendedDismaxParser.testEscapingOfReservedCharacters> $experiment_root/$TESTSUBJECT/outputs/$VER/t396 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestExtendedDismaxParser.testEscapingOfReservedCharacters $VER

echo " running test 397"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestRangeQuery.testRangeQueries> $experiment_root/$TESTSUBJECT/outputs/$VER/t397 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestRangeQuery.testRangeQueries $VER

echo " running test 398"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestRangeQuery.testRandomRangeQueries> $experiment_root/$TESTSUBJECT/outputs/$VER/t398 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestRangeQuery.testRandomRangeQueries $VER

echo " running test 399"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestSolrQueryParser.testPhrase> $experiment_root/$TESTSUBJECT/outputs/$VER/t399 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestSolrQueryParser.testPhrase $VER

echo " running test 400"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestSolrQueryParser.testLocalParamsInQP> $experiment_root/$TESTSUBJECT/outputs/$VER/t400 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestSolrQueryParser.testLocalParamsInQP $VER

echo " running test 401"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestSolrQueryParser.testSolr4121> $experiment_root/$TESTSUBJECT/outputs/$VER/t401 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestSolrQueryParser.testSolr4121 $VER

echo " running test 402"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestSolrQueryParser.testSyntax> $experiment_root/$TESTSUBJECT/outputs/$VER/t402 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestSolrQueryParser.testSyntax $VER

echo " running test 403"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestSolrQueryParser.testNestedQueryModifiers> $experiment_root/$TESTSUBJECT/outputs/$VER/t403 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestSolrQueryParser.testNestedQueryModifiers $VER

echo " running test 404"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestRecovery.testLogReplay> $experiment_root/$TESTSUBJECT/outputs/$VER/t404 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestRecovery.testLogReplay $VER

echo " running test 405"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestRecovery.testBuffering> $experiment_root/$TESTSUBJECT/outputs/$VER/t405 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestRecovery.testBuffering $VER

echo " running test 406"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestRecovery.testDropBuffered> $experiment_root/$TESTSUBJECT/outputs/$VER/t406 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestRecovery.testDropBuffered $VER

echo " running test 407"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestRecovery.testReload> $experiment_root/$TESTSUBJECT/outputs/$VER/t407 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestRecovery.testReload $VER

echo " running test 408"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestRecovery.testBufferingFlags> $experiment_root/$TESTSUBJECT/outputs/$VER/t408 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestRecovery.testBufferingFlags $VER

echo " running test 409"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestRecovery.testVersionsOnRestart> $experiment_root/$TESTSUBJECT/outputs/$VER/t409 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestRecovery.testVersionsOnRestart $VER

echo " running test 410"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestRecovery.testCleanShutdown> $experiment_root/$TESTSUBJECT/outputs/$VER/t410 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestRecovery.testCleanShutdown $VER

echo " running test 411"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestRecovery.testRemoveOldLogs> $experiment_root/$TESTSUBJECT/outputs/$VER/t411 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestRecovery.testRemoveOldLogs $VER

echo " running test 412"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestRecovery.testTruncatedLog> $experiment_root/$TESTSUBJECT/outputs/$VER/t412 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestRecovery.testTruncatedLog $VER

echo " running test 413"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestRecovery.testCorruptLog> $experiment_root/$TESTSUBJECT/outputs/$VER/t413 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestRecovery.testCorruptLog $VER

echo " running test 414"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestRecovery.testRecoveryMultipleLogs> $experiment_root/$TESTSUBJECT/outputs/$VER/t414 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestRecovery.testRecoveryMultipleLogs $VER

echo " running test 415"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.function.distance.DistanceFunctionTest.testHaversine> $experiment_root/$TESTSUBJECT/outputs/$VER/t415 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.function.distance.DistanceFunctionTest.testHaversine $VER

echo " running test 416"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.function.distance.DistanceFunctionTest.testLatLon> $experiment_root/$TESTSUBJECT/outputs/$VER/t416 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.function.distance.DistanceFunctionTest.testLatLon $VER

echo " running test 417"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.function.distance.DistanceFunctionTest.testVector> $experiment_root/$TESTSUBJECT/outputs/$VER/t417 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.function.distance.DistanceFunctionTest.testVector $VER

echo " running test 418"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.function.TestFunctionQuery.testFunctions> $experiment_root/$TESTSUBJECT/outputs/$VER/t418 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.function.TestFunctionQuery.testFunctions $VER

echo " running test 419"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.function.TestFunctionQuery.testExternalField> $experiment_root/$TESTSUBJECT/outputs/$VER/t419 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.function.TestFunctionQuery.testExternalField $VER

echo " running test 420"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.function.TestFunctionQuery.testExternalFileFieldStringKeys> $experiment_root/$TESTSUBJECT/outputs/$VER/t420 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.function.TestFunctionQuery.testExternalFileFieldStringKeys $VER

echo " running test 421"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.function.TestFunctionQuery.testExternalFileFieldNumericKey> $experiment_root/$TESTSUBJECT/outputs/$VER/t421 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.function.TestFunctionQuery.testExternalFileFieldNumericKey $VER

echo " running test 422"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.function.TestFunctionQuery.testGeneral> $experiment_root/$TESTSUBJECT/outputs/$VER/t422 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.function.TestFunctionQuery.testGeneral $VER

echo " running test 423"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.function.TestFunctionQuery.testSortByFunc> $experiment_root/$TESTSUBJECT/outputs/$VER/t423 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.function.TestFunctionQuery.testSortByFunc $VER

echo " running test 424"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.function.TestFunctionQuery.testDegreeRads> $experiment_root/$TESTSUBJECT/outputs/$VER/t424 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.function.TestFunctionQuery.testDegreeRads $VER

echo " running test 425"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.function.TestFunctionQuery.testStrDistance> $experiment_root/$TESTSUBJECT/outputs/$VER/t425 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.function.TestFunctionQuery.testStrDistance $VER

echo " running test 426"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.function.TestFunctionQuery.testFuncs> $experiment_root/$TESTSUBJECT/outputs/$VER/t426 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.function.TestFunctionQuery.testFuncs $VER

echo " running test 427"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.function.TestFunctionQuery.testExternalFieldValueSourceParser> $experiment_root/$TESTSUBJECT/outputs/$VER/t427 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.function.TestFunctionQuery.testExternalFieldValueSourceParser $VER

echo " running test 428"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.function.TestFunctionQuery.testFieldValueSourceParser> $experiment_root/$TESTSUBJECT/outputs/$VER/t428 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.function.TestFunctionQuery.testFieldValueSourceParser $VER

echo " running test 429"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.function.TestFunctionQuery.testBooleanFunctions> $experiment_root/$TESTSUBJECT/outputs/$VER/t429 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.function.TestFunctionQuery.testBooleanFunctions $VER

echo " running test 430"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.function.TestFunctionQuery.testPseudoFieldFunctions> $experiment_root/$TESTSUBJECT/outputs/$VER/t430 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.function.TestFunctionQuery.testPseudoFieldFunctions $VER

echo " running test 431"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestStressRecovery.testStressRecovery> $experiment_root/$TESTSUBJECT/outputs/$VER/t431 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestStressRecovery.testStressRecovery $VER

echo " running test 432"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestFoldingMultitermQuery.testPrefixCaseAccentFolding> $experiment_root/$TESTSUBJECT/outputs/$VER/t432 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestFoldingMultitermQuery.testPrefixCaseAccentFolding $VER

echo " running test 433"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestFoldingMultitermQuery.testWildcardCaseAccentFolding> $experiment_root/$TESTSUBJECT/outputs/$VER/t433 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestFoldingMultitermQuery.testWildcardCaseAccentFolding $VER

echo " running test 434"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestFoldingMultitermQuery.testLowerTokenizer> $experiment_root/$TESTSUBJECT/outputs/$VER/t434 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestFoldingMultitermQuery.testLowerTokenizer $VER

echo " running test 435"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestFoldingMultitermQuery.testFuzzy> $experiment_root/$TESTSUBJECT/outputs/$VER/t435 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestFoldingMultitermQuery.testFuzzy $VER

echo " running test 436"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestFoldingMultitermQuery.testRegex> $experiment_root/$TESTSUBJECT/outputs/$VER/t436 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestFoldingMultitermQuery.testRegex $VER

echo " running test 437"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestFoldingMultitermQuery.testGeneral> $experiment_root/$TESTSUBJECT/outputs/$VER/t437 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestFoldingMultitermQuery.testGeneral $VER

echo " running test 438"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestFoldingMultitermQuery.testPhrase> $experiment_root/$TESTSUBJECT/outputs/$VER/t438 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestFoldingMultitermQuery.testPhrase $VER

echo " running test 439"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestFoldingMultitermQuery.testWildcardRange> $experiment_root/$TESTSUBJECT/outputs/$VER/t439 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestFoldingMultitermQuery.testWildcardRange $VER

echo " running test 440"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestFoldingMultitermQuery.testCharFilter> $experiment_root/$TESTSUBJECT/outputs/$VER/t440 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestFoldingMultitermQuery.testCharFilter $VER

echo " running test 441"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestFoldingMultitermQuery.testRangeQuery> $experiment_root/$TESTSUBJECT/outputs/$VER/t441 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestFoldingMultitermQuery.testRangeQuery $VER

echo " running test 442"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestFoldingMultitermQuery.testNonTextTypes> $experiment_root/$TESTSUBJECT/outputs/$VER/t442 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestFoldingMultitermQuery.testNonTextTypes $VER

echo " running test 443"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestFoldingMultitermQuery.testMultiBad> $experiment_root/$TESTSUBJECT/outputs/$VER/t443 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestFoldingMultitermQuery.testMultiBad $VER

echo " running test 444"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestFoldingMultitermQuery.testGreek> $experiment_root/$TESTSUBJECT/outputs/$VER/t444 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestFoldingMultitermQuery.testGreek $VER

echo " running test 445"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestFoldingMultitermQuery.testRussian> $experiment_root/$TESTSUBJECT/outputs/$VER/t445 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestFoldingMultitermQuery.testRussian $VER

echo " running test 446"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestLFUCache.testTimeDecayParams> $experiment_root/$TESTSUBJECT/outputs/$VER/t446 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestLFUCache.testTimeDecayParams $VER

echo " running test 447"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestLFUCache.testSimple> $experiment_root/$TESTSUBJECT/outputs/$VER/t447 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestLFUCache.testSimple $VER

echo " running test 448"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestLFUCache.testItemOrdering> $experiment_root/$TESTSUBJECT/outputs/$VER/t448 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestLFUCache.testItemOrdering $VER

echo " running test 449"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestLFUCache.testTimeDecay> $experiment_root/$TESTSUBJECT/outputs/$VER/t449 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestLFUCache.testTimeDecay $VER

echo " running test 450"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.search.TestLFUCache.testTimeNoDecay> $experiment_root/$TESTSUBJECT/outputs/$VER/t450 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.search.TestLFUCache.testTimeNoDecay $VER

echo " running test 451"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestGroupingSearch.testGroupingGroupSortingScore_basic> $experiment_root/$TESTSUBJECT/outputs/$VER/t451 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestGroupingSearch.testGroupingGroupSortingScore_basic $VER

echo " running test 452"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestGroupingSearch.testGroupingGroupSortingScore_withTotalGroupCount> $experiment_root/$TESTSUBJECT/outputs/$VER/t452 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestGroupingSearch.testGroupingGroupSortingScore_withTotalGroupCount $VER

echo " running test 453"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestGroupingSearch.testGroupingGroupSortingScore_basicWithGroupSortEqualToSort> $experiment_root/$TESTSUBJECT/outputs/$VER/t453 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestGroupingSearch.testGroupingGroupSortingScore_basicWithGroupSortEqualToSort $VER

echo " running test 454"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestGroupingSearch.testGroupingGroupSortingWeight> $experiment_root/$TESTSUBJECT/outputs/$VER/t454 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestGroupingSearch.testGroupingGroupSortingWeight $VER

echo " running test 455"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestGroupingSearch.testGroupingSimpleFormatArrayIndexOutOfBoundsException> $experiment_root/$TESTSUBJECT/outputs/$VER/t455 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestGroupingSearch.testGroupingSimpleFormatArrayIndexOutOfBoundsException $VER

echo " running test 456"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestGroupingSearch.testGroupingSimpleFormatStartBiggerThanRows> $experiment_root/$TESTSUBJECT/outputs/$VER/t456 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestGroupingSearch.testGroupingSimpleFormatStartBiggerThanRows $VER

echo " running test 457"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestGroupingSearch.testGroupingSimpleFormatArrayIndexOutOfBoundsExceptionWithJavaBin> $experiment_root/$TESTSUBJECT/outputs/$VER/t457 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestGroupingSearch.testGroupingSimpleFormatArrayIndexOutOfBoundsExceptionWithJavaBin $VER

echo " running test 458"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestGroupingSearch.testGroupingWithTimeAllowed> $experiment_root/$TESTSUBJECT/outputs/$VER/t458 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestGroupingSearch.testGroupingWithTimeAllowed $VER

echo " running test 459"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestGroupingSearch.testGroupingSortByFunction> $experiment_root/$TESTSUBJECT/outputs/$VER/t459 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestGroupingSearch.testGroupingSortByFunction $VER

echo " running test 460"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestGroupingSearch.testGroupingGroupedBasedFaceting> $experiment_root/$TESTSUBJECT/outputs/$VER/t460 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestGroupingSearch.testGroupingGroupedBasedFaceting $VER

echo " running test 461"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestGroupingSearch.testGroupingGroupedBasedFacetingWithTaggedFilter> $experiment_root/$TESTSUBJECT/outputs/$VER/t461 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestGroupingSearch.testGroupingGroupedBasedFacetingWithTaggedFilter $VER

echo " running test 462"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestGroupingSearch.testGroupAPI> $experiment_root/$TESTSUBJECT/outputs/$VER/t462 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestGroupingSearch.testGroupAPI $VER

echo " running test 463"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestGroupingSearch.testRandomGrouping> $experiment_root/$TESTSUBJECT/outputs/$VER/t463 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestGroupingSearch.testRandomGrouping $VER

echo " running test 464"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.SolrTestCaseJ4Test.testCorrectCore> $experiment_root/$TESTSUBJECT/outputs/$VER/t464 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.SolrTestCaseJ4Test.testCorrectCore $VER

echo " running test 465"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.SpellingQueryConverterTest.test> $experiment_root/$TESTSUBJECT/outputs/$VER/t465 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.SpellingQueryConverterTest.test $VER

echo " running test 466"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.SpellingQueryConverterTest.testSpecialChars> $experiment_root/$TESTSUBJECT/outputs/$VER/t466 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.SpellingQueryConverterTest.testSpecialChars $VER

echo " running test 467"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.SpellingQueryConverterTest.testUnicode> $experiment_root/$TESTSUBJECT/outputs/$VER/t467 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.SpellingQueryConverterTest.testUnicode $VER

echo " running test 468"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.SpellingQueryConverterTest.testMultipleClauses> $experiment_root/$TESTSUBJECT/outputs/$VER/t468 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.SpellingQueryConverterTest.testMultipleClauses $VER

echo " running test 469"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.SpellingQueryConverterTest.testRequiredOrProhibitedFlags> $experiment_root/$TESTSUBJECT/outputs/$VER/t469 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.SpellingQueryConverterTest.testRequiredOrProhibitedFlags $VER

echo " running test 470"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.IndexBasedSpellCheckerTest.testComparator> $experiment_root/$TESTSUBJECT/outputs/$VER/t470 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.IndexBasedSpellCheckerTest.testComparator $VER

echo " running test 471"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.IndexBasedSpellCheckerTest.testSpelling> $experiment_root/$TESTSUBJECT/outputs/$VER/t471 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.IndexBasedSpellCheckerTest.testSpelling $VER

echo " running test 472"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.IndexBasedSpellCheckerTest.testExtendedResults> $experiment_root/$TESTSUBJECT/outputs/$VER/t472 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.IndexBasedSpellCheckerTest.testExtendedResults $VER

echo " running test 473"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.IndexBasedSpellCheckerTest.testAlternateDistance> $experiment_root/$TESTSUBJECT/outputs/$VER/t473 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.IndexBasedSpellCheckerTest.testAlternateDistance $VER

echo " running test 474"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.IndexBasedSpellCheckerTest.testAlternateLocation> $experiment_root/$TESTSUBJECT/outputs/$VER/t474 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.IndexBasedSpellCheckerTest.testAlternateLocation $VER

echo " running test 475"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.FileBasedSpellCheckerTest.test> $experiment_root/$TESTSUBJECT/outputs/$VER/t475 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.FileBasedSpellCheckerTest.test $VER

echo " running test 476"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.FileBasedSpellCheckerTest.testFieldType> $experiment_root/$TESTSUBJECT/outputs/$VER/t476 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.FileBasedSpellCheckerTest.testFieldType $VER

echo " running test 477"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.FileBasedSpellCheckerTest.testRAMDirectory> $experiment_root/$TESTSUBJECT/outputs/$VER/t477 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.FileBasedSpellCheckerTest.testRAMDirectory $VER

echo " running test 478"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.SpellPossibilityIteratorTest.testScalability> $experiment_root/$TESTSUBJECT/outputs/$VER/t478 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.SpellPossibilityIteratorTest.testScalability $VER

echo " running test 479"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.SpellPossibilityIteratorTest.testSpellPossibilityIterator> $experiment_root/$TESTSUBJECT/outputs/$VER/t479 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.SpellPossibilityIteratorTest.testSpellPossibilityIterator $VER

echo " running test 480"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.SpellPossibilityIteratorTest.testOverlappingTokens> $experiment_root/$TESTSUBJECT/outputs/$VER/t480 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.SpellPossibilityIteratorTest.testOverlappingTokens $VER

echo " running test 481"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.suggest.SuggesterFSTTest.testSuggestions> $experiment_root/$TESTSUBJECT/outputs/$VER/t481 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.suggest.SuggesterFSTTest.testSuggestions $VER

echo " running test 482"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.suggest.SuggesterFSTTest.testReload> $experiment_root/$TESTSUBJECT/outputs/$VER/t482 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.suggest.SuggesterFSTTest.testReload $VER

echo " running test 483"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.suggest.SuggesterFSTTest.testRebuild> $experiment_root/$TESTSUBJECT/outputs/$VER/t483 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.suggest.SuggesterFSTTest.testRebuild $VER

echo " running test 484"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.suggest.SuggesterTest.testSuggestions> $experiment_root/$TESTSUBJECT/outputs/$VER/t484 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.suggest.SuggesterTest.testSuggestions $VER

echo " running test 485"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.suggest.SuggesterTest.testReload> $experiment_root/$TESTSUBJECT/outputs/$VER/t485 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.suggest.SuggesterTest.testReload $VER

echo " running test 486"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.suggest.SuggesterTest.testRebuild> $experiment_root/$TESTSUBJECT/outputs/$VER/t486 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.suggest.SuggesterTest.testRebuild $VER

echo " running test 487"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.suggest.SuggesterWFSTTest.testSuggestions> $experiment_root/$TESTSUBJECT/outputs/$VER/t487 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.suggest.SuggesterWFSTTest.testSuggestions $VER

echo " running test 488"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.suggest.SuggesterWFSTTest.testReload> $experiment_root/$TESTSUBJECT/outputs/$VER/t488 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.suggest.SuggesterWFSTTest.testReload $VER

echo " running test 489"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.suggest.SuggesterWFSTTest.testRebuild> $experiment_root/$TESTSUBJECT/outputs/$VER/t489 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.suggest.SuggesterWFSTTest.testRebuild $VER

echo " running test 490"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.suggest.SuggesterTSTTest.testSuggestions> $experiment_root/$TESTSUBJECT/outputs/$VER/t490 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.suggest.SuggesterTSTTest.testSuggestions $VER

echo " running test 491"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.suggest.SuggesterTSTTest.testReload> $experiment_root/$TESTSUBJECT/outputs/$VER/t491 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.suggest.SuggesterTSTTest.testReload $VER

echo " running test 492"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.suggest.SuggesterTSTTest.testRebuild> $experiment_root/$TESTSUBJECT/outputs/$VER/t492 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.suggest.SuggesterTSTTest.testRebuild $VER

echo " running test 493"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.SpellCheckCollatorTest.testCollationWithHypens> $experiment_root/$TESTSUBJECT/outputs/$VER/t493 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.SpellCheckCollatorTest.testCollationWithHypens $VER

echo " running test 494"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.SpellCheckCollatorTest.testCollateWithFilter> $experiment_root/$TESTSUBJECT/outputs/$VER/t494 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.SpellCheckCollatorTest.testCollateWithFilter $VER

echo " running test 495"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.SpellCheckCollatorTest.testCollateWithMultipleRequestHandlers> $experiment_root/$TESTSUBJECT/outputs/$VER/t495 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.SpellCheckCollatorTest.testCollateWithMultipleRequestHandlers $VER

echo " running test 496"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.SpellCheckCollatorTest.testExtendedCollate> $experiment_root/$TESTSUBJECT/outputs/$VER/t496 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.SpellCheckCollatorTest.testExtendedCollate $VER

echo " running test 497"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.SpellCheckCollatorTest.testCollateWithGrouping> $experiment_root/$TESTSUBJECT/outputs/$VER/t497 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.SpellCheckCollatorTest.testCollateWithGrouping $VER

echo " running test 498"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.SpellCheckCollatorTest.testContextSensitiveCollate> $experiment_root/$TESTSUBJECT/outputs/$VER/t498 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.SpellCheckCollatorTest.testContextSensitiveCollate $VER

echo " running test 499"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.SpellCheckCollatorTest.testEstimatedHitCounts> $experiment_root/$TESTSUBJECT/outputs/$VER/t499 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.SpellCheckCollatorTest.testEstimatedHitCounts $VER

echo " running test 500"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.DirectSolrSpellCheckerTest.test> $experiment_root/$TESTSUBJECT/outputs/$VER/t500 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.DirectSolrSpellCheckerTest.test $VER

echo " running test 501"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.DirectSolrSpellCheckerTest.testOnlyMorePopularWithExtendedResults> $experiment_root/$TESTSUBJECT/outputs/$VER/t501 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.DirectSolrSpellCheckerTest.testOnlyMorePopularWithExtendedResults $VER

echo " running test 502"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.WordBreakSolrSpellCheckerTest.testStandAlone> $experiment_root/$TESTSUBJECT/outputs/$VER/t502 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.WordBreakSolrSpellCheckerTest.testStandAlone $VER

echo " running test 503"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.WordBreakSolrSpellCheckerTest.testInConjunction> $experiment_root/$TESTSUBJECT/outputs/$VER/t503 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.WordBreakSolrSpellCheckerTest.testInConjunction $VER

echo " running test 504"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.spelling.WordBreakSolrSpellCheckerTest.testCollate> $experiment_root/$TESTSUBJECT/outputs/$VER/t504 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.spelling.WordBreakSolrSpellCheckerTest.testCollate $VER

echo " running test 505"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.TestUpdate.testUpdateableDocs> $experiment_root/$TESTSUBJECT/outputs/$VER/t505 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.TestUpdate.testUpdateableDocs $VER

echo " running test 506"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.SolrIndexSplitterTest.testSplitByPaths> $experiment_root/$TESTSUBJECT/outputs/$VER/t506 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.SolrIndexSplitterTest.testSplitByPaths $VER

echo " running test 507"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.SolrIndexSplitterTest.testSplitByCores> $experiment_root/$TESTSUBJECT/outputs/$VER/t507 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.SolrIndexSplitterTest.testSplitByCores $VER

echo " running test 508"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.SolrIndexSplitterTest.testSplitAlternately> $experiment_root/$TESTSUBJECT/outputs/$VER/t508 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.SolrIndexSplitterTest.testSplitAlternately $VER

echo " running test 509"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.DocumentBuilderTest.testBuildDocument> $experiment_root/$TESTSUBJECT/outputs/$VER/t509 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.DocumentBuilderTest.testBuildDocument $VER

echo " running test 510"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.DocumentBuilderTest.testNullField> $experiment_root/$TESTSUBJECT/outputs/$VER/t510 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.DocumentBuilderTest.testNullField $VER

echo " running test 511"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.DocumentBuilderTest.testExceptions> $experiment_root/$TESTSUBJECT/outputs/$VER/t511 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.DocumentBuilderTest.testExceptions $VER

echo " running test 512"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.DocumentBuilderTest.testMultiField> $experiment_root/$TESTSUBJECT/outputs/$VER/t512 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.DocumentBuilderTest.testMultiField $VER

echo " running test 513"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.DocumentBuilderTest.testCopyFieldWithDocumentBoost> $experiment_root/$TESTSUBJECT/outputs/$VER/t513 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.DocumentBuilderTest.testCopyFieldWithDocumentBoost $VER

echo " running test 514"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.DocumentBuilderTest.testCopyFieldWithFieldBoost> $experiment_root/$TESTSUBJECT/outputs/$VER/t514 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.DocumentBuilderTest.testCopyFieldWithFieldBoost $VER

echo " running test 515"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.DocumentBuilderTest.testWithPolyFieldsAndFieldBoost> $experiment_root/$TESTSUBJECT/outputs/$VER/t515 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.DocumentBuilderTest.testWithPolyFieldsAndFieldBoost $VER

echo " running test 516"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.DocumentBuilderTest.testWithPolyFieldsAndDocumentBoost> $experiment_root/$TESTSUBJECT/outputs/$VER/t516 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.DocumentBuilderTest.testWithPolyFieldsAndDocumentBoost $VER

echo " running test 517"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.SolrIndexConfigTest.testFailingSolrIndexConfigCreation> $experiment_root/$TESTSUBJECT/outputs/$VER/t517 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.SolrIndexConfigTest.testFailingSolrIndexConfigCreation $VER

echo " running test 518"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.SolrIndexConfigTest.testTieredMPSolrIndexConfigCreation> $experiment_root/$TESTSUBJECT/outputs/$VER/t518 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.SolrIndexConfigTest.testTieredMPSolrIndexConfigCreation $VER

echo " running test 519"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.processor.RegexBoostProcessorTest.testNoBoost> $experiment_root/$TESTSUBJECT/outputs/$VER/t519 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.processor.RegexBoostProcessorTest.testNoBoost $VER

echo " running test 520"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.processor.RegexBoostProcessorTest.testDeboostOld> $experiment_root/$TESTSUBJECT/outputs/$VER/t520 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.processor.RegexBoostProcessorTest.testDeboostOld $VER

echo " running test 521"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.processor.RegexBoostProcessorTest.testBoostGood> $experiment_root/$TESTSUBJECT/outputs/$VER/t521 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.processor.RegexBoostProcessorTest.testBoostGood $VER

echo " running test 522"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.processor.RegexBoostProcessorTest.testTwoRules> $experiment_root/$TESTSUBJECT/outputs/$VER/t522 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.processor.RegexBoostProcessorTest.testTwoRules $VER

echo " running test 523"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.processor.SignatureUpdateProcessorFactoryTest.testDupeAllFieldsDetection> $experiment_root/$TESTSUBJECT/outputs/$VER/t523 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.processor.SignatureUpdateProcessorFactoryTest.testDupeAllFieldsDetection $VER

echo " running test 524"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.processor.SignatureUpdateProcessorFactoryTest.testDupeDetection> $experiment_root/$TESTSUBJECT/outputs/$VER/t524 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.processor.SignatureUpdateProcessorFactoryTest.testDupeDetection $VER

echo " running test 525"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.processor.SignatureUpdateProcessorFactoryTest.testMultiThreaded> $experiment_root/$TESTSUBJECT/outputs/$VER/t525 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.processor.SignatureUpdateProcessorFactoryTest.testMultiThreaded $VER

echo " running test 526"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.processor.SignatureUpdateProcessorFactoryTest.testNonIndexedSignatureField> $experiment_root/$TESTSUBJECT/outputs/$VER/t526 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.processor.SignatureUpdateProcessorFactoryTest.testNonIndexedSignatureField $VER

echo " running test 527"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.processor.SignatureUpdateProcessorFactoryTest.testFailNonIndexedSigWithOverwriteDupes> $experiment_root/$TESTSUBJECT/outputs/$VER/t527 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.processor.SignatureUpdateProcessorFactoryTest.testFailNonIndexedSigWithOverwriteDupes $VER

echo " running test 528"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.processor.SignatureUpdateProcessorFactoryTest.testNonStringFieldsValues> $experiment_root/$TESTSUBJECT/outputs/$VER/t528 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.processor.SignatureUpdateProcessorFactoryTest.testNonStringFieldsValues $VER

echo " running test 529"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.processor.URLClassifyProcessorTest.testProcessor> $experiment_root/$TESTSUBJECT/outputs/$VER/t529 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.processor.URLClassifyProcessorTest.testProcessor $VER

echo " running test 530"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.processor.URLClassifyProcessorTest.testNormalizations> $experiment_root/$TESTSUBJECT/outputs/$VER/t530 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.processor.URLClassifyProcessorTest.testNormalizations $VER

echo " running test 531"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.processor.URLClassifyProcessorTest.testLength> $experiment_root/$TESTSUBJECT/outputs/$VER/t531 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.processor.URLClassifyProcessorTest.testLength $VER

echo " running test 532"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.processor.URLClassifyProcessorTest.testLevels> $experiment_root/$TESTSUBJECT/outputs/$VER/t532 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.processor.URLClassifyProcessorTest.testLevels $VER

echo " running test 533"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.processor.URLClassifyProcessorTest.testLandingPage> $experiment_root/$TESTSUBJECT/outputs/$VER/t533 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.processor.URLClassifyProcessorTest.testLandingPage $VER

echo " running test 534"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.processor.URLClassifyProcessorTest.testTopLevelPage> $experiment_root/$TESTSUBJECT/outputs/$VER/t534 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.processor.URLClassifyProcessorTest.testTopLevelPage $VER

echo " running test 535"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.processor.URLClassifyProcessorTest.testCanonicalUrl> $experiment_root/$TESTSUBJECT/outputs/$VER/t535 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.processor.URLClassifyProcessorTest.testCanonicalUrl $VER

echo " running test 536"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.processor.UniqFieldsUpdateProcessorFactoryTest.testUniqFields> $experiment_root/$TESTSUBJECT/outputs/$VER/t536 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.processor.UniqFieldsUpdateProcessorFactoryTest.testUniqFields $VER

echo " running test 537"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.processor.TestPartialUpdateDeduplication.testPartialUpdates> $experiment_root/$TESTSUBJECT/outputs/$VER/t537 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.processor.TestPartialUpdateDeduplication.testPartialUpdates $VER

echo " running test 538"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.processor.PreAnalyzedUpdateProcessorTest.testSimple> $experiment_root/$TESTSUBJECT/outputs/$VER/t538 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.processor.PreAnalyzedUpdateProcessorTest.testSimple $VER

echo " running test 539"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.processor.PreAnalyzedUpdateProcessorTest.testJson> $experiment_root/$TESTSUBJECT/outputs/$VER/t539 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.processor.PreAnalyzedUpdateProcessorTest.testJson $VER

echo " running test 540"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.DirectUpdateHandlerTest.testRequireUniqueKey> $experiment_root/$TESTSUBJECT/outputs/$VER/t540 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.DirectUpdateHandlerTest.testRequireUniqueKey $VER

echo " running test 541"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.DirectUpdateHandlerTest.testBasics> $experiment_root/$TESTSUBJECT/outputs/$VER/t541 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.DirectUpdateHandlerTest.testBasics $VER

echo " running test 542"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.DirectUpdateHandlerTest.testAddRollback> $experiment_root/$TESTSUBJECT/outputs/$VER/t542 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.DirectUpdateHandlerTest.testAddRollback $VER

echo " running test 543"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.DirectUpdateHandlerTest.testDeleteRollback> $experiment_root/$TESTSUBJECT/outputs/$VER/t543 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.DirectUpdateHandlerTest.testDeleteRollback $VER

echo " running test 544"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.DirectUpdateHandlerTest.testExpungeDeletes> $experiment_root/$TESTSUBJECT/outputs/$VER/t544 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.DirectUpdateHandlerTest.testExpungeDeletes $VER

echo " running test 545"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.update.DirectUpdateHandlerTest.testPrepareCommit> $experiment_root/$TESTSUBJECT/outputs/$VER/t545 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.update.DirectUpdateHandlerTest.testPrepareCommit $VER

echo " running test 546"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestDocumentBuilder.testDeepCopy> $experiment_root/$TESTSUBJECT/outputs/$VER/t546 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestDocumentBuilder.testDeepCopy $VER

echo " running test 547"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestJoin.testJoin> $experiment_root/$TESTSUBJECT/outputs/$VER/t547 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestJoin.testJoin $VER

echo " running test 548"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestJoin.testRandomJoin> $experiment_root/$TESTSUBJECT/outputs/$VER/t548 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestJoin.testRandomJoin $VER

echo " running test 549"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.OverseerTest.testShardAssignment> $experiment_root/$TESTSUBJECT/outputs/$VER/t549 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.OverseerTest.testShardAssignment $VER

echo " running test 550"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.OverseerTest.testShardAssignmentBigger> $experiment_root/$TESTSUBJECT/outputs/$VER/t550 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.OverseerTest.testShardAssignmentBigger $VER

echo " running test 551"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.OverseerTest.testStateChange> $experiment_root/$TESTSUBJECT/outputs/$VER/t551 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.OverseerTest.testStateChange $VER

echo " running test 552"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.OverseerTest.testOverseerFailure> $experiment_root/$TESTSUBJECT/outputs/$VER/t552 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.OverseerTest.testOverseerFailure $VER

echo " running test 553"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.OverseerTest.testShardLeaderChange> $experiment_root/$TESTSUBJECT/outputs/$VER/t553 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.OverseerTest.testShardLeaderChange $VER

echo " running test 554"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.OverseerTest.testDoubleAssignment> $experiment_root/$TESTSUBJECT/outputs/$VER/t554 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.OverseerTest.testDoubleAssignment $VER

echo " running test 555"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.OverseerTest.testPlaceholders> $experiment_root/$TESTSUBJECT/outputs/$VER/t555 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.OverseerTest.testPlaceholders $VER

echo " running test 556"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.OverseerTest.testReplay> $experiment_root/$TESTSUBJECT/outputs/$VER/t556 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.OverseerTest.testReplay $VER

echo " running test 557"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.ClusterStateTest.testStoreAndRead> $experiment_root/$TESTSUBJECT/outputs/$VER/t557 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.ClusterStateTest.testStoreAndRead $VER

echo " running test 558"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.LeaderElectionIntegrationTest.testSimpleSliceLeaderElection> $experiment_root/$TESTSUBJECT/outputs/$VER/t558 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.LeaderElectionIntegrationTest.testSimpleSliceLeaderElection $VER

echo " running test 559"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.LeaderElectionIntegrationTest.testLeaderElectionAfterClientTimeout> $experiment_root/$TESTSUBJECT/outputs/$VER/t559 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.LeaderElectionIntegrationTest.testLeaderElectionAfterClientTimeout $VER

echo " running test 560"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.TestMultiCoreConfBootstrap.testMultiCoreConfBootstrap> $experiment_root/$TESTSUBJECT/outputs/$VER/t560 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.TestMultiCoreConfBootstrap.testMultiCoreConfBootstrap $VER

echo " running test 561"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.ClusterStateUpdateTest.testCoreRegistration> $experiment_root/$TESTSUBJECT/outputs/$VER/t561 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.ClusterStateUpdateTest.testCoreRegistration $VER

echo " running test 562"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.SliceStateTest.testDefaultSliceState> $experiment_root/$TESTSUBJECT/outputs/$VER/t562 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.SliceStateTest.testDefaultSliceState $VER

echo " running test 563"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.ZkNodePropsTest.testBasic> $experiment_root/$TESTSUBJECT/outputs/$VER/t563 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.ZkNodePropsTest.testBasic $VER

echo " running test 564"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.OverseerCollectionProcessorTest.testNoReplicationEqualNumberOfSlicesPerNode> $experiment_root/$TESTSUBJECT/outputs/$VER/t564 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.OverseerCollectionProcessorTest.testNoReplicationEqualNumberOfSlicesPerNode $VER

echo " running test 565"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.OverseerCollectionProcessorTest.testReplicationEqualNumberOfSlicesPerNode> $experiment_root/$TESTSUBJECT/outputs/$VER/t565 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.OverseerCollectionProcessorTest.testReplicationEqualNumberOfSlicesPerNode $VER

echo " running test 566"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.OverseerCollectionProcessorTest.testNoReplicationEqualNumberOfSlicesPerNodeSendCreateNodesEqualToLiveNodes> $experiment_root/$TESTSUBJECT/outputs/$VER/t566 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.OverseerCollectionProcessorTest.testNoReplicationEqualNumberOfSlicesPerNodeSendCreateNodesEqualToLiveNodes $VER

echo " running test 567"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.OverseerCollectionProcessorTest.testReplicationEqualNumberOfSlicesPerNodeSendCreateNodesEqualToLiveNodes> $experiment_root/$TESTSUBJECT/outputs/$VER/t567 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.OverseerCollectionProcessorTest.testReplicationEqualNumberOfSlicesPerNodeSendCreateNodesEqualToLiveNodes $VER

echo " running test 568"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.OverseerCollectionProcessorTest.testNoReplicationEqualNumberOfSlicesPerNodeSendNullCreateNodes> $experiment_root/$TESTSUBJECT/outputs/$VER/t568 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.OverseerCollectionProcessorTest.testNoReplicationEqualNumberOfSlicesPerNodeSendNullCreateNodes $VER

echo " running test 569"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.OverseerCollectionProcessorTest.testReplicationEqualNumberOfSlicesPerNodeSendNullCreateNodes> $experiment_root/$TESTSUBJECT/outputs/$VER/t569 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.OverseerCollectionProcessorTest.testReplicationEqualNumberOfSlicesPerNodeSendNullCreateNodes $VER

echo " running test 570"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.OverseerCollectionProcessorTest.testNoReplicationUnequalNumberOfSlicesPerNode> $experiment_root/$TESTSUBJECT/outputs/$VER/t570 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.OverseerCollectionProcessorTest.testNoReplicationUnequalNumberOfSlicesPerNode $VER

echo " running test 571"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.OverseerCollectionProcessorTest.testReplicationUnequalNumberOfSlicesPerNode> $experiment_root/$TESTSUBJECT/outputs/$VER/t571 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.OverseerCollectionProcessorTest.testReplicationUnequalNumberOfSlicesPerNode $VER

echo " running test 572"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.OverseerCollectionProcessorTest.testNoReplicationCollectionNotCreatedDueToMaxShardsPerNodeLimit> $experiment_root/$TESTSUBJECT/outputs/$VER/t572 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.OverseerCollectionProcessorTest.testNoReplicationCollectionNotCreatedDueToMaxShardsPerNodeLimit $VER

echo " running test 573"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.OverseerCollectionProcessorTest.testReplicationCollectionNotCreatedDueToMaxShardsPerNodeLimit> $experiment_root/$TESTSUBJECT/outputs/$VER/t573 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.OverseerCollectionProcessorTest.testReplicationCollectionNotCreatedDueToMaxShardsPerNodeLimit $VER

echo " running test 574"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.OverseerCollectionProcessorTest.testNoReplicationLimitedNodesToCreateOn> $experiment_root/$TESTSUBJECT/outputs/$VER/t574 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.OverseerCollectionProcessorTest.testNoReplicationLimitedNodesToCreateOn $VER

echo " running test 575"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.OverseerCollectionProcessorTest.testReplicationLimitedNodesToCreateOn> $experiment_root/$TESTSUBJECT/outputs/$VER/t575 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.OverseerCollectionProcessorTest.testReplicationLimitedNodesToCreateOn $VER

echo " running test 576"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.OverseerCollectionProcessorTest.testNoReplicationCollectionNotCreatedDueToMaxShardsPerNodeAndNodesToCreateOnLimits> $experiment_root/$TESTSUBJECT/outputs/$VER/t576 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.OverseerCollectionProcessorTest.testNoReplicationCollectionNotCreatedDueToMaxShardsPerNodeAndNodesToCreateOnLimits $VER

echo " running test 577"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.OverseerCollectionProcessorTest.testReplicationCollectionNotCreatedDueToMaxShardsPerNodeAndNodesToCreateOnLimits> $experiment_root/$TESTSUBJECT/outputs/$VER/t577 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.OverseerCollectionProcessorTest.testReplicationCollectionNotCreatedDueToMaxShardsPerNodeAndNodesToCreateOnLimits $VER

echo " running test 578"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.SliceStateUpdateTest.testSliceStateUpdate> $experiment_root/$TESTSUBJECT/outputs/$VER/t578 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.SliceStateUpdateTest.testSliceStateUpdate $VER

echo " running test 579"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.BasicZkTest.testBasic> $experiment_root/$TESTSUBJECT/outputs/$VER/t579 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.BasicZkTest.testBasic $VER

echo " running test 580"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.LeaderElectionTest.testBasic> $experiment_root/$TESTSUBJECT/outputs/$VER/t580 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.LeaderElectionTest.testBasic $VER

echo " running test 581"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.LeaderElectionTest.testCancelElection> $experiment_root/$TESTSUBJECT/outputs/$VER/t581 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.LeaderElectionTest.testCancelElection $VER

echo " running test 582"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.LeaderElectionTest.testElection> $experiment_root/$TESTSUBJECT/outputs/$VER/t582 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.LeaderElectionTest.testElection $VER

echo " running test 583"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.LeaderElectionTest.testStressElection> $experiment_root/$TESTSUBJECT/outputs/$VER/t583 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.LeaderElectionTest.testStressElection $VER

echo " running test 584"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.TestZkChroot.testChrootBootstrap> $experiment_root/$TESTSUBJECT/outputs/$VER/t584 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.TestZkChroot.testChrootBootstrap $VER

echo " running test 585"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.TestZkChroot.testNoBootstrapConf> $experiment_root/$TESTSUBJECT/outputs/$VER/t585 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.TestZkChroot.testNoBootstrapConf $VER

echo " running test 586"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.TestZkChroot.testWithUploadDir> $experiment_root/$TESTSUBJECT/outputs/$VER/t586 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.TestZkChroot.testWithUploadDir $VER

echo " running test 587"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.TestZkChroot.testInitPathExists> $experiment_root/$TESTSUBJECT/outputs/$VER/t587 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.TestZkChroot.testInitPathExists $VER

echo " running test 588"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.ZkCLITest.testBootstrap> $experiment_root/$TESTSUBJECT/outputs/$VER/t588 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.ZkCLITest.testBootstrap $VER

echo " running test 589"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.ZkCLITest.testBootstrapWithChroot> $experiment_root/$TESTSUBJECT/outputs/$VER/t589 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.ZkCLITest.testBootstrapWithChroot $VER

echo " running test 590"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.ZkCLITest.testMakePath> $experiment_root/$TESTSUBJECT/outputs/$VER/t590 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.ZkCLITest.testMakePath $VER

echo " running test 591"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.ZkCLITest.testList> $experiment_root/$TESTSUBJECT/outputs/$VER/t591 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.ZkCLITest.testList $VER

echo " running test 592"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.ZkCLITest.testUpConfigLinkConfigClearZk> $experiment_root/$TESTSUBJECT/outputs/$VER/t592 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.ZkCLITest.testUpConfigLinkConfigClearZk $VER

echo " running test 593"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.ZkControllerTest.testReadConfigName> $experiment_root/$TESTSUBJECT/outputs/$VER/t593 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.ZkControllerTest.testReadConfigName $VER

echo " running test 594"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.cloud.ZkControllerTest.testUploadToCloud> $experiment_root/$TESTSUBJECT/outputs/$VER/t594 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.cloud.ZkControllerTest.testUploadToCloud $VER

echo " running test 595"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.TestRandomDVFaceting.testRandomFaceting> $experiment_root/$TESTSUBJECT/outputs/$VER/t595 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.TestRandomDVFaceting.testRandomFaceting $VER

echo " running test 596"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.XmlUpdateRequestHandlerTest.testReadDoc> $experiment_root/$TESTSUBJECT/outputs/$VER/t596 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.XmlUpdateRequestHandlerTest.testReadDoc $VER

echo " running test 597"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.XmlUpdateRequestHandlerTest.testRequestParams> $experiment_root/$TESTSUBJECT/outputs/$VER/t597 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.XmlUpdateRequestHandlerTest.testRequestParams $VER

echo " running test 598"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.XmlUpdateRequestHandlerTest.testExternalEntities> $experiment_root/$TESTSUBJECT/outputs/$VER/t598 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.XmlUpdateRequestHandlerTest.testExternalEntities $VER

echo " running test 599"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.XmlUpdateRequestHandlerTest.testReadDelete> $experiment_root/$TESTSUBJECT/outputs/$VER/t599 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.XmlUpdateRequestHandlerTest.testReadDelete $VER

echo " running test 600"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.TestReplicationHandler.doTestDetails> $experiment_root/$TESTSUBJECT/outputs/$VER/t600 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.TestReplicationHandler.doTestDetails $VER

echo " running test 601"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.TestReplicationHandler.doTestReplicateAfterWrite2Slave> $experiment_root/$TESTSUBJECT/outputs/$VER/t601 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.TestReplicationHandler.doTestReplicateAfterWrite2Slave $VER

echo " running test 602"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.TestReplicationHandler.doTestIndexAndConfigReplication> $experiment_root/$TESTSUBJECT/outputs/$VER/t602 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.TestReplicationHandler.doTestIndexAndConfigReplication $VER

echo " running test 603"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.TestReplicationHandler.doTestStopPoll> $experiment_root/$TESTSUBJECT/outputs/$VER/t603 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.TestReplicationHandler.doTestStopPoll $VER

echo " running test 604"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.TestReplicationHandler.doTestSnapPullWithMasterUrl> $experiment_root/$TESTSUBJECT/outputs/$VER/t604 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.TestReplicationHandler.doTestSnapPullWithMasterUrl $VER

echo " running test 605"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.TestReplicationHandler.doTestStressReplication> $experiment_root/$TESTSUBJECT/outputs/$VER/t605 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.TestReplicationHandler.doTestStressReplication $VER

echo " running test 606"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.TestReplicationHandler.doTestRepeater> $experiment_root/$TESTSUBJECT/outputs/$VER/t606 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.TestReplicationHandler.doTestRepeater $VER

echo " running test 607"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.TestReplicationHandler.doTestReplicateAfterStartup> $experiment_root/$TESTSUBJECT/outputs/$VER/t607 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.TestReplicationHandler.doTestReplicateAfterStartup $VER

echo " running test 608"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.TestReplicationHandler.doTestReplicateAfterStartupWithNoActivity> $experiment_root/$TESTSUBJECT/outputs/$VER/t608 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.TestReplicationHandler.doTestReplicateAfterStartupWithNoActivity $VER

echo " running test 609"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.TestReplicationHandler.doTestReplicateAfterCoreReload> $experiment_root/$TESTSUBJECT/outputs/$VER/t609 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.TestReplicationHandler.doTestReplicateAfterCoreReload $VER

echo " running test 610"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.TestReplicationHandler.doTestIndexAndConfigAliasReplication> $experiment_root/$TESTSUBJECT/outputs/$VER/t610 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.TestReplicationHandler.doTestIndexAndConfigAliasReplication $VER

echo " running test 611"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.TestReplicationHandler.doTestBackup> $experiment_root/$TESTSUBJECT/outputs/$VER/t611 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.TestReplicationHandler.doTestBackup $VER

echo " running test 612"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.DocumentAnalysisRequestHandlerTest.testResolveAnalysisRequest> $experiment_root/$TESTSUBJECT/outputs/$VER/t612 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.DocumentAnalysisRequestHandlerTest.testResolveAnalysisRequest $VER

echo " running test 613"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.DocumentAnalysisRequestHandlerTest.testCharsetInDocument> $experiment_root/$TESTSUBJECT/outputs/$VER/t613 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.DocumentAnalysisRequestHandlerTest.testCharsetInDocument $VER

echo " running test 614"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.DocumentAnalysisRequestHandlerTest.testCharsetOutsideDocument> $experiment_root/$TESTSUBJECT/outputs/$VER/t614 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.DocumentAnalysisRequestHandlerTest.testCharsetOutsideDocument $VER

echo " running test 615"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.DocumentAnalysisRequestHandlerTest.testHandleAnalysisRequest> $experiment_root/$TESTSUBJECT/outputs/$VER/t615 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.DocumentAnalysisRequestHandlerTest.testHandleAnalysisRequest $VER

echo " running test 616"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.JsonLoaderTest.testNullValues> $experiment_root/$TESTSUBJECT/outputs/$VER/t616 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.JsonLoaderTest.testNullValues $VER

echo " running test 617"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.JsonLoaderTest.testDeleteSyntax> $experiment_root/$TESTSUBJECT/outputs/$VER/t617 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.JsonLoaderTest.testDeleteSyntax $VER

echo " running test 618"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.BinaryUpdateRequestHandlerTest.testRequestParams> $experiment_root/$TESTSUBJECT/outputs/$VER/t618 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.BinaryUpdateRequestHandlerTest.testRequestParams $VER

echo " running test 619"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.admin.CoreAdminHandlerTest.testCoreAdminHandler> $experiment_root/$TESTSUBJECT/outputs/$VER/t619 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.admin.CoreAdminHandlerTest.testCoreAdminHandler $VER

echo " running test 620"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.admin.MBeansHandlerTest.testDiff> $experiment_root/$TESTSUBJECT/outputs/$VER/t620 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.admin.MBeansHandlerTest.testDiff $VER

echo " running test 621"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.admin.LoggingHandlerTest.testLogLevelHandlerOutput> $experiment_root/$TESTSUBJECT/outputs/$VER/t621 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.admin.LoggingHandlerTest.testLogLevelHandlerOutput $VER

echo " running test 622"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.admin.LukeRequestHandlerTest.testHistogramBucket> $experiment_root/$TESTSUBJECT/outputs/$VER/t622 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.admin.LukeRequestHandlerTest.testHistogramBucket $VER

echo " running test 623"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.admin.LukeRequestHandlerTest.testLuke> $experiment_root/$TESTSUBJECT/outputs/$VER/t623 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.admin.LukeRequestHandlerTest.testLuke $VER

echo " running test 624"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.admin.LukeRequestHandlerTest.testFlParam> $experiment_root/$TESTSUBJECT/outputs/$VER/t624 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.admin.LukeRequestHandlerTest.testFlParam $VER

echo " running test 625"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.TestCSVLoader.testCSVLoad> $experiment_root/$TESTSUBJECT/outputs/$VER/t625 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.TestCSVLoader.testCSVLoad $VER

echo " running test 626"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.TestCSVLoader.testCommitFalse> $experiment_root/$TESTSUBJECT/outputs/$VER/t626 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.TestCSVLoader.testCommitFalse $VER

echo " running test 627"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.TestCSVLoader.testCommitTrue> $experiment_root/$TESTSUBJECT/outputs/$VER/t627 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.TestCSVLoader.testCommitTrue $VER

echo " running test 628"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.TestCSVLoader.testLiteral> $experiment_root/$TESTSUBJECT/outputs/$VER/t628 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.TestCSVLoader.testLiteral $VER

echo " running test 629"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.TestCSVLoader.testCSV> $experiment_root/$TESTSUBJECT/outputs/$VER/t629 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.TestCSVLoader.testCSV $VER

echo " running test 630"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.FieldAnalysisRequestHandlerTest.testResolveAnalysisRequest> $experiment_root/$TESTSUBJECT/outputs/$VER/t630 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.FieldAnalysisRequestHandlerTest.testResolveAnalysisRequest $VER

echo " running test 631"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.FieldAnalysisRequestHandlerTest.testHandleAnalysisRequest> $experiment_root/$TESTSUBJECT/outputs/$VER/t631 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.FieldAnalysisRequestHandlerTest.testHandleAnalysisRequest $VER

echo " running test 632"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.FieldAnalysisRequestHandlerTest.testCharFilterAnalysis> $experiment_root/$TESTSUBJECT/outputs/$VER/t632 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.FieldAnalysisRequestHandlerTest.testCharFilterAnalysis $VER

echo " running test 633"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.FieldAnalysisRequestHandlerTest.testPositionHistoryWithWDF> $experiment_root/$TESTSUBJECT/outputs/$VER/t633 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.FieldAnalysisRequestHandlerTest.testPositionHistoryWithWDF $VER

echo " running test 634"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.XsltUpdateRequestHandlerTest.testUpdate> $experiment_root/$TESTSUBJECT/outputs/$VER/t634 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.XsltUpdateRequestHandlerTest.testUpdate $VER

echo " running test 635"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.XsltUpdateRequestHandlerTest.testEntities> $experiment_root/$TESTSUBJECT/outputs/$VER/t635 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.XsltUpdateRequestHandlerTest.testEntities $VER

echo " running test 636"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.DebugComponentTest.testBasicInterface> $experiment_root/$TESTSUBJECT/outputs/$VER/t636 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.DebugComponentTest.testBasicInterface $VER

echo " running test 637"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.DebugComponentTest.testPerItemInterface> $experiment_root/$TESTSUBJECT/outputs/$VER/t637 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.DebugComponentTest.testPerItemInterface $VER

echo " running test 638"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.QueryElevationComponentTest.testFieldType> $experiment_root/$TESTSUBJECT/outputs/$VER/t638 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.QueryElevationComponentTest.testFieldType $VER

echo " running test 639"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.QueryElevationComponentTest.testTrieFieldType> $experiment_root/$TESTSUBJECT/outputs/$VER/t639 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.QueryElevationComponentTest.testTrieFieldType $VER

echo " running test 640"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.QueryElevationComponentTest.testInterface> $experiment_root/$TESTSUBJECT/outputs/$VER/t640 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.QueryElevationComponentTest.testInterface $VER

echo " running test 641"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.QueryElevationComponentTest.testMarker> $experiment_root/$TESTSUBJECT/outputs/$VER/t641 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.QueryElevationComponentTest.testMarker $VER

echo " running test 642"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.QueryElevationComponentTest.testMarkExcludes> $experiment_root/$TESTSUBJECT/outputs/$VER/t642 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.QueryElevationComponentTest.testMarkExcludes $VER

echo " running test 643"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.QueryElevationComponentTest.testSorting> $experiment_root/$TESTSUBJECT/outputs/$VER/t643 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.QueryElevationComponentTest.testSorting $VER

echo " running test 644"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.QueryElevationComponentTest.testElevationReloading> $experiment_root/$TESTSUBJECT/outputs/$VER/t644 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.QueryElevationComponentTest.testElevationReloading $VER

echo " running test 645"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.TermVectorComponentTest.testBasics> $experiment_root/$TESTSUBJECT/outputs/$VER/t645 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.TermVectorComponentTest.testBasics $VER

echo " running test 646"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.TermVectorComponentTest.testOptions> $experiment_root/$TESTSUBJECT/outputs/$VER/t646 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.TermVectorComponentTest.testOptions $VER

echo " running test 647"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.TermVectorComponentTest.testPerField> $experiment_root/$TESTSUBJECT/outputs/$VER/t647 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.TermVectorComponentTest.testPerField $VER

echo " running test 648"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.TermsComponentTest.testEmptyLower> $experiment_root/$TESTSUBJECT/outputs/$VER/t648 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.TermsComponentTest.testEmptyLower $VER

echo " running test 649"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.TermsComponentTest.testMultipleFields> $experiment_root/$TESTSUBJECT/outputs/$VER/t649 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.TermsComponentTest.testMultipleFields $VER

echo " running test 650"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.TermsComponentTest.testUnlimitedRows> $experiment_root/$TESTSUBJECT/outputs/$VER/t650 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.TermsComponentTest.testUnlimitedRows $VER

echo " running test 651"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.TermsComponentTest.testPrefix> $experiment_root/$TESTSUBJECT/outputs/$VER/t651 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.TermsComponentTest.testPrefix $VER

echo " running test 652"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.TermsComponentTest.testRegexp> $experiment_root/$TESTSUBJECT/outputs/$VER/t652 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.TermsComponentTest.testRegexp $VER

echo " running test 653"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.TermsComponentTest.testRegexpFlagParsing> $experiment_root/$TESTSUBJECT/outputs/$VER/t653 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.TermsComponentTest.testRegexpFlagParsing $VER

echo " running test 654"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.TermsComponentTest.testRegexpWithFlags> $experiment_root/$TESTSUBJECT/outputs/$VER/t654 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.TermsComponentTest.testRegexpWithFlags $VER

echo " running test 655"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.TermsComponentTest.testSortCount> $experiment_root/$TESTSUBJECT/outputs/$VER/t655 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.TermsComponentTest.testSortCount $VER

echo " running test 656"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.TermsComponentTest.testSortIndex> $experiment_root/$TESTSUBJECT/outputs/$VER/t656 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.TermsComponentTest.testSortIndex $VER

echo " running test 657"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.TermsComponentTest.testPastUpper> $experiment_root/$TESTSUBJECT/outputs/$VER/t657 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.TermsComponentTest.testPastUpper $VER

echo " running test 658"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.TermsComponentTest.testLowerExclusive> $experiment_root/$TESTSUBJECT/outputs/$VER/t658 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.TermsComponentTest.testLowerExclusive $VER

echo " running test 659"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.TermsComponentTest.test> $experiment_root/$TESTSUBJECT/outputs/$VER/t659 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.TermsComponentTest.test $VER

echo " running test 660"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.TermsComponentTest.testMinMaxFreq> $experiment_root/$TESTSUBJECT/outputs/$VER/t660 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.TermsComponentTest.testMinMaxFreq $VER

echo " running test 661"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.BadComponentTest.testBadElevate> $experiment_root/$TESTSUBJECT/outputs/$VER/t661 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.BadComponentTest.testBadElevate $VER

echo " running test 662"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.ResponseLogComponentTest.testToLogIds> $experiment_root/$TESTSUBJECT/outputs/$VER/t662 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.ResponseLogComponentTest.testToLogIds $VER

echo " running test 663"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.ResponseLogComponentTest.testToLogScores> $experiment_root/$TESTSUBJECT/outputs/$VER/t663 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.ResponseLogComponentTest.testToLogScores $VER

echo " running test 664"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.ResponseLogComponentTest.testDisabling> $experiment_root/$TESTSUBJECT/outputs/$VER/t664 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.ResponseLogComponentTest.testDisabling $VER

echo " running test 665"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.SpellCheckComponentTest.testExtendedResultsCount> $experiment_root/$TESTSUBJECT/outputs/$VER/t665 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.SpellCheckComponentTest.testExtendedResultsCount $VER

echo " running test 666"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.SpellCheckComponentTest.test> $experiment_root/$TESTSUBJECT/outputs/$VER/t666 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.SpellCheckComponentTest.test $VER

echo " running test 667"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.SpellCheckComponentTest.testPerDictionary> $experiment_root/$TESTSUBJECT/outputs/$VER/t667 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.SpellCheckComponentTest.testPerDictionary $VER

echo " running test 668"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.SpellCheckComponentTest.testCollate> $experiment_root/$TESTSUBJECT/outputs/$VER/t668 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.SpellCheckComponentTest.testCollate $VER

echo " running test 669"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.SpellCheckComponentTest.testCorrectSpelling> $experiment_root/$TESTSUBJECT/outputs/$VER/t669 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.SpellCheckComponentTest.testCorrectSpelling $VER

echo " running test 670"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.SpellCheckComponentTest.testRelativeIndexDirLocation> $experiment_root/$TESTSUBJECT/outputs/$VER/t670 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.SpellCheckComponentTest.testRelativeIndexDirLocation $VER

echo " running test 671"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.SpellCheckComponentTest.testReloadOnStart> $experiment_root/$TESTSUBJECT/outputs/$VER/t671 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.SpellCheckComponentTest.testReloadOnStart $VER

echo " running test 672"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.SpellCheckComponentTest.testRebuildOnCommit> $experiment_root/$TESTSUBJECT/outputs/$VER/t672 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.SpellCheckComponentTest.testRebuildOnCommit $VER

echo " running test 673"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.SpellCheckComponentTest.testThresholdTokenFrequency> $experiment_root/$TESTSUBJECT/outputs/$VER/t673 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.SpellCheckComponentTest.testThresholdTokenFrequency $VER

echo " running test 674"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.component.SearchHandlerTest.testInitalization> $experiment_root/$TESTSUBJECT/outputs/$VER/t674 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.component.SearchHandlerTest.testInitalization $VER

echo " running test 675"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.MoreLikeThisHandlerTest.testInterface> $experiment_root/$TESTSUBJECT/outputs/$VER/t675 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.MoreLikeThisHandlerTest.testInterface $VER

echo " running test 676"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.handler.CSVRequestHandlerTest.testCommitWithin> $experiment_root/$TESTSUBJECT/outputs/$VER/t676 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.handler.CSVRequestHandlerTest.testCommitWithin $VER

echo " running test 677"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.SampleTest.testSimple> $experiment_root/$TESTSUBJECT/outputs/$VER/t677 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.SampleTest.testSimple $VER

echo " running test 678"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.SampleTest.testAdvanced> $experiment_root/$TESTSUBJECT/outputs/$VER/t678 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.SampleTest.testAdvanced $VER

echo " running test 679"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.DisMaxRequestHandlerTest.testSomeStuff> $experiment_root/$TESTSUBJECT/outputs/$VER/t679 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.DisMaxRequestHandlerTest.testSomeStuff $VER

echo " running test 680"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.DisMaxRequestHandlerTest.testExtraBlankBQ> $experiment_root/$TESTSUBJECT/outputs/$VER/t680 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.DisMaxRequestHandlerTest.testExtraBlankBQ $VER

echo " running test 681"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.MinimalSchemaTest.testSimpleQueries> $experiment_root/$TESTSUBJECT/outputs/$VER/t681 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.MinimalSchemaTest.testSimpleQueries $VER

echo " running test 682"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.MinimalSchemaTest.testLuke> $experiment_root/$TESTSUBJECT/outputs/$VER/t682 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.MinimalSchemaTest.testLuke $VER

echo " running test 683"
java -enableassertions -javaagent:/home/wliu/java/jacoco/jacocoagent.jar=excludes=$EXCLUDEDCLASSES SingleJUnitTestRunner org.apache.solr.MinimalSchemaTest.testAllConfiguredHandlers> $experiment_root/$TESTSUBJECT/outputs/$VER/t683 2>&1
$experiment_root/$TESTSUBJECT/scripts/TestScripts/jacoco.sh org.apache.solr.MinimalSchemaTest.testAllConfiguredHandlers $VER

