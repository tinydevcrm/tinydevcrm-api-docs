---
title: "Creating View"
weight: 20
---

## Creating a Materialized View

> To create a view:

```shell
curl \
    --header "Content-Type: application/json" \
    --header "Authorization: JWT $YOUR_JWT_ACCESS_TOKEN" \
    --request POST \
    --data "{\"view_name\": \"sample_view\", \"sql_query\": \"SELECT * FROM \"sample_table\" WHERE date_part('month', \"Date\") = date_part('month', CURRENT_DATE) AND date_part('day', \"Date\") = date_part('day', CURRENT_DATE) AND \"Notify\" = 'ANNUALLY'\"}" \
    https://api.tinydevcrm.com/views/create/
```

> This translates to the following SQL:

```sql
CREATE MATERIALIZED VIEW "sample_view" AS
    SELECT * FROM "sample_table" WHERE
    date_part('month', "Date") = date_part('month', CURRENT_DATE) AND
    date_part('day', "Date") = date_part('day', CURRENT_DATE) AND
    "Notify" = 'ANNUALLY'
WITH DATA;
```

> This should result in a successful `HTTP 201 Created` response:

```shell
{"id":$VIEW_ID,"view_name":"sample_view","user":$USER_ID}
```
