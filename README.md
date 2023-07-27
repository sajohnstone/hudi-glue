# Apache Hudi & Glue

This repo is part of an article on how setup Hudi and AWS using Glue.

## Setup

### Build Environment

In order to this you [Docker](https://docs.docker.com/get-docker/) will need to be installed.  It uses a [3 Musketeers](https://3musketeers.io/) pattern to make it easy to run.

## Data

To provide a working version I've included 1000 rows of data, but you can download the full dataset here <https://pandemicdatalake.blob.core.windows.net/public/curated/covid-19/bing_covid-19_data/latest/bing_covid-19_data.csv>.

## How to run

To install the IaC run the following script:-

```shell
export AWS_PROFILE=sandpit1
export AWS_REGION=ap-southeast-2
make apply
```

In order to uninstall run:-

```shell
make destroy
```
