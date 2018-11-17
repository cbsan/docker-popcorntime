FROM debian:stretch-slim

ENV MAINTAINER='Cristian B. Santos <cbsan.dev@gmail.com>'
ENV URL_POPCORNTIME='https://ci.popcorntime.sh/view/All/job/Popcorn-Time-Desktop/lastSuccessfulBuild/artifact/build/popcorn-time_0.3.10-be800aa98_amd64.deb'

RUN apt update && apt install -y \
        wget \
        bzip2 \
        libgtk2.0-0 \
        libgconf-2-4 \
        libasound2 \
        libxtst6 \
        libxss1 \
        libnss3 \
        xvfb 

 RUN wget ${URL_POPCORNTIME} -O /tmp/popcorn.deb \
   && apt install /tmp/popcorn.deb \
   && ln -sf /opt/Popcorn-Time/Popcorn-Time /usr/bin/popcorn \
   && rm -rf /tmp/* 

RUN Xvfb -screen 1280x2000x32 :0 & export DISPLAY=:0
