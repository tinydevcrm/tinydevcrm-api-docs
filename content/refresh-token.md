---
title: "Refresh Token"
weight: 14
---

## Refresh a JSON Web Token

> Refresh a JSON Web Token:

```shell
curl \
    --header "Content-Type: application/json" \
    --request POST \
    --data '{"refresh": "$YOUR_JWT_REFRESH_TOKEN"}' \
    https://api.tinydevcrm.com/auth/tokens/refresh/
```

> Response:

```shell
{"access":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNTkxNzIyNDA5LCJqdGkiOiJhZjcxZTRjYmQxMjU0N2M2YjA2NGYzNWJkYjUwZGIyMyIsInVzZXJfaWQiOjF9.hPsU9jj8zimIkB3LBiMuzcGDNgHQFJ5DS6oK61Oc6E0","refresh":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5MjkzMTcwOSwianRpIjoiNzJlNGZkOGE0NWIxNDRmYWEzOGQ0NTU0OTY0NjQwMzciLCJ1c2VyX2lkIjoxfQ.7lWBJTX9cAmEZMJx0XsLMkf4VDcpHIGeSoLy7UuHyck"}
```

Access tokens expire after 5 minutes. Requests made to TinyDevCRM with an
expired access token will result in an `HTTP 401 Unauthorized` error. Request a
new access token using your refresh token in order to make further requests and
continue your session.

By default, TinyDevCRM does not rotate refresh tokens upon refresh.
