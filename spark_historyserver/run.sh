#!/bin/bash
. "/spark/sbin/spark-config.sh"
. "/spark/bin/load-spark-env.sh"

mkdir -p $SPARK_HISTORY_LOG
ln -sf /dev/stdout $SPARK_HISTORY_LOG/spark-events

#./spark/sbin/start-history-server.sh >> $SPARK_HISTORY_LOG/spark-events
/spark/sbin/../bin/spark-class org.apache.spark.deploy.history.HistoryServer >> /tmp/spark-events/spark.out
