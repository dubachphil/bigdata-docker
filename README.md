# BigData with Docker on CentOS 8

## Building
<pre>
- git clone https://github.com/dubachphil/bigdata-docker.git    # Clone my repo :)
- cd bigdata-docker                                             # Change to the cloned folder
- sh ./build_images.sh                                          # Build the images (9 GB)
</pre>
## Deployment
<pre>
- cd bigdata-docker                                             # Change to the directoy
- docker-compose up -d                                          # Starting the Single Node Cluster
- Open Webbrowser http://"Host IP Address":9870                 # Check if running correctly
</pre>

## Copy Files from outside to HDFS
<pre>
- docker cp datanode myfile /                                   # copy localfile to container
- docker exec datanode hadoop fs -mkdir /home                   # create a directory in hdfs filesystem
- docker exec datanode hadoop fs -put myfile /home              # put the file into hdfs filesystem
- docker exec datanode rm myfile                                # remove myfile in container
- docker exec datanode hadoop fs -rm /home/myfile               # remove myfile in hdfs filesystem
</pre>
## Shutdown System
<pre>
- docker-compose down                                           # Shut down the system. 
                                                                # All Data are stored in Docker Volume
                                                                # You will not loose the data
</pre> 

## Remove all persistent Volumes
<pre>
docker volume rm $(docker volume ls -f name=docker-hadoop_hadoop_ -q)
</pre> 
