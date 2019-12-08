#!/bin/bash
docker login --username=dubachphil
docker push dubachphil/hadoop_base:latest
docker push dubachphil/hadoop_namenode:latest
docker push dubachphil/hadoop_datanode:latest
docker push dubachphil/hadoop_resourcemanager:latest
docker push dubachphil/hadoop_historyserver:latest
docker push dubachphil/hadoop_nodemanager:latest
docker push dubachphil/spark_base:latest
docker push dubachphil/spark_master:latest
docker push dubachphil/spark_worker:latest
docker push dubachphil/zeppelin:latest
docker push dubachphil/hue:latest
