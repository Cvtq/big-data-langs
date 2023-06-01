#!/bin/bash

echo "Compiling and assembling application..."
sbt assembly
JARFILE=`pwd`/target/scala-2.12/HelloWorld-assembly-0.1.0.jar
${SPARK_HOME}/bin/spark-submit --class HelloWorld --master local $JARFILE
