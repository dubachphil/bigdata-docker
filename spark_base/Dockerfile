FROM dubachphil/hadoop_base

LABEL maintainer="Philipp Dubach <dubachphil@hotmail.com>"

ENV ENABLE_INIT_DAEMON true
ENV INIT_DAEMON_BASE_URI http://identifier/init-daemon
ENV INIT_DAEMON_STEP spark_master_init

ENV SPARK_VERSION=3.0.0
ENV HADOOP_VERSION=3.2

RUN dnf update -y 
RUN dnf install wget curl java-1.8.0-openjdk perl nmap-ncat java-1.8.0-openjdk-devel.x86_64 -y
RUN ln -s /lib64/ld-linux-x86-64.so.2 /lib/ld-linux-x86-64.so.2

RUN wget http://mirror.easyname.ch/apache/spark/spark-${SPARK_VERSION}-preview/spark-${SPARK_VERSION}-preview-bin-hadoop${HADOOP_VERSION}.tgz
RUN tar -xvzf spark-${SPARK_VERSION}-preview-bin-hadoop${HADOOP_VERSION}.tgz
RUN mv spark-${SPARK_VERSION}-preview-bin-hadoop${HADOOP_VERSION} spark
RUN rm spark-${SPARK_VERSION}-preview-bin-hadoop${HADOOP_VERSION}.tgz

ENV PYTHONHASHSEED 1
ENV SPARK_HOME=/spark
ENV PYTHONPATH=$SPARK_HOME/python:$SPARK_HOME/python/build:$PYTHONPATH
ENV PATH="/spark:${PATH}"
ENV PATH="/spark/bin:${PATH}"
ENV SPARK_DIST_CLASSPATH=/etc/hadoop:/opt/hadoop-3.2.1/share/hadoop/common/lib/*:/opt/hadoop-3.2.1/share/hadoop/common/*:/opt/hadoop-3.2.1/share/hadoop/hdfs:/opt/hadoop-3.2.1/share/hadoop/hdfs/lib/*:/opt/hadoop-3.2.1/share/hadoop/hdfs/*:/opt/hadoop-3.2.1/share/hadoop/mapreduce/lib/*:/opt/hadoop-3.2.1/share/hadoop/mapreduce/*:/opt/hadoop-3.2.1/share/hadoop/yarn:/opt/hadoop-3.2.1/share/hadoop/yarn/lib/*:/opt/hadoop-3.2.1/share/hadoop/yarn/*

RUN jar cv0f spark-libs.jar -C $SPARK_HOME/jars/ .
RUN hdfs dfs -mkdir /archiv
RUN hdfs dfs -mkdir /archiv/jars
RUN hdfs dfs -put spark-libs.jar /archiv/jars
RUN echo 'spark.yarn.archive hdfs:///archiv/jars/spark-libs.jar' >> /spark/conf/spark-defaults.conf
