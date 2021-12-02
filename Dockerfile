FROM alpine:edge
RUN apk add docker-cli
COPY plugin.sh /bin/plugin.sh
RUN chmod +x /bin/plugin.sh
ENTRYPOINT /bin/plugin.sh
