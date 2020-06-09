---
title: "Preparing Data"
weight: 17
---

## Preparing Data

Let's take our digital contacts management data and import it into TinyDevCRM.
For data integrity reasons, TinyDevCRM supports [Apache
Parquet](https://parquet.apache.org/); a more streamlined means of data upload
will be added in a future TinyDevCRM release.

> If we converted it into a CSV file, it may look something like this:

```shell
$ cat /path/to/file.csv

First Name,Last Name,Relation,Date,Notify,Note
Melanie,Barron,Friend,1979-05-03,ANNUALLY,Birthday
Cynthia,Ward,Coworker @ Company X,2009-07-01,ANNUALLY,Work Anniversary
Mary,Gil,Coworker @ Company Y,1993-01-16,ANNUALLY,Annual Happy Hour
Christopher,Hoffman,Fishing Buddy,2003-08-26,MONTHLY,Fishing Gala
```

> TinyDevCRM currently accepts Apache Parquet files only. To convert a CSV file
> into a Parquet file locally, install the Python dependencies `pandas` and
> `pyarrow`. You can do so by downloading
> [Anaconda](https://docs.conda.io/en/latest/) and running the following script:

```shell
$ conda create myenv python=3.8
$ conda activate myenv
(myenv) $ conda install -c anaconda pandas
(myenv) $ conda install -c conda-forge pyarrow
```

> Next, open a Python shell using `ipython`, and run the following:

```python
import pandas as pd
pd.read_csv('/path/to/file.csv').to_parquet('/path/to/file.parquet')
```

> At this point, you should now have a Parquet file representing your data at
> `/path/to/file.parquet`.
