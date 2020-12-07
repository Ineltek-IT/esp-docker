FROM ubuntu:20.04

RUN apt-get -y update && apt-get -y upgrade && \
    apt-get -y install git 

WORKDIR /esp

RUN git clone --recursive https://github.com/espressif/esp-idf.git