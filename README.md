# docker-gorilla-websocket-chat

A simple webapp demonstrating use of websockets. Uses the upstream `gorilla` package's `examples/chat`.

## Usage

### Environment Variables

- `WSS_ENABLED` - when set to `true`, the client will use `wss://` instead of plain

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
  --set ingress.annotations."cert-manager\.io/cluster-issuer"=letsencrypt-prod \
  --set ingress.annotations."traefik\.ingress\.kubernetes\.io/redirect-entry-point"=https \
  --set "ingress.hosts[0]".host="chat\.fordham\.id\.au" \
  --set "ingress.hosts[0].paths[0]=/" \
  --set "ingress.tls[0]".secretName=chat-cert \
  --set "ingress.tls[0]".hosts={"chat\.fordham\.id\.au"} \
  --set options.wss="true" \
    chart/gorilla-websocket-chat
```

Upgrade the chart:

`helm upgrade gorilla-websocket-chat chart/gorilla-websocket-chat`

Testing after deployment:

`helm test gorilla-websocket-chat`

Completely remove the chart:

`helm uninstall gorilla-websocket-chat`
