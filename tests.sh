#!/bin/bash
docker exec bigdata-docker_spark-master_1 spark-submit --master local /root/wordcount.py
docker exec bigdata-docker_spark-master_1 spark-submit --master spark://spark-master:7077 /root/wordcount.py
docker exec bigdata-docker_spark-master_1 spark-submit --master yarn /root/wordcount.py
docker exec bigdata-docker_spark-master_1 hdfs dfs -ls /home/
docker exec bigdata-docker_spark-master_1 hdfs dfs -cat /home/wordcount.txt
