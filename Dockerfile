# Ubuntu 16.04 with miniconda

FROM ubuntu:16.04

MAINTAINER Kota Mori <kmori05@gmail.com>

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8 

RUN apt-get update
RUN apt-get install -y \
  sudo vim man less git wget bzip2 build-essential \
  ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1
  

# install miniconda
ENV CONDA_PATH /opt/miniconda3
RUN wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh 
RUN bash Miniconda3-latest-Linux-x86_64.sh -b -p $CONDA_PATH
RUN rm Miniconda3-latest-Linux-x86_64.sh 
ENV PATH $CONDA_PATH/bin:$PATH


# run test script
ADD test.sh /tmp
RUN /bin/bash /tmp/test.sh


# greeting
RUN echo "DONE! :D"


