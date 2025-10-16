# Accessing data as data.frames in R

If you are not keen on using SQL syntax and your database setup is fairly straightforward, there is no need to write queries in SQL to get data into your R application. The `dbplyr` package lets your write your package in `tidyverse` friendly syntax, please refer to the package vignette [here](https://dbplyr.tidyverse.org/).

In order to use `dbplyr` you need to take the following steps:

1. Install the `dbplyr` package by typing `install.packages("dbplyr")` into your R shell.
2. Once you've installed the package, you can use the `nuvolos::get_connection()` call to obtain a connection that you can feed to `tbl`.

As an example, the following code queries the `test` database table, selects two columns and filters for records where `V2 > 0`.

```r
con <- nuvolos::get_connection()
data <- dplyr::tbl(con, "test")
data %>% dplyr::select(V1, V2) %>% dplyr::filter(V2 > 0)
```

The equivalent SQL statement would be:

```sql
SELECT V1, V2 FROM "test"
WHERE V2 > 0;
```

