# Find database and schema path

{% hint style="info" %}
This is only required if you are not using an Alphacruncher-supported Nuvolos connector package.
{% endhint %}

Nuvolos relies on database technology provided by Snowflake. Snowflake is handled via its [own flavour of SQL](https://docs.snowflake.net/manuals/sql-reference-commands.html).  Data in a particular snapshot or current state of an instance is located in a schema in Snowflake. Schemas are contained in databases. To obtain the required database and schema information to interact with your data, first, navigate to the [table view](../view-tables.md), and click the **CONNECTION GUIDE** button:

![](<../../../.gitbook/assets/Screen Shot 2020-03-17 at 1.22.49 PM.png>)

The Connection guide provides you with information regarding the database and schema you will need to use in the form of a statement such as:

```
USE SCHEMA "empty_org/documentation_class"."master/development";
```

In this setup, the following important features should be observed:

* Snowflake object names are case sensitive and can contain special characters - consequently, they should be always quoted.
  * In program code, quotes should be appropriately escaped!
* [**USE SCHEMA**](https://docs.snowflake.net/manuals/sql-reference/sql/use-schema.html) simplifies referencing to tables - once you've given this command, you can reference tables as you see them on the user interface.
* Databases are Organization and Space joined by a slash, while schema is determined by Instance and State name (current state is always referred to as _development)._

