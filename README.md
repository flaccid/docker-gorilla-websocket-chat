# gorilla-websocket-demo

A simple webapp demonstrating use of websockets. Uses the upstream `gorilla` package's `examples/chat`.

## Usage

## Docker

`docker run -it -p 8080:8080 flaccid/gorilla-websocket-chat`

### Helm Chart

Validate the chart:

`helm lint chart/gorilla-websocket-chat`

Dry run and print out rendered YAML:

`helm install --dry-run --debug gorilla-websocket-chat chart/gorilla-websocket-chat`

Install the chart:

`helm install gorilla-websocket-chat chart/gorilla-websocket-chat`

Or, with some different values:

```
helm install gorilla-websocket-chat \
  --set image.tag="arm64" \
  --set ingress.enabled=true \
    chart/gorilla-websocket-chat
```

Upgrade the chart:

`helm upgrade gorilla-websocket-chat chart/gorilla-websocket-chat`

Testing after deployment:

`helm test gorilla-websocket-chat`

Completely remove the chart:

`helm uninstall gorilla-websocket-chat`
