#!/bin/bash
programname=$0

function usage {
    echo "usage: sh $programname [path_to_localfile]"
    exit 1
}

if [$1 = ''] 
then 
  usage
else
  file=$(basename $1)
  echo "Path to your File: $1"
  echo "Filename: $file"
  echo "###### COPY TO CONTAINER ######"
  docker cp $1 bigdata-docker_spark-master_1:/tmp/
  echo "###### CREATE DIRECTORY UPLOAD  ######"
  docker exec bigdata-docker_spark-master_1 hdfs dfs -mkdir /upload
  echo "###### UPLOAD FILE TO HDFS FILESTORAGE ######"
  docker exec bigdata-docker_spark-master_1 hdfs dfs -put -f /tmp/$file /upload/
  echo "###### CLEANUP FILE IN CONTAINER ######"
  docker exec bigdata-docker_spark-master_1 rm -f /tmp/$file
  echo "###### DONE ######"
  echo "Your file: $1 is sucessfully uploaded to hdfs /home/upload/$file"
fi
