FROM centos:7.9.2009

RUN sed -i s/mirror.centos.org/vault.centos.org/g /etc/yum.repos.d/*.repo
RUN sed -i s/^#.*baseurl=http/baseurl=http/g /etc/yum.repos.d/*.repo
RUN sed -i s/^mirrorlist=http/#mirrorlist=http/g /etc/yum.repos.d/*.repo

RUN sed -i 's/mirrorlist/#mirrorlist/g' /etc/yum.repos.d/CentOS-*
RUN sed -i 's|#baseurl=http://mirror.centos.org|baseurl=http://vault.centos.org|g' /etc/yum.repos.d/CentOS-*

RUN  yum update httpd unzip -y

COPY templatemo_616_split_index.zip /var/www/html/.

RUN unzip templatemo_616_split_index.zip

RUN mv templatemo_616_split_index/*  .

CMD apachectl -DFOREGROUND
