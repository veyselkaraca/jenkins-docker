# Overview
This project focuses on a specific task: enabling Jenkins to communicate with the Docker engine while running inside a Docker container. 

## Prerequisites

To run this project, you'll need the following requirements:

- Docker: [You can download Docker from here](https://www.docker.com/get-started).
- Docker Compose (Optional): It can be used to manage multiple Docker containers. [Learn more about Docker Compose by visiting here](https://docs.docker.com/compose/).

## Running Jenkins on Docker Guide

In this guide, you will find the steps to launch Jenkins on Docker and establish communication between Docker and Jenkins.



### Building the Jenkins Docker Image

1. Clone this repository locally or download it as a zip:

   ```bash
   git clone https://github.com/veyselkaraca/jenkins-docker.git

2. Navigate to the project directory:
   
   ```bash
   cd jenkins-docker

3. Build the Docker image for Jenkins using the provided Dockerfile:

   ```bash
   docker build -t <image_name> .

Replace <image_name> with the image name of your jenkins.

1. Or you can use docker compose for Jenkins image build 
    ```bash
    docker-compose build
    # or
    docker compose build

### Running Jenkins on Docker

1. Run the Jenkins Docker container using the following command:

    ```bash
    # docker engine
    docker run -p 8080:8080 -p 50000:50000 -v jenkins_home:/var/jenkins_home my-jenkins
    # or you can use docker compose
    docker-compose up -d
    # new verison of docker compose following this command
    docker compose up -d

This will start Jenkins in a Docker container and expose it on port 8080. You can access the Jenkins web interface by opening a web browser and going to http://localhost:8080.

2. To access the Jenkins container's shell, use the following command:

    ```bash
    docker exec -it <container_id> /bin/bash


Replace <container_id> with the actual ID of the Jenkins container.


1. To access the docker socket in Jenkins container, use the following command:

    ```bash
    docker info
    # or
    docker container ls
    ```

### Configuring Jenkins
1. Follow the initial setup wizard in the Jenkins web interface to set up Jenkins.
2. When prompted for plugins, you can install the suggested plugins or select your preferred ones.

### Update docker compose version
If you want to change the version of Docker Compose on Jenkins, open the Dockerfile file and update the curl request. For example:

   ```yaml
   RUN curl -L "https://github.com/docker/compose/releases/download/1.25.3/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
   ```
   To this
   ```yaml
   RUN curl -L "https://github.com/docker/compose/releases/download/1.25.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && chmod +x /usr/local/bin/docker-compose
   ```
   Now, you updated docker compose to version 1.25.4

### Additional Configuration (Optional)
- If you want to use Docker Compose for managing the Jenkins container and any additional services, you can update a docker-compose.yml file and define the services there. You can then start the services using docker-compose up.