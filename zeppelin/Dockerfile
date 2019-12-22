FROM dubachphil/spark_base

LABEL maintainer="Philipp Dubach <dubachphil@hotmail.com>"

RUN curl -fSL "http://www-eu.apache.org/dist/zeppelin/zeppelin-0.8.1/zeppelin-0.8.1-bin-all.tgz" -o /tmp/zeppelin.tgz
RUN tar -xzvf /tmp/zeppelin.tgz -C /opt/
RUN mv /opt/zeppelin-* /opt/zeppelin
RUN rm /tmp/zeppelin.tgz

WORKDIR /opt/zeppelin

#RUN ./bin/install-interpreter.sh --all

HEALTHCHECK CMD curl -f http://localhost:9999/ || exit 1

CMD ["/opt/zeppelin/bin/zeppelin.sh"]
