FROM golang as builder
RUN go get github.com/gorilla/websocket && \
    cd src/github.com/gorilla/websocket/examples/chat && \
      CGO_ENABLED=0 GOOS=linux go build -o /gorilla-websocket-chat

FROM alpine
COPY --from=builder /gorilla-websocket-chat /gorilla-websocket-chat
COPY docker-entrypoint.sh /docker-entrypoint.sh
ADD https://raw.githubusercontent.com/gorilla/websocket/master/examples/chat/home.html /home.html
ENTRYPOINT ["/docker-entrypoint.sh"]
CMD ["/gorilla-websocket-chat"]
