FROM openjdk:8-jdk-alpine

RUN apk --no-cache --update add make docker curl bash

VOLUME /project
VOLUME /root/.m2

ENV MAVEN_OPTS="-Dmaven.repo.local=/root/.m2/repository/"
RUN chmod 777 /root

ENV JAVA_HOME=/usr/lib/jvm/java-1.8-openjdk \
    MAVEN_VERSION=3.3.9 \
    MAVEN_HOME=/usr/share/maven

RUN curl -fsSL http://archive.apache.org/dist/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
     | tar -xzC /usr/share \
    && ln -s /usr/share/apache-maven-${MAVEN_VERSION} ${MAVEN_HOME} \
    && ln -s ${MAVEN_HOME}/bin/mvn /usr/bin/mvn

WORKDIR /project

CMD ["bash"]
