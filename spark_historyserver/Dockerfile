FROM dubachphil/spark_base

LABEL maintainer="Philipp Dubach <dubachphil@hotmail.com>"

ADD run.sh /run.sh
RUN chmod a+x /run.sh

ENV SPARK_HISTORY_WEBUI_PORT 18080
ENV SPARK_MASTER "spark://spark-master:7077"
ENV SPARK_HISTORY_LOG /spark/logs
ENV SPARK_EVENTS /spark/events

HEALTHCHECK CMD curl -f http://localhost:18080/ || exit 1
EXPOSE 18080

CMD ["/bin/bash", "/run.sh"]
