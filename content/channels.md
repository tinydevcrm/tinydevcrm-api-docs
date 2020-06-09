---
title: "Channels"
weight: 23
---

# Streaming Channels

TinyDevCRM uses HTTP/2 and [Server-Sent
Events](https://developer.mozilla.org/en-US/docs/Web/API/Server-sent_events) in
order to stream materialized view refresh events to your clients. Compared to
WebSockets, Server-Sent Sockets need no SDKs to install/audit/maintain/upgrade,
pass through packet inspection and firewalls more easily, and remain
unidirectional to enforce data consistency.

TinyDevCRM currently supports one channel listening to one specific cron job,
refreshing one specific materialized view. Listening to refresh events from
different materialized views will be supported in a future TinyDevCRM release.
