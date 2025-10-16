# Build queries

Nuvolos offers an easy-to-use query builder interface for building and running SQL queries. To open the query builder, navigate to the tables view and click the _Query table_ button next from the list of table actions or the _Query_ button available next to the table name.

![](<../../.gitbook/assets/Screen Shot 2021-05-20 at 3.36.43 PM.png>)

## Column selection and preview

The first step concerns the selection of the columns to include in the query. The user can select all columns via the "Select all" button or select a subset of the columns by clicking on the column name in the list of columns on the left. E.g. in the screenshot below, three columns were selected.

Selected columns will appear in a list on the right side as shown in the screenshot below. To remove a column from selection, click on the red 'clear' button next to the column name in the selected columns list. Otherwise, use the "Remove all" button to unselect all selected columns.

{% hint style="warning" %}
At least one column must be selected in order to move to the next step
{% endhint %}

![](<../../.gitbook/assets/Screen Shot 2021-05-20 at 3.38.48 PM.png>)

## Filters

{% hint style="success" %}
Adding filters is an optional step and the user can skip it. However, all added filters must be valid in order to proceed to the next step.
{% endhint %}

In the second step, the user can add conditions that filter selected columns for rows that meet certain criteria. Filters can be added for any of the selected columns using the ADD FILTER button and they can be deleted using the red bin button:

![](<../../.gitbook/assets/Screen Shot 2021-02-26 at 10.58.01 AM (1).png>)

* **Filtering a FLOAT or NUMERIC column**

For NUMERIC and FLOAT columns, all types of filters are allowed (equal, not equal, greater than, less than,...).  It is also possible to use the "in" filter to upload a file that contains the filtering values.

{% hint style="warning" %}
FLOAT and NUMERIC filters can only take numbers as filtering values.
{% endhint %}

![](<../../.gitbook/assets/Screen Shot 2021-02-26 at 11.13.29 AM.png>)

* **Filtering a VARCHAR (String) column**

Varchar or string columns can be filtered using non-order filters such as (equal, not equal,...) but not filters such as greater than or less than.

![](<../../.gitbook/assets/Screen Shot 2021-02-26 at 11.19.42 AM.png>)

* **Filtering DATE, TIME, and DATETIME columns**

To filter date and time columns, date and time pickers are used. A date picker lets users select a date, time,  or a range of dates and/or times.

![](<../../.gitbook/assets/Screen Shot 2021-02-26 at 11.52.35 AM.png>)

{% hint style="info" %}
To easily select past dates, you can click on the date field on the date picker to get a list of months (single click) or years (double click) as shown below.
{% endhint %}

![](<../../.gitbook/assets/Screen Shot 2021-02-26 at 11.44.38 AM (1).png>)

<div align="center"><img src="../../.gitbook/assets/Screen Shot 2021-02-26 at 11.47.32 AM.png" alt=""></div>

![](<../../.gitbook/assets/Screen Shot 2021-02-26 at 11.47.38 AM.png>)

## Aggregation functions and filters

{% hint style="success" %}
Adding aggregation functions and filters is an optional step and the user can skip it. However, all added aggregators and filters must be valid in order to proceed to the next step.
{% endhint %}

Aggregators help grouping values in selected columns, forming groups based on the values of other columns. It is possible to add one or more aggregators via the ADD AGGREGATION FUNCTION button, and the ADD AGGREGATION FILTER is used to add aggregation filters.

In the screenshot below, an aggregation function was added to group by and the count the number of each distinct value of the column FLOAT\_COLUMN. Additionally, a filter was added to return rows where the count is greater than 100

![](<../../.gitbook/assets/Screen Shot 2021-02-26 at 12.41.35 PM.png>)

## Sort conditions

{% hint style="success" %}
Sorting is an optional step and the user can skip it.
{% endhint %}

The user can add one or more sorting conditions for the selected columns or the columns created by aggregation functions.

![](<../../.gitbook/assets/Screen Shot 2021-02-26 at 12.49.22 PM.png>)

## Limit condition

A limit condition limits the number of rows returned by the query and it is a required field.

![](<../../.gitbook/assets/Screen Shot 2021-02-26 at 12.56.33 PM.png>)

## Review and submit the query

The final step consists of reviewing the SQL query and submitting it. By clicking on 'Submit for data export', the constructed SQL query will be executed and the user will be able to download a zipped file containing the outcome of the query in CSV format.\
\
An option is available to obtain a snippet code that the user can use to run the constructed query from an application. To obtain a snippet, click on the 'Run from application' button and select the programming language you want to use to run the query. A modal will open from which the user can copy the generated code and instructions on how to run it.

![](<../../.gitbook/assets/Screen Shot 2021-05-20 at 3.48.44 PM.png>)
