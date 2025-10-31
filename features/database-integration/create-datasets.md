# Create datasets

## Purpose

Dataset spaces are meant to store curated, high-quality and well-documented data. Any steps prior to achieving this state is supposed to be performed in other (research) environments and only final versions are to be distributed to a dataset space.

## Preparing data for a dataset

Every data harvesting, cleaning and curation workflow is different and should be designed on a case-by-case basis. We provide general principles that harmonise well with data layout in Nuvolos.

Some important guidelines to consider when designing your dataset:

1. One dataset should map to one space.
2. If a dataset has multiple sub-databases (such as topical sub-databases, for example Health Indicators, Development Indicators, etc.), you may consider populating multiple instances in the same dataset space.
3. Create vintages of your data to differentiate different point-in-time states of the same data.
4. Table names need to be unique in a single vintage, but may be the same across multiple instances.
5. When distributing from multiple instances, name clashing may occur, so avoid overlapping names whenever possible when designing a dataset.
6. In database layout, Organization and Space together form a [Database](https://docs.snowflake.com/en/sql-reference/ddl-database.html), and Instance and Snapshot form a [Schema](https://docs.snowflake.com/en/sql-reference/ddl-database.html#schema-management). This means that all instances are stored in the same database, but all vintages are stored in different schema.
7. We suggest only distributing completely scrubbed and final versions of data to a dataset space, intermediate states should be kept in research instances. It is not possible to modify data stored in dataset spaces (they are essentially "read-only" once data has been populated).

A generic flow would require the following steps:

1. [Create target dataset](../../administration/space-management/#create-a-new-space) as a dataset space. Choose the appropriate visibility option (public for open datasets and private for datasets with stringent access control requirements). Activate tables in the dataset.
2. Create a research space, an application and the appropriate data harvesting code. Activate tables in the research space.
3. Pull data from your source and [insert raw data into the Scientific Data Warehouse](upload-data.md) (SDW).
4. Clean and manipulate data to reach the desired layout and quality either via in-memory or in-SDW procedures or a combination of both.
5. Document data.
6. [Distribute data](../object-distribution/) along with its documentation to the dataset space.
7. Create vintage in the dataset space by using the [snapshot feature](../nuvolos-basic-concepts/snapshots.md).

### Documenting your data

Data documentation in Nuvolos may comprise of the following artefacts:

* Descriptive documentation in PDF or markdown format stored on the filesystem, along with [ERD](https://en.wikipedia.org/wiki/Entity%E2%80%93relationship_model)s and other representations if necessary.
* [Column comments](https://docs.snowflake.com/en/sql-reference/sql/comment.html) for short-hand information on column values (unit of measurement, high level description.
* [Table comments](https://docs.snowflake.com/en/sql-reference/sql/comment.html) for short-hand information on table comments.

{% hint style="info" %}
You can add table and column comments programmatically by sending appropriate SQL statements as linked previously. If you would rather use a GUI solution, you can always use the interface on the [tables view](view-tables.md) to edit the description of a column or table.
{% endhint %}

## Non self-service datasets

In case of non self-service datasets, as part of professional data services, we perform the previous steps. The intermediate states are generally not available in your organisation as a research space, however the end result is always stored with the appropriate rights in dataset spaces.
