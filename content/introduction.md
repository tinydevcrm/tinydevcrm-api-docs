---
weight: 10
title: API Reference
---

# Introduction

Welcome to the TinyDevCRM API! TinyDevCRM serves as your data layer for
lightweight, event-driven clients.

In my experience, developing clients (CLIs, GUIs, SDKs) is pretty easy, and it
takes a few hours to get them up and running. Even developing APIs is fairly
straightforward, on the order of days to weeks. But developing and maintaining
enterprise-grade data management solutions is very expensive, on the order of
months. It's expensive not just in pure hosting costs, but also in the
operational overhead of migrations, backups, failover / replication / high
availability, logging, and analytics. Those time sinks are what kill small
projects, and prevent small bits of useful work from being routinely shipped and
positively impacting people.

So I built TinyDevCRM to amortize the cost of managing, hosting, and
understanding your own data, so that you can focus on building and shipping
event-driven side projects that stick with you and improve your life. I hope you
find this project useful!

__________

Since this API is defined using HTTP, no SDK is necessary! Your favorite
language's HTTP library should be able to communicate with this API, no problem.
You can view code examples in the dark area to the right, and you can switch the
programming language of the examples with the tabs in the top right.

All project code is open-source, and can be viewed in [this GitHub organization
page](https://github.com/tinydevcrm).

This API documentation page was created with
[DocuAPI](https://github.com/bep/docuapi/), a multilingual documentation theme
for the static site generator [Hugo](http://gohugo.io/).
