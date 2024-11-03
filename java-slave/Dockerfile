FROM jenkins/inbound-agent:latest

USER root
RUN ulimit -n 1024

COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Install essential tools and OpenJDK 17
RUN apt-get update && \
    apt-get install -y \
    wget \
    curl \
    git \
    openjdk-17-jdk \
    lsof \
    && rm -rf /var/lib/apt/lists/*


# Set Java environment variables
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# Set up Maven environment variables
ENV MAVEN_VERSION=3.9.6
ENV MAVEN_HOME=/usr/share/maven
ENV PATH=${MAVEN_HOME}/bin:${PATH}

RUN wget https://dlcdn.apache.org/maven/maven-3/${MAVEN_VERSION}/binaries/apache-maven-${MAVEN_VERSION}-bin.tar.gz -P /tmp && \
    tar xf /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz -C /usr/share && \
    ln -s /usr/share/apache-maven-${MAVEN_VERSION} /usr/share/maven && \
    rm -f /tmp/apache-maven-${MAVEN_VERSION}-bin.tar.gz

# Verify installations
RUN java -version && mvn -version


# Install basic tools and lsb-release first
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    zip \
    unzip \
    build-essential \
    apt-transport-https \
    ca-certificates \
    gnupg \
    lsb-release \
    software-properties-common \
    && rm -rf /var/lib/apt/lists/*


# Install Docker
RUN mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
    && echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt-get update \
    && apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin \
    && rm -rf /var/lib/apt/lists/*

RUN usermod -aG docker jenkins

# RUN chown -R jenkins:jenkins /home/jenkins/
# RUN chmod -R 755 /home/jenkins/

# USER jenkins

# Expose working directory
WORKDIR /home/jenkins
EXPOSE 3001
ENTRYPOINT ["/usr/local/bin/start.sh"]
