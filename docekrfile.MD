## Docker file

A Dockerfile is a text-based script containing sequential instructions—such as base OS, dependencies, file copies, and commands—used to automatically build a Docker image. It acts as a blueprint for containerization, ensuring software runs identically across different environments by encapsulating all setup steps.

docker pull <image_name>

docker run -it --name demo <image_name>

update, install..etc

docker commit -m"msg" -a "atr" <container_id> <build_mage>
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
