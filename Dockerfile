FROM jenkins/jenkins
USER root
# Docker installation
RUN apt-get update \
 apt-get install ca-certificates curl gnupg software-properties-common \
curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - \
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" \
apt-get update \
apt-get install -yq docker-ce docker-ce-cli containerd.io
# Docker compose installation
RUN curl -L \  
  "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" \  
  -o /usr/local/bin/docker-compose \  
  && chmod +x /usr/local/bin/docker-compose  
USER jenkins
