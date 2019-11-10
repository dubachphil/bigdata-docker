#!/bin/bash
docker build -t dubachphil/hadoop_base:latest ./hadoop_base
docker build -t dubachphil/hadoop_namenode:latest ./hadoop_namenode
docker build -t dubachphil/hadoop_datanode:latest ./hadoop_datanode
docker build -t dubachphil/hadoop_resourcemanager:latest ./hadoop_resourcemanager
docker build -t dubachphil/hadoop_nodemanager:latest ./hadoop_nodemanager
docker build -t dubachphil/hadoop_historyserver:latest ./hadoop_historyserver
