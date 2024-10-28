FROM jenkins/inbound-agent:latest

USER root

# Install Node.js
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs


USER jenkins

# Expose working directory
WORKDIR /home/jenkins
