---
title: "Identity and Access Management"
weight: 12
---

# Identity and Access Management

TinyDevCRM packages a tiny identity and access management (IAM) solution for
fine-grained permissioning to your data resources. This means each request only
has access to the resources you specifically asked for. This helps keep your
data secure.

TinyDevCRM's IAM solution is based on JSON Web Tokens (JWT) and token-based
authentication. Each resource request to the service expects a valid JWT access
token present in the HTTP header.

TinyDevCRM does not support usernames. Instead, TinyDevCRM uses your email
address as your identifier. To create multiple apps with the same email, use
[plus addressing](https://www.fastmail.com/help/receive/addressing.html).

For example, if my email address is `me@yingw787.com`, my plus-addressed email
for app `rolodex` may be `me+rolodex@yingw787.com`.
