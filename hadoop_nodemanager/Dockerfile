FROM dubachphil/hadoop_base

MAINTAINER Philipp Dubach <dubachphil@hotmail.com>

HEALTHCHECK CMD curl -f http://localhost:8042/ || exit 1

ADD run.sh /run.sh
RUN chmod a+x /run.sh

EXPOSE 8042

CMD ["/run.sh"]
