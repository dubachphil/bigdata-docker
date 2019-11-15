# BigData with Docker on CentOS 8

## Building
- git clone https://github.com/dubachphil/bigdata-docker.git
- cd bigdata-docker
- sh ./build_images.sh

## Deployment
- cd bigdata-docker
- docker-compose up -d
- Open Webbrowser http://"Host IP Address":9870

## Copy Files from outside to HDFS
- docker cp datanode myfile /                         #copy localfile to container
- docker exec datanode hadoop fs -mkdir /home         #create a directory in hdfs filesystem
- docker exec datanode hadoop fs -put myfile /home    #put the file into hdfs filesystem 
- docker exec datanode rm myfile                      #remove myfile in container
- docker exec datanode hadoop fs -rm /home/myfile     #remove myfile in hdfs filesystem

## Shutdown System
- docker-compose down
