FROM golang as builder
RUN go get github.com/gorilla/websocket && \
    cd src/github.com/gorilla/websocket/examples/chat && \
      CGO_ENABLED=0 GOOS=linux go build -o /gorilla-websocket-chat

FROM gcr.io/distroless/static-debian10
COPY --from=builder /gorilla-websocket-chat /gorilla-websocket-chat
ADD https://raw.githubusercontent.com/gorilla/websocket/master/examples/chat/home.html /home.html
ENTRYPOINT ["/gorilla-websocket-chat"]
