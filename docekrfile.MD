## Docker file

A Dockerfile is a text-based script containing sequential instructions—such as base OS, dependencies, file copies, and commands—used to automatically build a Docker image. It acts as a blueprint for containerization, ensuring software runs identically across different environments by encapsulating all setup steps.

docker pull <image_name>

docker run -it --name demo <image_name>

update, install..etc

docker commit -m"msg" -a "atr" <container_id> <build_mage>

---
FROM: Initializes a new build stage and sets the Base Image

RUN: Will execute any commands in a new layer

CMD: Provides a default for an executing container. There can only be one CMD instruction in a Dockerfile

LABEL: Adds metadata to an image

EXPOSE: Informs Docker that the container listens on the specified network ports at runtime

ENV: Sets the environment variable <key> to the value <value>

ADD: Copies new files, directories or remote file URLs from <src> and adds them to the filesystem of the image at the path <dest>.

COPY: Copies new files or directories from <src> and adds them to the filesystem of the container at the path <dest>.

ENTRYPOINT: Allows for configuring a container that will run as an executable

VOLUME: Creates a mount point with the specified name and marks it as holding externally mounted volumes from native host or other containers

USER: Sets the user name (or UID) and optionally the user group (or GID) to use when running the image and for any RUN, CMD, and ENTRYPOINT instructions that follow it in the Dockerfile

WORKDIR: Sets the working directory for any RUN, CMD, ENTRYPOINT, COPY, and ADD instructions that follow it in the Dockerfile

ARG: Defines a variable that users can pass at build-time to the builder with the docker build command, using the --build-arg <varname>=<value> flag

ONBUILD: Adds a trigger instruction to the image that will be executed at a later time, when the image is used as the base for another build

HEALTHCHECK: Tells Docker how to test a container to check that it is still working

SHELL: Allows the default shell used for the shell form of commands to be overridden
---
```
FROM httpd

RUN echo " Firt DOckerfile" > /usr/local/apache2/htdocs/index.html 
```
---
```
FROM centos:8

LABEL ENV=DEV
LABEL Client=Hippo

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*

RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN yum update -y

RUN yum install httpd unzip -y

WORKDIR /var/www/html/

ENV DEMO templatemo_612_parallax_starter

ADD https://templatemo.com/download/$DEMO  .

RUN mv $DEMO $DEMO.zip && unzip $DEMO.zip && mv $DEMO/*  .

RUN rm -rf $DEMO $DEMO.zip

CMD apachectl -DFOREGROUND
```

