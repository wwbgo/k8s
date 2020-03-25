FROM docker.flexem.com/library/jenkins-slave:0.1.0
LABEL MAINTAINER="wwb<wwbgo@qq.com>" CREATEDATE="2020.3.24"

ENV SONAR_URL=http://sonar.flexem.net \
	SONAR_TOKEN=87078a26a84c76a2489a85db8b6c92a0f3d47725 \
	PATH="$PATH:/root/.dotnet/tools"

USER root
WORKDIR /opt
RUN apt-get update && \
	apt-get install -y apt-transport-https && \
	wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.asc.gpg && \
	mv microsoft.asc.gpg /etc/apt/trusted.gpg.d/ && \
	wget -q https://packages.microsoft.com/config/debian/9/prod.list && \
	mv prod.list /etc/apt/sources.list.d/microsoft-prod.list && \
	chown root:root /etc/apt/trusted.gpg.d/microsoft.asc.gpg && \
	chown root:root /etc/apt/sources.list.d/microsoft-prod.list && \
	apt-get update && \
	apt-get install -y dotnet-sdk-3.1 && \
	dotnet tool install --global dotnet-sonarscanner --version 4.8.0 && \
	echo '<?xml version="1.0" encoding="utf-8" ?>' > /opt/SonarQube.Analysis.xml && \
	echo '<SonarQubeAnalysisProperties  xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns="http://www.sonarsource.com/msbuild/integration/2015/1">' >> /opt/SonarQube.Analysis.xml && \
	echo "<Property Name=\"sonar.host.url\">$SONAR_URL</Property>" >> /opt/SonarQube.Analysis.xml && \
	echo "<Property Name=\"sonar.login\">$SONAR_TOKEN</Property>" >> /opt/SonarQube.Analysis.xml && \
	echo '</SonarQubeAnalysisProperties>' >> /opt/SonarQube.Analysis.xml && \
	cp /opt/SonarQube.Analysis.xml /root/.dotnet/tools/.store/dotnet-sonarscanner/4.8.0/dotnet-sonarscanner/4.8.0/tools/netcoreapp2.1/any/SonarQube.Analysis.xml && \
	cp /opt/SonarQube.Analysis.xml /root/.dotnet/tools/.store/dotnet-sonarscanner/4.8.0/dotnet-sonarscanner/4.8.0/tools/netcoreapp3.0/any/SonarQube.Analysis.xml

USER ${user}

ENTRYPOINT ./start.sh