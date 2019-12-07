FROM centos:8

MAINTAINER Philipp Dubach <dubachphil@hotmail.com>

RUN dnf update -y 
RUN dnf install curl java-1.8.0-openjdk perl nmap-ncat java-1.8.0-openjdk-devel.x86_64 -y
RUN dnf install glibc-langpack-en nano python3 python3-pip -y
RUN pip3 install pyspark pandas findspark matplotlib scikit-learn seaborn h5py scipy tflearn tensorflow scikit-image
      
ENV JAVA_HOME=/usr/lib/jvm/jre-1.8.0-openjdk/


ENV HADOOP_VERSION 3.1.3
ENV HADOOP_URL https://www.apache.org/dist/hadoop/common/hadoop-$HADOOP_VERSION/hadoop-$HADOOP_VERSION.tar.gz

RUN set -x \
    && curl -fSL "$HADOOP_URL" -o /tmp/hadoop.tar.gz \
    && curl -fSL "$HADOOP_URL.asc" -o /tmp/hadoop.tar.gz.asc \
    && tar -xvf /tmp/hadoop.tar.gz -C /opt/ \
    && rm -f /tmp/hadoop.tar.gz*

RUN ln -s /opt/hadoop-$HADOOP_VERSION/etc/hadoop /etc/hadoop
RUN echo "alias ll='ls -la'" >> /root/.bashrc
RUN echo "alias ll='ls -la'" >> /etc/bash.bashrc
RUN echo "alias python='/usr/bin/python3'" >> /root/.bashrc
RUN echo "alias python='/usr/bin/python3'" >> /etc/bash.bashrc

RUN mkdir /opt/hadoop-$HADOOP_VERSION/logs

RUN mkdir /hadoop-data

ENV HADOOP_HOME=/opt/hadoop-$HADOOP_VERSION
ENV HADOOP_CONF_DIR=/etc/hadoop
ENV MULTIHOMED_NETWORK=1
ENV USER=root
ENV PATH $HADOOP_HOME/bin/:$PATH
ENV PATH /usr/bin:$PATH

ADD entrypoint.sh /entrypoint.sh

RUN chmod a+x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
