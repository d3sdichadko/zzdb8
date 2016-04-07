FROM debian:8.3
MAINTAINER user5 <desdichadko@gmail.com>
RUN export DEBIAN_FRONTEND=noninteractive

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y iperf iptraf
RUN touch /root/test
RUN echo Good >> /root/test

EXPOSE 22 3306
