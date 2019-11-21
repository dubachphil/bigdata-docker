FROM dubachphil/spark_base

LABEL maintainer="Philipp Dubach <dubachphil@hotmail.com>"

ADD run.sh /run.sh
RUN chmod a+x /run.sh

ENV SPARK_WORKER_PORT 7077
ENV SPARK_WORKER_WEBUI_PORT 8080
ENV SPARK_MASTER "spark://spark-master:7077"

EXPOSE 8081

CMD ["/bin/bash", "/run.sh"]
