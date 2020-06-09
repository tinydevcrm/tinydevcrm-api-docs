---
title: "Create Channel"
weight: 24
---

## Create a streaming channel

> To create a streaming channel:

```shell
curl \
    --header "Content-Type: application/json" \
    --header "Authorization: JWT $YOUR_JWT_ACCESS_TOKEN" \
    --request POST \
    --data '{"job_id": $YOUR_JOB_ID}' \
    https://api.tinydevcrm.com/channels/create/
```

> This should result in an `HTTP 201 Created` response, and the following
> response data:

```shell
{"id":$CHANNEL_ID,"public_identifier":$CHANNEL_UUID,"job":$JOB_ID,"user":$USER_ID}
```

> Using a tool like [**`jq`**](https://github.com/stedolan/jq), you can retrieve
> the channel public identifier from the response data:

```shell
$ echo $RESPONSE | jq -r ".public_identifier"

61951b33-dbc6-4fab-b1c9-339c730a4eb0
```
