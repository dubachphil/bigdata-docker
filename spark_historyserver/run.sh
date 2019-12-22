#!/bin/bash
. "/spark/sbin/spark-config.sh"
. "/spark/bin/load-spark-env.sh"

mkdir -p $SPARK_HISTORY_LOG
mkdir /spark/logs/

#touch /spark/logs/spark-history.out
#ln -sf /dev/stdout /spark/logs/spark-history.out

./spark/sbin/start-history-server.sh
tail -f /spark/logs/*
#/spark/sbin/../bin/spark-class org.apache.spark.deploy.history.HistoryServer #>> /spark/logs/spark-history.out
