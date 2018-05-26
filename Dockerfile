FROM ubuntu:15.04
MAINTAINER asmaps

RUN apt-get update && apt-get install -y net-tools build-essential iptables git
RUN mkdir -p /opt/

WORKDIR /opt/
RUN git clone https://github.com/frekky/iodine.git
WORKDIR /opt/iodine
ADD start.sh /opt/iodine/start.sh
RUN make

EXPOSE 53/udp


CMD ["./start.sh"]
