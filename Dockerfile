FROM ubuntu:20.04

RUN apt-get -y update && apt-get -y upgrade 

ENV DEBIAN_FRONTEND="noninteractive" TZ="Europe/Rome"
RUN apt-get -y install tzdata

RUN apt-get -y install git wget flex bison gperf python3 python3-pip python3-setuptools cmake ninja-build ccache libffi-dev libssl-dev dfu-util

WORKDIR /esp

RUN git clone --recursive https://github.com/espressif/esp-idf.git
RUN update-alternatives --install /usr/bin/python python /usr/bin/python3 10
RUN esp-idf/install.sh
ENV IDF_PATH=/esp/esp-idf
RUN . ./esp-idf/export.sh