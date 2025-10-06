# Databricks Connect

Nuvolos now offers a VSCode application with Python 3.9 and R 4.2 and Databricks Connect (`databrics-connect`) pre-installed. From this application, you can submit Spark jobs to Databrics-hosted Spark clusters.

[PySpark](https://spark.apache.org/docs/latest/api/python/) and [sparklyR](https://spark.rstudio.com/) are both installed in the application.

### Prerequisites

{% hint style="info" %}
[Databricks Connect](https://docs.databricks.com/dev-tools/databricks-connect.html) only supports Databricks clusters with versions up to 10.4 LTS.
{% endhint %}

To configure the connection to Databricks, you will need a [personal access token](https://docs.databricks.com/dev-tools/api/latest/authentication.html#token-management), which is not available in the Databricks Community Edition.

First, create a "Databricks 10.4 LTS + Py39 + R 4.2" application in Nuvolos:

<figure><img src="../../.gitbook/assets/Screenshot 2022-12-01 at 15.32.23.png" alt=""><figcaption></figcaption></figure>

Start the new application and open a terminal and configure your Databricks connection with the `databricks-connect configure` command. You will need the [URL of your Databricks cluster](https://docs.databricks.com/dev-tools/databricks-connect.html#step-2-configure-connection-properties) and your [personal access token.](https://docs.databricks.com/dev-tools/api/latest/authentication.html#token-management)

You can test your connection with the command `databricks-connect test`

### Python example

To run the example, please install the `slugify` Python package with the following command:

`conda install -y -c conda-forge python-slugify`

Once you have configured the Databricks connection, you can try the following simple example to create a Databricks table and run a SQL query on the table:

```python
import pandas as pd
from pyspark.sql import SparkSession
from slugify import slugify

spark = SparkSession.builder.getOrCreate()
spark.conf.set("spark.sql.execution.arrow.pyspark.enabled","true")

# Use NYC Squirrel Census data
df = pd.read_csv("https://data.wa.gov/api/views/f6w7-q2d2/rows.csv?accessType=DOWNLOAD")
df.columns = [slugify(c, separator="_") for c in df.columns]
df = df.drop(columns=["vehicle_location", "electric_utility"])

df = spark.createDataFrame(df)
df.write.mode('overwrite').saveAsTable('ev_data')

spark.sql('select make, model, count(*) as registered from ev_data group by make, model order by registered desc').show(10)
```

You will see a result like:

<figure><img src="../../.gitbook/assets/Screenshot 2022-12-01 at 16.34.59.png" alt=""><figcaption></figcaption></figure>

### R example

The `sparklyr` package is pre-installed in the application which allows you to connect to Databricks Spark clusters, configured with `databricks-connect.`

You can run the following R script example to run a simple job on your Databricks cluster:

```r
library(sparklyr)
library(dplyr)

databricks_connect_spark_home <- system("databricks-connect get-spark-home", intern = TRUE)
sc <- spark_connect(method = "databricks", spark_home = databricks_connect_spark_home)

cars_tbl <- copy_to(sc, mtcars, overwrite = TRUE)

cars_tbl %>% 
  group_by(cyl) %>% 
  summarise(
    mean_mpg = mean(mpg, na.rm = TRUE),
    mean_hp  = mean(hp, na.rm = TRUE)
    )

print(as_tibble(cars_tbl), n = 10)

spark_disconnect(sc)
```

You should see an output like:

<figure><img src="../../.gitbook/assets/Screenshot 2022-12-01 at 17.21.06 (1).png" alt=""><figcaption></figcaption></figure>
