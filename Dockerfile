FROM alpine:latest
MAINTAINER aaomidi

RUN apk add --update alpine-sdk net-tools iptables git
RUN mkdir -p /opt/

WORKDIR /opt/
RUN git clone https://github.com/frekky/iodine.git

WORKDIR /opt/iodine
ADD start.sh /opt/iodine/start.sh
RUN make

EXPOSE 53/udp

CMD ["./start.sh"]
