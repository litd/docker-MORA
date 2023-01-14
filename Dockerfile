# % Last Change: Sat Jan 14 03:55:47 PM 2023 CST
# Base Image
FROM ubuntu:22.04

# File Author / Maintainer
MAINTAINER Tiandao Li <litd99@gmail.com>

#ENV PATH /opt/conda/bin:$PATH

# set timezone, debian and ubuntu
RUN ln -sf /usr/share/zoneinfo/America/Chicago /etc/localtime && \
	echo "US/Central" > /etc/timezone

# Installation
RUN apt-get update --fix-missing && \
    apt-get install -y \
    software-properties-common \
    libparallel-forkmanager-perl \
    r-base-core \
    wget && \
    apt-get clean all && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/log/dpkg.log /var/tmp/*

# Install MORA
RUN cd /opt/ && \
        wget http://regmedsrv1.wustl.edu/Public_SPACE/litd/Public_html/pkg/MORA_Pipeline_v0.1.tar.gz  && \
        tar -xzvf MORA_Pipeline_v0.1.tar.gz && \
        rm -f MORA_Pipeline_v0.1.tar.gz

ENTRYPOINT [ "perl", "/opt/MORA_Pipeline_v0.1/MORA_v0.1.pl" ]

