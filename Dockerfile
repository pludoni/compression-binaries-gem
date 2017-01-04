FROM ioft/i386-ubuntu:trusty

RUN apt-get update -y && \
    apt-get install -y build-essential

