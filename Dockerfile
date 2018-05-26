FROM alpine:latest
MAINTAINER aaomidi

RUN apk add --update alpine-sdk net-tools iptables git autoconf automake check
RUN mkdir /opt/

WORKDIR /opt/
RUN git clone https://github.com/frekky/iodine.git
RUN ls

WORKDIR /opt/iodine
ADD start.sh /opt/iodine/start.sh
RUN make

EXPOSE 53/udp

CMD ["./start.sh"]
