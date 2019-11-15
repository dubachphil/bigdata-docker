# BigData with Docker on CentOS 8

## Building
<pre>
- git clone https://github.com/dubachphil/bigdata-docker.git
- cd bigdata-docker
- sh ./build_images.sh
</pre>
## Deployment
<pre>
- cd bigdata-docker
- docker-compose up -d
- Open Webbrowser http://"Host IP Address":9870
</pre>

## Copy Files from outside to HDFS
<pre>
- docker cp datanode myfile /                        #copy localfile to container
- docker exec datanode hadoop fs -mkdir /home        #create a directory in hdfs filesystem
- docker exec datanode hadoop fs -put myfile /home   #put the file into hdfs filesystem
- docker exec datanode rm myfile                     #remove myfile in container
- docker exec datanode hadoop fs -rm /home/myfile    #remove myfile in hdfs filesystem
</pre>
## Shutdown System
<pre>
- docker-compose down
</pre>
