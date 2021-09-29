---
title: "Understand the basics of Docker for better usage and useful commands"
date: 2021-09-28T00:16:28+01:00
categories: [tutorial, docker, newbie]
authors: [nab]
---

This article aims to help you understand the basics of docker. First, I explain the concepts behind docker, then I explain how to install it and finally I give you some useful commands to use docker.

# Containers VS Virtual Machines

Virtual machines allow multiple operating systems to run on the hardware of a single machine, while containers allow multiple applications running the same operating system to be deployed on a single virtual machine or server.

# What is Docker

Docker is an open source platform used to create, run and deploy applications in containers. There is also an Enterprise Version. Docker allows you to separate applications from your infrastructure so you can deliver software quickly. With Docker, you can manage your infrastructure in the same way as your applications.

## Image

A Docker image is a file used to run code in a Docker container. Docker images act as a set of instructions for building a Docker container, like a template.

Docker images are also the starting point for using Docker. An image is a template that contains a set of instructions for creating a container that can run on the Docker platform.

A Docker image contains application code, libraries, tools, dependencies and other files needed to run an application. When a user runs an image, it can become one or more instances of a container.

## Container

Docker images and Docker containers are the two essential elements that we encounter every day when working with Docker.

In simple terms, as explained above, a Docker image is a template that contains the application and all the dependencies required to run that application on Docker.

On the other hand, a Docker container is a logical entity. In more precise terms, it is a running instance of the Docker image.

A container is a standard software entity that bundles code and all its dependencies so that the application runs quickly and reliably from one environment to another. A Docker container image is a lightweight, self-contained, executable package of software that includes everything needed to run an application: code, runtime, system tools, system libraries, and settings.

## Dockerfile

The Dockerfile is a text document that contains all the commands a user could call on the command line to assemble a docker image.
The Dockerfile is essentially the instructions for building the image. The advantage of a Dockerfile over simply storing the binary image (or a snapshot/template in other virtualisation systems) is that the automatic builds ensure that you have the latest version available.

```bash
# Example dockerfile to install Odoo
# Note that this Odoo image is based on the debian:buster-slim image
FROM odoo/odoo:14.0
LABEL maintainer="Your Name. <your@email.com>"

COPY ./requirements_custom.txt /requirements_custom.txt

RUN pip3 install --upgrade pip && pip3 install -r requirements_custom.txt

WORKDIR /odoo/odoo

USER odoo
```

## Docker Compose

Docker Compose is a tool for defining and running multi-container Docker applications. With Docker Compose, you use a YAML file to configure the services of your application before running it on docker.
This allows you to define the desired number of containers, their builds and storage designs, and then, with a single set of commands, you can build, run and configure all the containers. Docker Compose is ideal for development, test and deployment environments, as well as for continuous integration workflows.

An example for Odoo is that you need one container for the Odoo server, another for the DB server and finally another as pgAdmin to interact with the DB

```bash
# content of the docker-compose.yml file
version: "3"
services:
  odoo14:
    container_name: odoo-container-name
    image: odoo/odoo:14.0
    depends_on:
      - db
    ports:
      - "8069:8069"
    tty: true
    stdin_open: true
    volumes:
      - odoo-odoo14-data:/var/lib/odoo
      - ./config/odoo.conf:/etc/odoo.conf
      - ./custom-addons:/custom-addons
    restart: always # run as a service
  db:
    container_name: db-container-name
    image: postgres:12
    environment:
      - POSTGRES_DB=postgres
      - POSTGRES_PASSWORD=odoo
      - POSTGRES_USER=odoo
      - PGDATA=/var/lib/postgresql/data/pgdata
    ports:
      - "5542:5432"
    restart: always # run as a service
    volumes:
      - odoo-db-data:/var/lib/postgresql/data/pgdata
  pgadmin:
    container_name: pgadmin-container-name
    image: dpage/pgadmin4:5.4
    depends_on:
      - db
    environment:
      PGADMIN_DEFAULT_EMAIL: admin@dbproject.com
      PGADMIN_DEFAULT_PASSWORD: xYz0
      PGADMIN_LISTEN_PORT: 80
    ports:
      - "8099:80"
    restart: always
    volumes:
      - pgadmin-data:/var/lib/pgadmin
    links:
      - "db:psql-project-name-server"
volumes:
  odoo-odoo14-data:
  odoo-db-data:
  pgadmin-data:
```

