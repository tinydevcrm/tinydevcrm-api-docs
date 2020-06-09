---
title: "Listen Channel"
weight: 25
---

## Listen to a streaming channel

> To listen to an existing streaming channel:

```shell
curl \
    --header "Content-Type: application/json" \
    --header "Authorization: JWT $YOUR_JWT_ACCESS_TOKEN" \
    --request GET \
    https://api.tinydevcrm.com/channels/$YOUR_CHANNEL_PUBLIC_IDENTIFIER/listen/
```

> Using the public identifier taken from the previous response as
> `61951b33-dbc6-4fab-b1c9-339c730a4eb0`, the final API request would be:

```shell
curl \
    --header "Content-Type: application/json" \
    --header "Authorization: JWT $YOUR_JWT_ACCESS_TOKEN" \
    --request GET \
    https://api.tinydevcrm.com/channels/61951b33-dbc6-4fab-b1c9-339c730a4eb0/listen/
```

> The HTTP response should be a never-ending event stream:

```shell
event: message
id: 61951b33-dbc6-4fab-b1c9-339c730a4eb0:1
data: {"update_available": "true", "view_name": "sample_view"}

event: keep-alive
data:

event: keep-alive
data:

event: keep-alive
data:

event: message
id: 61951b33-dbc6-4fab-b1c9-339c730a4eb0:2
data: {"update_available": "true", "view_name": "sample_view"}
...
event: message
id: 61951b33-dbc6-4fab-b1c9-339c730a4eb0:6
data: {"update_available": "true", "view_name": "sample_view"}

event: keep-alive
data:

event: keep-alive
data:

event: keep-alive
data:

event: message
id: 61951b33-dbc6-4fab-b1c9-339c730a4eb0:7
data: {"update_available": "true", "view_name": "sample_view"}
```
