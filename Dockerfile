FROM alpine:latest

# Note: Tor is only in community repo
RUN apk update && apk add \
    tor \
    --update-cache --repository http://dl-3.alpinelinux.org/alpine/edge/community/ \
    && rm -rf /var/cache/apk/*

# default port to used for incoming Tor connections
# can be changed by changing 'ORPort' in torrc
EXPOSE 9029
EXPOSE 9030

# copy in our torrc files
#COPY torrc /etc/tor/torrc
#COPY keys /var/lib/tor/keys

RUN chown -R tor /etc/tor
RUN chown -R root /var/lib/tor

#USER tor

ENTRYPOINT []
CMD ["tor"]
