---
description: How do you import data onto Nuvolos?
---

# Importing data on Nuvolos

This page collects data import use-cases and best practices on how data may be transferred into Nuvolos.

## Data pipelines (ETL pipelines)

Data pipelines can be loosely defined as a chain of processes that extract data from a source and store it in a pre-defined format in a target.

Sources could be:

* Files over the internet that a script collects,
* Webpages that you [scrape](https://en.wikipedia.org/wiki/Web_scraping),
* Data already in a database format.

Targets similarly could be:

* Flat files in some data format (csv, [parquet](https://parquet.apache.org/), etc.)
* Some structured database format,
* A data lake (a mix of structured, semi-structured and unstructured data).

In the case of Nuvolos, the targets generally are of three types:

* The Nuvolos file system (flat file storage types),
* The Nuvolos data warehouse (database format),
* [Large-file storage](../../features/file-system-and-storage/large-file-storage.md).

To run data pipelines on Nuvolos we suggest our users to take advantage of the [Airflow](../application-specific-guides/apache-airflow.md) applications on Nuvolos. You can manually or automatically trigger highly complex and tuneable workflows with the help of Airflow. We suggest our users to get acquainted with Airflow [best practices](https://airflow.apache.org/docs/apache-airflow/stable/best-practices.html).

To highlight, Airflow offers the user the ability to create a pipeline (defined as a directed acyclic graph) that combines multiple workload types (scripts of various languages, command line operations) and offers administrative tools for monitoring, failover, timetables, etc.

You can combine the Airflow tool with our guide to [upload data](../../features/database-integration/upload-data.md) to create a pipeline that ends up writing Nuvolos tables.

## File uploads

There are multiple options to upload files to Nuvolos:

* The [File UI](../../features/database-integration/upload-data.md),
* Application specific UIs (sometimes more suitable for larger files).

### Downloading files

If the data you want to have on Nuvolos is available at some link, there is no need to download to your machine and upload to Nuvolos. You can directly download the data to Nuvolos.

In every Nuvolos application we have made the `wget` command line tool available with which you can download files from the internet. See its documentation [here](https://man7.org/linux/man-pages/man1/wget.1.html).

## Importing files

You might already have your data in some storage service. Most well-known storage services, including:

* Azure files
* Amazon S3
* Dropbox
* Google Drive
* Box
* Mega

are supported to be _mounted_ (to be attached as a folder) to your apps after a short setup procedure. The list of supported types can be found [here](https://rclone.org/overview/). In order to see the exact procedure, consult our documentation [here](../../features/applications/add-ons/rclone-mount-add-on.md).&#x20;

We have provided detailed guidance on some relevant, non-trivial use-cases:

* [Dropbox](../../features/file-system-and-storage/synchronize-with-dropbox.md)
* [SSHFS](../../features/file-system-and-storage/access-remote-files-with-sshfs.md)
* [SharePoint Online](../../features/file-system-and-storage/access-files-on-sharepoint-online.md)

