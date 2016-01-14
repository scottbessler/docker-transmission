FROM alpine:edge

ENV LANG='en_US.UTF-8' \
    LANGUAGE='en_US.UTF-8' \
    TERM='xterm'

RUN echo http://dl-4.alpinelinux.org/alpine/edge/testing >> /etc/apk/repositories && \
  apk -U upgrade && \
  apk -U add \
    transmission-daemon \
    ca-certificates \
    && \
  apk del make gcc g++ && \
  rm -rf /tmp/src && \
  rm -rf /var/cache/apk/*

ADD start.sh /
RUN chmod +x /start.sh

EXPOSE 9091
#EXPOSE 12345

CMD ["/start.sh"]
