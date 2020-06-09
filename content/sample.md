---
title: "Sample"
weight: 11
---

# A Sample App

Let's say you're having a difficult time keeping in touch with your friends
and/or professional network, and you want your own digital contacts management
solution.

Your data model may look something like this:

First Name | Last Name | Relation | Date | Notify | Note
---------- | ---------- | ---------- | ---------- | ---------- | ----------
Melanie | Barron | Friend | 1979-05-03 | ANNUALLY | Birthday
Cynthia | Ward | Coworker @ Company X | 2009-07-01 | ANNUALLY | Work Anniversary
Mary | Gil | Coworker @ Company Y | 1993-01-16 | ANNUALLY | Annual Happy Hour
Christopher | Hoffman | Fishing Buddy | 2003-08-26 | MONTHLY | Fishing Gala

You may want to reach out to friends or coworkers on an annual basis to
congratulate them on that special occasion. One way to do this is to filter your
contacts for when `Date` is the present day, and if `Notify` is set to
`ANNUALLY`.

Let's build the data management layer for this app in TinyDevCRM, using only a
few `curl` commands.
