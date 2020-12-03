From centos:latest 


WORKDIR /opt

COPY CentOS-Base.repo  .
RUN cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
# RUN cp /opt/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo
RUN yum makecache >> install.log
RUN yum install -y epel-release 
RUN yum install -y root  
CMD ping 166.111.8.28
