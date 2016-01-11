FROM java:8-jre

# install sbt
RUN cd /tmp \
 && curl -LO http://ftp.riken.jp/net/apache/spark/spark-1.6.0/spark-1.6.0-bin-hadoop2.6.tgz\
 && tar zxf spark-1.6.0-bin-hadoop2.6.tgz \
 && mv spark-1.6.0-bin-hadoop2.6 /app \
 && rm spark-1.6.0-bin-hadoop2.6.tgz

# environment
# ENV JAVA_HOME=$(readlink -f /usr/bin/java | sed "s:/bin/java::")
ENV JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre
ENV PATH=/app/bin:/app/sbin:$PATH
WORKDIR /app

# entry point
COPY docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["idle"]

# expose port
# master web: 8080
# master etc: 7077 6066
# worker web: 8081
# worker etc: 7078
# EXPOSE 6066 7077 7078 8080 8081

# fix spark worker port
# ENV SPARK_WORKER_PORT=7078
# EXPOSE 7078

