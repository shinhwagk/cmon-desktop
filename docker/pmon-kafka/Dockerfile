FROM pmon/serverjre:9.0.4

ENV KAFKA_PKG=kafka_2.11-1.0.1.tgz
ENV KAFKA_HOME=/usr/kafka_2.11-1.0.1

ADD $KAFKA_PKG /usr/
ADD entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]