FROM centos:8 
LABEL maintainer Phil Moses <philmoses@gmail.com>

RUN yum update -y 

RUN yum install -y 'dnf-command(config-manager)' \ 
    && yum config-manager --set-enabled PowerTools

RUN dnf install -y epel-release \ 
    && dnf install -y texinfo \ 
    && dnf install -y octave \
    && dnf clean all \
    && rm -rf /var/cache/yum 

RUN useradd octaveuser
ENTRYPOINT su - octaveuser
