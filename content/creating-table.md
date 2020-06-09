---
title: "Creating Table"
weight: 18
---

## Creating the Table

With your Parquet file, you can define and create the table using one API
request. TinyDevCRM creates the table using a set of column name and type
definitions passed into the request header. These type definitions are any
supported by PostgreSQL. See [this documentation
page](https://www.postgresql.org/docs/12/datatype.html) for a full list of
PostgreSQL data types.

> Create table as `sample_table`:

```shell
curl \
    --header "Content-Type: multipart/form-data" \
    --header "Authorization: $YOUR_JWT_ACCESS_TOKEN" \
    --request POST \
    --form "file=@/path/to/file.parquet" \
    --form "table_name=sample_table" \
    --form columns='[{"column_name": "FirstName", "column_type": "varchar(256)"}, {"column_name": "LastName", "column_type": "varchar(256)"}, {"column_name": "Relation", "column_type": "varchar(256)"}, {"column_name": "Date", "column_type": "date"}, {"column_name": "Notify", "column_type": "varchar(256)"}, {"column_name": "Note", "column_type": "varchar(256)"}]' \
    https://api.tinydevcrm.com/tables/create/
```

> Note that TinyDevCRM preserves case sensitivity of column names and column
> values. Also note that the column names must be ordered, and match the names
> of the CSV headers exactly.

> This HTTP request would be translated to the following SQL:

```sql
CREATE FOREIGN TABLE "temp" (
    "FirstName" VARCHAR(256),
    "LastName" VARCHAR(256),
    "Relation" VARCHAR(256),
    "Date" DATE,
    "Notify" VARCHAR(256),
    "Note": VARCHAR(256)
) SERVER parquet_server OPTIONS (filename '/path/to/file.parquet');
CREATE TABLE "sample_table" AS TABLE "temp" WITH DATA;
DROP FOREIGN TABLE "temp";
```
