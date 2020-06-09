---
title: "Obtain Token"
weight: 14
---

## Obtain a JSON Web Token

> Obtain a JSON Web Token

```shell
curl \
    --header "Content-Type: application/json" \
    --request POST \
    --data '{"primary_email": "me+rolodex@yingw787.com", "password": "test1234"}' \
    https://api.tinydevcrm.com/auth/tokens/obtain/
```

> You should get an HTTP response like this:

```shell
{"refresh":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTU5MjUyNjY0MywianRpIjoiNTliOTJjMDdiNDNlNDZlMDk5YjY1ZjhjOWEyMWI1MGMiLCJ1c2VyX2lkIjoxfQ.IkXnAMgIXENQac8t87hAJpzS_nGYdtwDBr04UG8ErwE","access":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNTkxMzE3MzQzLCJqdGkiOiIyZGU5YjE1NWRjZGI0YzU5YWRmZTVkZmM2Y2FjNWMxYSIsInVzZXJfaWQiOjF9.a3ii2l7QgJhDD0527hA5nxDV9EtmbNWcYU8ijDh7wFk"}
```

Get a JSON Web Token in order to access other API endpoints from TinyDevCRM. A
JSON Web Token consists of two components: a "refresh" token, which is a
long-lived token meant to store session state on the client, and an "access"
token, a short-lived token sent over the wire to access resources.

Since each token is simply a hash, any kind of data can be stored within the
token. This enables TinyDevCRM to decrypt the token and figure out what
resources the token has permission to access.

Read more about JSON Web Tokens on [the industry standard
page](https://jwt.io/).
