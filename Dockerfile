FROM centos:8 


RUN yum update -y 

RUN yum install -y 'dnf-command(config-manager)' \ 
    && yum config-manager --set-enabled PowerTools

RUN dnf install -y epel-release \ 
    && dnf install -y texinfo \ 
    && dnf install -y octave \
    && dnf install -y passwd \
    && dnf clean all \
    && rm -rf /var/cache/yum 
RUN echo "octaveroot" | passwd --stdin root
RUN useradd octaveuser
ENTRYPOINT su - octaveuser
