#!/bin/bash
docker exec bigdata-docker_spark-master_1 jar cv0f spark-libs.jar -C /spark/jars/ .
docker exec bigdata-docker_spark-master_1 hdfs dfs -mkdir /archive
docker exec bigdata-docker_spark-master_1 hdfs dfs -mkdir /archive/jars
docker exec bigdata-docker_spark-master_1 hdfs dfs -put -f spark-libs.jar /archive/jars
docker exec bigdata-docker_spark-master_1 hdfs dfs -mkdir /home
docker exec bigdata-docker_spark-master_1 hdfs dfs -put -f /root/wordcount.py /home
docker exec bigdata-docker_spark-master_1 hdfs dfs -put -f /root/wordcount.txt /home
