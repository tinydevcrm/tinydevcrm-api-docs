---
title: "Tables"
weight: 16
---

# Native Tables

TinyDevCRM leverages PostgreSQL's ability to [create
tables](https://www.postgresql.org/docs/12/sql-createtable.html) to store raw
data. These tables act as a source of truth for the rest of your workflow.

Native tables are differentiated from [foreign
tables](https://www.postgresql.org/docs/current/sql-createforeigntable.html).
Foreign tables are imported from a remote database, such as another PostgreSQL
instance or a separate type of database entirely. See [this wiki
page](https://wiki.postgresql.org/wiki/Foreign_data_wrappers) for a full list of
different types of data imports supported by the PostgreSQL community.

Support for foreign tables may be added in a future TinyDevCRM release.
