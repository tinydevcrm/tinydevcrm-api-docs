---
weight: 13
title: Register a New User
---

## Register a New User

> Register a new user:

```shell
curl \
  --header "Content-Type: application/json" \
  --request POST \
  --data '{"primary_email": "me+rolodex@yingw787.com", "password": "test1234"}' \
  https://api.tinydevcrm.com/auth/users/register/
```

To register a new user, you must pass `'primary_email'` and `'password'` in the
HTTP payload.
