---
title: "Cron Jobs"
weight: 21
---

# Cron Jobs

A cron job is a time-based job scheduler. `cron` enables servers to run
functions, procedures, and other assorted tasks at specific and fixed times.

TinyDevCRM leverages [**`pg_cron`**](https://github.com/tinydevcrm/pg_cron) to
migrate cron jobs from your `/etc/crontab` file into a PostgreSQL table and the
PostgreSQL directory `/var/lib/postgresql/data`. This is important to scale cron
jobs across multiple servers, and to efficiently separate the compute and data
layers of the database. It's also important to keep costs down and fault models
tight. `cron` jobs will only run if the database is active, and many cron jobs
can be run on a single server, as opposed to using a serverless development
model. Since `cron` is native to all Unix-like systems, no additional
dependencies need to be installed and audited, which helps TinyDevCRM pass any
compliance/certification needs faster and keeps build sizes small, which means
you can run TinyDevCRM from many more machines.

Cron jobs work well in refreshing materialized views, which is important in
getting an up-to-date understanding of your data. Since refreshing materialized
views is natively supported by PostgreSQL, you don't need to worry about data
consistency issues.
