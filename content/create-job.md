---
title: "Creating a Cron Job"
weight: 22
---

## Creating a Cron Job

Pass in a crontab definition. Common crontab expressions are supported (i.e. no
intervals or special keywords). Validate your crontab expressions using [this
online cron expression editor](https://crontab.guru/).

> To create a cron job:

```shell
# Create a cron job to refresh materialized view "sample_view" every minute.
curl \
    --header "Content-Type: application/json" \
    --header "Authorization: JWT $YOUR_JWT_ACCESS_TOKEN" \
    --request POST \
    --data '{"view_name": "sample_view", "crontab_def": "* * * * *"}' \
    https://api.tinydevcrm.com/jobs/create/
```

> This creates two cron jobs underneath the hood: one to refresh the
> materialized view, and one to send a notification.
>
> This should return an `HTTP 201 Created` response with the following data:

```shell
{"id":$JOB_ID,"job_ids":[$CRON_JOB_ID_1,$CRON_JOB_ID_2],"user":$USER_ID,"view":$VIEW_ID}
```
