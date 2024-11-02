FROM jenkins/inbound-agent:latest

USER root

COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

RUN apt-get update && \
    apt-get install -y openjdk-17-jdk wget && \
    rm -rf /var/lib/apt/lists/*

# Set Java environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

USER jenkins

# Expose working directory
WORKDIR /home/jenkins

ENTRYPOINT ["/usr/local/bin/start.sh"]
