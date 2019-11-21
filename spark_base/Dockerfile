FROM centos:8

LABEL maintainer="Philipp Dubach <dubachphil@hotmail.com>"

ENV ENABLE_INIT_DAEMON true
ENV INIT_DAEMON_BASE_URI http://identifier/init-daemon
ENV INIT_DAEMON_STEP spark_master_init

ENV SPARK_VERSION=3.0.0
ENV HADOOP_VERSION=3.2

RUN dnf update -y 
RUN dnf install wget curl java-1.8.0-openjdk perl nmap-ncat java-1.8.0-openjdk-devel.x86_64 python3 python3-pip -y
RUN ln -s /lib64/ld-linux-x86-64.so.2 /lib/ld-linux-x86-64.so.2

RUN wget http://mirror.easyname.ch/apache/spark/spark-${SPARK_VERSION}-preview/spark-${SPARK_VERSION}-preview-bin-hadoop${HADOOP_VERSION}.tgz
#RUN wget https://archive.apache.org/dist/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz
RUN tar -xvzf spark-${SPARK_VERSION}-preview-bin-hadoop${HADOOP_VERSION}.tgz
#RUN tar -xvzf spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz
RUN mv spark-${SPARK_VERSION}-preview-bin-hadoop${HADOOP_VERSION} spark
#RUN mv spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION} spark
RUN rm spark-${SPARK_VERSION}-preview-bin-hadoop${HADOOP_VERSION}.tgz
#RUN rm spark-${SPARK_VERSION}-bin-hadoop${HADOOP_VERSION}.tgz

ENV PYTHONHASHSEED 1
