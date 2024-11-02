FROM jenkins/inbound-agent:latest

USER root
# RUN ulimit -n 1024

COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

RUN apt-get update && \
    apt-get install -y openjdk-17-jdk wget && \
    rm -rf /var/lib/apt/lists/*

# Set JAVA_HOME environment variable
ENV JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64
ENV PATH=$JAVA_HOME/bin:$PATH

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get update \
    && apt-get install -y nodejs\
    && apt-get install -y nginx \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY nginx.conf /etc/nginx/conf.d/default.conf

# Install basic tools and lsb-release first
# RUN apt-get update && apt-get install -y \
#     git \
#     curl \
#     wget \
#     zip \
#     unzip \
#     build-essential \
#     apt-transport-https \
#     ca-certificates \
#     gnupg \
#     lsb-release \
#     software-properties-common \
#     && rm -rf /var/lib/apt/lists/*


# Install Docker
# RUN mkdir -p /etc/apt/keyrings \
#     && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
#     && echo \
#     "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
#     $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
#     && apt-get update \
#     && apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin \
#     && rm -rf /var/lib/apt/lists/*

# RUN usermod -aG docker jenkins

# Expose working directory
WORKDIR /home/jenkins

EXPOSE 3000
ENTRYPOINT ["/usr/local/bin/start.sh"]
