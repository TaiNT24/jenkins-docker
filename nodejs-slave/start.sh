#!/bin/sh

# service docker start
# timeout 30s bash -c 'until sudo docker info >/dev/null 2>&1; do echo "Waiting for Docker to start..."; sleep 1; done'
# exec jenkins-agent "$@"
apt-get update && apt-get install -y \
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

mkdir -p /etc/apt/keyrings \
    && curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /etc/apt/keyrings/docker.gpg \
    && echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
    $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null \
    && apt-get update \
    && apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin \
    && rm -rf /var/lib/apt/lists/*

# echo "#!/bin/sh\nexit 0" > /usr/sbin/policy-rc.d
# chmod +x /usr/sbin/policy-rc.d
# rm -f /usr/sbin/policy-rc.d

service docker start

java -jar /usr/share/jenkins/agent.jar -url "$JENKINS_URL" -secret "$SECRET" -name "$SLAVE_NAME" -webSocket
