From centos:latest 


WORKDIR /opt
COPY installGeant4.sh .
RUN cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
# RUN cp /opt/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo
RUN yum makecache
RUN yum install -y epel-release wget cmake make expat-devel xerces-c xerces-c-devel mesa-libGLU-devel mesa-libGL-devel libXmu libXmu-devel man
# RUN yum install -y root.6.20  
RUN yum install -y gcc gcc-c++ python3 libXpm libXpm-devel libXft-devel openssl-devel libX11-devel libXext-devel patch
RUN yum install vim git
#RUN bash ./installGeant4.sh >>installGeant4.log
