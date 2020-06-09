---
title: "Sample"
weight: 11
---

# A Sample App

Let's say you're having a difficult time keeping in touch with your friends
and/or professional network, and you want your own digital contacts management
solution to remind yourself to reach out to your network for a special occasion.

Your data model may look something like this:

First Name | Last Name | Relation | Date | Note
---------- | ---------- | ---------- | ---------- | ----------
Melanie | Barron | Friend | 1979-05-03 | Birthday
Cynthia | Ward | Coworker @ Company X | 2009-07-01 | Work Anniversary
Mary | Gil | Coworker @ Company Y | 1993-01-16 | Annual Happy Hour
Christopher | Hoffman | Fishing Buddy | 2003-08-26 | Fishing Gala

You may want to filter your contacts for when `Date` is the present day, and
send a reminder to yourself to send a special message.

Let's build the data management layer for this app in TinyDevCRM, using only a
few `curl` commands.
