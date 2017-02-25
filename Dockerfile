FROM openjdk:8-jdk

RUN apt-get update && apt-get install -y make

VOLUME /project
VOLUME /root/.m2

ENV _JAVA_OPTIONS="-Duser.home=/root"
RUN chmod 777 /root

ENV MAVEN_VERSION=3.3.9 \
    MAVEN_HOME=/usr/share/maven

RUN curl -fsSL http://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
     | tar -xzC /usr/share \
    && ln -s /usr/share/apache-maven-${MAVEN_VERSION} ${MAVEN_HOME} \
    && ln -s ${MAVEN_HOME}/bin/mvn /usr/bin/mvn

WORKDIR /project

CMD ["bash"]
