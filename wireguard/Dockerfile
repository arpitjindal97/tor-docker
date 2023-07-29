#FROM lscr.io/linuxserver/wireguard:latest
FROM alpine:latest

# Note: Tor is only in community repo
RUN apk update && apk add \
    tor \
    --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community/ \
    && rm -rf /var/cache/apk/*

#EXPOSE 9001
EXPOSE 9051

# It is good idea to run Exit Node on VPN
RUN apk add strongswan openssl curl wireguard-tools

COPY run.sh /work/run.sh
RUN chmod +x /work/run.sh

ENTRYPOINT []
CMD ["sh","/work/run.sh"]
