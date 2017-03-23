#see https://hub.docker.com/r/phusion/baseimage/ 
FROM phusion/baseimage

MAINTAINER Ian Bell <ian.h.bell@gmail.com>

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# Use baseimage-docker's init system.
CMD ["/sbin/my_init"]

RUN apt-get update --fix-missing && apt-get install -y wget bzip2 ca-certificates \
    libglib2.0-0 libxext6 libsm6 libxrender1 \
    git g++

RUN echo 'export PATH=/opt/conda/bin:$PATH' > /etc/profile.d/conda.sh && \
    wget --quiet https://repo.continuum.io/miniconda/Miniconda2-4.3.11-Linux-x86_64.sh -O ~/miniconda.sh && \
    /bin/bash ~/miniconda.sh -b -p /opt/conda && \
    rm ~/miniconda.sh

ENV PATH /opt/conda/bin:$PATH

RUN pip install buildbot buildbot-www buildbot-waterfall-view buildbot-console-view service_identity

RUN mkdir ~/master && \
    buildbot create-master ~/master && \
    mv ~/master/master.cfg.sample ~/master/master.cfg

RUN mkdir /etc/service/bb-master
COPY start_buildbot.sh /etc/service/bb-master/run
RUN chmod +x /etc/service/bb-master/run

EXPOSE 8010
EXPOSE 9989