## Volumes

In the previous **docker-compose.yml** file, you can see the volumes section. This is because Docker volumes are file systems mounted on Docker containers to preserve the data generated by the running container. Volumes are stored on the host, independent of the container's lifecycle. This allows users to backup data and easily share file systems between containers.

## Networking

Docker networking allows you to attach a container to as many networks as you like. For example, you can attach the Odoo server to the database server. When using the **docker-compose.yml** file, networking is done when you use the **depends_on** keyword in the file.

If you want to do it manually for example by attaching your running web application to a network named **my_bridge**, you can type

```bash
 docker network connect my_bridge web
```

## Deployment

To deploy a docker environment it's simple: install docker and docker-compose on your server, clone the source code of your application and type the command

```bash
docker-compose up
# then you can access the container if you want and do what ever you want
```

# Install Docker and Docker Compose

```bash
# Installation on Ubuntu 18.04
sudo su
apt update
apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL [https://download.docker.com/linux/ubuntu/gpg](https://download.docker.com/linux/ubuntu/gpg) | sudo apt-key add -
add-apt-repository "deb [arch=amd64] [https://download.docker.com/linux/ubuntu](https://download.docker.com/linux/ubuntu) bionic stable"
apt update
apt-cache policy docker-ce
apt install docker-ce
systemctl status docker
apt install python3-pip
pip3 install docker-compose
```

# Basic commands

```bash
# know the version number
docker –v

# download an image
docker pull <image>

# Creating a container from an image
docker run -it -d <image>

# List the containers that are running
docker ps

# List all containers
docker ps -a

# Accessing a container
docker exec -it <container> bash

# Stop a container
docker stop <container>

# Forcing a container to stop
docker kill <container>

# create a new image of a local container
docker commit <container> <your_name/image>

# Connect to docker hub
docker login

# Starting a container with docker-compose
docker-compose up

# Stopping a container with docker-compose
docker-compose stop

# Restarting a container with docker-compose
docker-compose restart

# Creating a container with docker-compose
docker-compose up --build

# Run a command in the container
docker exec -it <container> <commande>

# Exporting a container to the local machine
docker export <container> -o <path>

# Accessing a container as root
docker exec -it -u 0 <container> bash
# or
docker exec -it -u root <container> bash
```

# Inspect / Debug containers

```bash
# See the IP addresses of the containers
docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' container_name_or_id
# or
docker inspect -f '{{.Name}} - {{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' $(docker ps -aq)

# Copy a folder or file from its container to its physical machine
docker cp <container>:<path> .

# Copy a folder or file from your physical machine to your container
docker cp <path/folder/or/file> <container>:<path>
```

Alternatively, you can use Docker Desktop → [https://www.docker.com/products/docker-desktop](https://www.docker.com/products/docker-desktop)

# Sources

I did not invent anything, a big THANK YOU to those who wrote these articles:

- [https://www.netapp.com/blog/containers-vs-vms/](https://www.netapp.com/blog/containers-vs-vms/)
- [https://www.burwood.com/blog-archive/containerization-vs-virtualization](https://www.burwood.com/blog-archive/containerization-vs-virtualization)
- [https://www.edureka.co/blog/docker-commands/](https://www.edureka.co/blog/docker-commands/)
- [https://searchitoperations.techtarget.com/definition/Docker-image](https://searchitoperations.techtarget.com/definition/Docker-image)
- [https://www.docker.com/resources/what-container](https://www.docker.com/resources/what-container)
- [https://www.freecodecamp.org/news/docker-simplified-96639a35ff36/](https://www.freecodecamp.org/news/docker-simplified-96639a35ff36/)
- [https://docs.docker.com/engine/reference/builder/](https://docs.docker.com/engine/reference/builder/)
- [https://phoenixnap.com/kb/docker-volumes](https://phoenixnap.com/kb/docker-volumes)
- [https://docs.docker.com/engine/tutorials/networkingcontainers/](https://docs.docker.com/engine/tutorials/networkingcontainers/)


