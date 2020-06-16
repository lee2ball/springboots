FROM       maven:3.6-jdk-8
MAINTAINER lee
RUN mkdir -p /usr/local/app/

RUN wget -O /usr/share/maven/ref/settings-docker.xml  http://share.devops.cloud2go.cn/dev/cloud-ide/extension/java/settings.xml

RUN export MAVEN_NEXUS_REPO=http://nexus.devops.cloud2go.cn/repository/maven-public
#maven
ADD  ./  /usr/local/app/
# 设置工作目录
WORKDIR /usr/local/app/
RUN mvn clean package -Dmaven.test.skip=true
CMD java -jar target/*.jar 