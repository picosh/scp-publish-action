FROM alpine:3.10

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories \
    && apk upgrade --update \
    && apk add --update openssh \
    && rm -rf /tmp/* /usr/share/man /var/cache/apk/*

COPY . /

ENTRYPOINT ["/entrypoint.sh"]
