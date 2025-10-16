# Apache Superset

## Starting out with Superset

Superset as an application is available in all Nuvolos Spaces where [Tables have been activated](../../features/database-integration/view-tables.md#activating-tables).

To add a Superset application to your instance, go to the Applications tab, click on the Superset icon, select the latest available version and type in a name for your application:

![](<../../.gitbook/assets/Screenshot 2022-04-12 at 13.36.52.png>)

Once the application is added to the instance, start the application. The application should load, it could take a couple of minutes if your insance has many tables already created.

Once the application loads, you will see a logon screen:

![Superset logon screen](<../../.gitbook/assets/Screenshot 2022-04-12 at 13.50.29.png>)

Log on to Superset as an Administrator with the username "admin" and the password "admin". Since the application is unique to your instance, having these credentials is not a concern. The login screen is currently required for Superset to function properly.&#x20;

### Running queries

Once logged in, you will find that your Nuvolos connection has been pre-added as a Database in Superset, and the tables in your instance as Datasets:

![](<../../.gitbook/assets/Screenshot 2022-04-12 at 13.50.40.png>) ![](<../../.gitbook/assets/Screenshot 2022-04-12 at 13.50.44.png>)

If you click on a Dataset (a table), you can query the table data without needing to write SQL queries:

![](<../../.gitbook/assets/Screenshot 2022-04-12 at 16.42.46.png>)

You can also export the query results as a CSV file.

### SQL Lab

If you wish to write queries using SQL or you wish to create tables using SQL DDL statements, you can open an SQL Editor from the SQL Lab menu:

![](<../../.gitbook/assets/Screenshot 2022-04-12 at 16.47.17.png>)

If you wish to use the query results to create charts, you can click on the "Explore" button to save the query as a virtual dataset.

### Uploading CSV files

You can upload small (< 1M rows) CSV files as Datasets (Nuvolos tables) with Superset by clicking on the "Data" menu and selecting "Upload a CSV".

**Important: Use a UPPERCASE table name.**

![](<../../.gitbook/assets/Screenshot 2022-04-12 at 16.34.26.png>)

You can see the upload process in the following short video:

{% embed url="https://player.vimeo.com/video/794175676?byline=0&h=573c53b1b2&portrait=0&title=0" %}

### Creating charts and dashboards

You can use the pre-created Datasets (Nuvolos tables) to create charts and you can also use saved SQL Lab queries as Datasets to create charts by clicking on the "Charts" menu and adding a new chart with the "+ CHART" button on the top-right:

![](<../../.gitbook/assets/Screenshot 2022-04-12 at 16.52.04.png>)

You need to select the Dataset (Nuvolos table or saved query) to use:

![](<../../.gitbook/assets/Screenshot 2022-04-12 at 16.53.43.png>)

Once you have selected the Dataset to use and the chart type, you need to specify the series to use, the grouping/aggregation criteria, and the values to plot:

![](<../../.gitbook/assets/Screenshot 2022-04-12 at 14.39.24.png>)

Once you have created the charts you wish to see on a Dashboard, you can create a Dashboard and configure the layout of the charts:

![](<../../.gitbook/assets/Screenshot 2022-04-12 at 16.33.39.png>)

### Further reference

The official Apache Superset documentation is available at: [https://superset.apache.org/docs](https://superset.apache.org/docs).
