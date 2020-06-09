---
title: "Blacklist Token"
weight: 15
---

## Blacklist a JSON Web Token

> Blacklist a JSON Web Token:

```shell
curl \
    --header "Content-Type: application/json" \
    --request POST \
    --data '{"refresh": "$YOUR_JWT_REFRESH_TOKEN"}' \
    https://api.tinydevcrm.com/auth/tokens/blacklist/
```

When your session is complete and you want to log the client out, blacklist the
refresh token to prevent further accesses to TinyDevCRM using this token or
access tokens generated from it.

Upon successful blacklisting, TinyDevCRM should return an `HTTP 205 Reset
Content` response.
