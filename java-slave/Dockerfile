# FROM jenkins/inbound-agent:latest
FROM openjdk:11-jdk-slim

USER root

# Install Java JDK
# RUN apt-get update \
#     && apt-get install -y software-properties-common \
#     && add-apt-repository -y ppa:openjdk-r/ppa \
#     && apt-get update \
#     && apt-get install -y openjdk-11-jdk \
#     && apt-get clean \
#     && rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y curl && \
    curl --silent --show-error --location --fail \
    --output /usr/share/jenkins/agent.jar \
    https://repo.jenkins-ci.org/public/org/jenkins-ci/main/remoting/4.13/remoting-4.13.jar && \
    rm -rf /var/lib/apt/lists/*

# Set Java environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

USER jenkins

# Expose working directory
WORKDIR /home/jenkins

# Command to run Jenkins agent

ENTRYPOINT ["java", "-jar", "/usr/share/jenkins/agent.jar"]
