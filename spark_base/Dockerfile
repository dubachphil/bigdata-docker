FROM dubachphil/hadoop_base

LABEL maintainer="Philipp Dubach <dubachphil@hotmail.com>"

ENV ENABLE_INIT_DAEMON true
ENV INIT_DAEMON_BASE_URI http://identifier/init-daemon
ENV INIT_DAEMON_STEP spark_master_init

ENV SPARK_VERSION=2.4.4
#ENV HADOOP_VERSION=3.2

RUN dnf update -y 
RUN dnf install wget curl java-1.8.0-openjdk perl nmap-ncat java-1.8.0-openjdk-devel.x86_64 -y
RUN ln -s /lib64/ld-linux-x86-64.so.2 /lib/ld-linux-x86-64.so.2

RUN wget http://mirror.easyname.ch/apache/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-without-hadoop.tgz
RUN tar -xvzf spark-${SPARK_VERSION}-bin-without-hadoop.tgz
RUN mv spark-${SPARK_VERSION}-bin-without-hadoop spark
RUN rm spark-${SPARK_VERSION}-bin-without-hadoop.tgz

ENV PYTHONHASHSEED 1
ENV SPARK_HOME=/spark
ENV PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/build:$PYTHONPATH
ENV PATH="/spark:${PATH}"
ENV PATH="/spark/bin:${PATH}"
ENV SPARK_DIST_CLASSPATH=/etc/hadoop:/opt/hadoop-3.1.3/share/hadoop/common/lib/*:/opt/hadoop-3.1.3/share/hadoop/common/*:/opt/hadoop-3.1.3/share/hadoop/hdfs:/opt/hadoop-3.1.3/share/hadoop/hdfs/lib/*:/opt/hadoop-3.1.3/share/hadoop/hdfs/*:/opt/hadoop-3.1.3/share/hadoop/mapreduce/lib/*:/opt/hadoop-3.1.3/share/hadoop/mapreduce/*:/opt/hadoop-3.1.3/share/hadoop/yarn:/opt/hadoop-3.1.3/share/hadoop/yarn/lib/*:/opt/hadoop-3.1.3/share/hadoop/yarn/*

RUN echo 'spark.yarn.archive hdfs:///archive/jars/spark-libs.jar' >> /spark/conf/spark-defaults.conf
RUN echo 'spark.cores.max 4' >> /spark/conf/spark-defaults.conf
