---
title: "Materialized Views"
weight: 19
---

# Materialized Views

Materialized views are query results cached as views by PostgreSQL for future
reference. Since materialized views cache the original query for refreshing at a
later point in time, and cannot be directly updated, they are a lightweight and
safe alternative for data manipulation, as opposed to creating direct views or
additional tables. They can also be referenced by external applications just as
tables can be.

TinyDevCRM supports arbitrary view creation, by passing the direct SQL command
to create a materialized view within the HTTP request body. In order to prevent
unsafe usage of the API, TinyDevCRM restricts SQL commands to only one
statement, and enforces keyword prefix of `SELECT`, `TABLES`, or `VALUES`, as
per [the PostgreSQL documentation on materialized
views](https://www.postgresql.org/docs/12/rules-materializedviews.html).
