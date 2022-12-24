FROM alpine:3.9

MAINTAINER www.bura.dev
LABEL This project is based on marcnuri/port-forward

RUN apk add --update --no-cache socat \
	&& rm -rf /var/cache/apk/

RUN addgroup -g bura -S appgroup && \
    adduser -u bura -S appuser -G appgroup

ARG DEF_REMOTE_PORT=1080
ARG DEF_LOCAL_PORT=1080

ENV REMOTE_PORT=$DEF_REMOTE_PORT
ENV LOCAL_PORT=$DEF_LOCAL_PORT

## By default container listens on $LOCAL_PORT (1080)
EXPOSE 1080

USER bura

CMD socat tcp-listen:$LOCAL_PORT,reuseaddr,fork tcp:$REMOTE_HOST:$REMOTE_PORT & pid=$! && trap "kill $pid" SIGINT && \
	echo "Socat started listening on $LOCAL_PORT: Redirecting traffic to $REMOTE_HOST:$REMOTE_PORT ($pid)" && wait $pid
