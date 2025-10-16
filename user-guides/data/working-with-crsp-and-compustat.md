# Working with CRSP and Compustat

## Getting access

In order to get access to a dataset, the organisation managers can provide information on whether the dataset is currently made available in Nuvolos.

## Accessing data in Nuvolos

If CRSP and Compustat datasets are available to your organisation, please see the relevant documentation pages [here](../../features/database-integration/access-data-from-applications/) on accessing data in Nuvolos applications.

## About Compustat and CRSP

**CRSP Stock and Indexes dataset**: The CRSP US Stock Databases contain daily and monthly market and corporate action data for over 32,000 active and inactive securities with primary listings on the NYSE, NYSE American, NASDAQ, NYSE Arca and Bats exchanges and include CRSP broad market indexes. CRSP databases are characterised by their comprehensive corporate action information and highly accurate total return calculations.\
\
**COMPUSTAT North America**: Compustat North America (Standard & Poor’s (McGraw-Hill)) is a database of U.S. and Canadian fundamental and market information on more than 24,000 active and inactive publicly held companies. It provides more than 300 annual and 100 quarterly Income Statement, Balance Sheet, Statement of Cash Flows and supplemental data items. If applicable there is a quarterly update.

## Linking Compustat and CRSP

Both datasets assign non-volatile unique identifiers to securities and companies. CRSP tracks the "lifecycle" of a security, through corporate events such as mergers, acquisitions and rebrandings. To match these identifiers, the link table approach is often used. A link table associates unique identifiers of two different sources.

**CRSP** identifiers:

* **PERMNO** and **PERMCO**. These are unique and permanent identifiers, they are never reassigned and do not change during the life history of a stock.
* **CUSIP**: a nine-digit numeric (e.g., 037833100 for Apple) or nine-character alphanumeric (e.g., 38259P508 for Google) code that identifies a North American financial security. CRSP keeps 8-digits and 9-digits versions of CUSIP. In the 8-digits version, the last digit is removed. A stock's CUSIP can change over time but is never reassigned.
* **Ticker**: unique identifier assigned to a stock traded on a particular exchange. Tickers can be reassigned.

**COMPUSTAT** identifiers:

* **GVKEY**: a unique and permanent retrieval key assigned to each company (issue, currency, index) in the COMPUSTAT database. GVKEYs do not change, and they are not reassigned.
* **CUSIP**: COMPUSTAT keeps the full 9-digits version of CUSIP.
* **Ticker**.

CRSP/COMPUSTAT link generation approaches:

1. Using the CUSIP identifier, present by default in both datasets.
2. Using an identifier linking table provided by the CRSP-COMPUSTAT Merged Database.

### Merging by CUSIP

Merging CRSP and COMPUSTAT using CUSIP, the following steps are required:

* From the CRSP database, get stock identifiers from table `NAME_HISTORY`. This table contains information on identifiers such as `PERMNO` and `CUSIP`, as well as other codes. The start date (column `NAMEDT`) and end date (column `NAMEENDDT`) define the period for which a particular stock identifier was valid. If `NAMEENDDT` is not available, this means that the stock data in `NAME_HISTORY` is still accurate until the most recent date in the dataset.
* From COMPUSTAT, select a table that contains the `CUSIP` identifiers to merge it with the table `NAME_HISTORY` in CRSP. Merging based on the `CUSIP` identifier requires dates from COMPUSTAT and CRSP to fall within the time interval defined by `NAMEDT` and `NAMEENDDT`.

### Merging by CRSP/COMPUSTAT Merged Database <a href="#merging-by-crspcompustat-merged-database" id="merging-by-crspcompustat-merged-database"></a>

The vendor database CRSP-COMPUSTAT Merged provides a link table (`LINK_HISTORY`) that can be used to merge CRSP with COMPUSTAT with the following information:

* **CCMID**: Compustat's permanent identifier, either `GVKEY` for companies or `GVKEYX` for indexes.
* **LPERMNO**: CRSP `PERMNO` link during link period.
* **LPERMCO**: CRSP `PERMCO` link during link period.
* **LINKTYPE**: A code to describe the type of link between CRSP and COMPUSTAT.
* **LINKDT**: first effective date of the link.
* **LINKENDDT**: last effective date of the link. If `LINKENDDT` is null, this means that the link is still effective.

Merging CRSP and COMPUSTAT using **LINK\_HISTORY**, the following steps are required:

* Choose between CRSP or COMPUSTAT as the first dataset to merge with CRSP-COMPUSTAT. If merging CRSP with CRSP-COMPUSTAT, then the join is done based on `PERMNO`. If merging COMPUSTAT with CRSP-COMPUSTAT, then the join is done based on `GVKEY`. When merging the first dataset with CRSP-COMPUSTAT, both identifiers of CRSP (`PERMNO`) and COMPUSTAT (`GVKEY`) will be present in the output table.
*   Merge the resulting table from the previous step with the second dataset. If the first dataset was CRSP, then merge it with COMPUSTAT on `GVKEY`. Otherwise, merge it with CRSP on `PERMNO`.

    _At all times ensure that the dates from CRSP and COMPUSTAT fall within the LINKDT and LINKENDDT range._

### A worked example using the RStudio app

{% hint style="info" %}
**The code examples below are meant for providing a starting point but may need to be adjusted depending on the research question. All researchers should review and verify that the code they use is in line with their research questions.**
{% endhint %}

In the following, it will be assumed that the tables have been distributed **from the Compustat North America dataset** to the current state of the instance of the example. To distribute data, follow the instructions detailed here.

{% hint style="info" %}
The Compustat North America dataset is no longer updated in Nuvolos. Please use the "Compustat Global for \<your institution>" if you wish to work with data newer than December 2020 and refer to the [alternative solution](https://docs.nuvolos.cloud/data/work-with-specific-datasets/crsp-and-compustat#an-alternative-solution) described after this example.
{% endhint %}

#### Designing the query

The suggested workflow is to use the query editor on the UI first to design the query. This step is not compulsory, however, it is considered best practice.&#x20;

#### The query

In the example. the following tables were distributed to the work instance's current state:

Compustat:

1. `FUNDA` (Fundamentals Annual)

CSRP:

1. `MSF` (Monthly price information)

CCM (The merged database):

1. `CCMXPF_LINKTABLE`

**The first subquery - fundamentals from Compustat:**

We select a couple of fundamentals from `FUNDA` along with the important identifiers `GVKEY` and `DATADATE`. It is important to note that the result of a naive query might contain some duplicate `GVKEY`-`DATADATE` combinations that need to be deduplicated.

A simple query that does basic deduplication is the following:

```sql
SELECT DF.GVKEY, DF.DATADATE, DF.ACCO, DF.AJEX, DF.CURCD, DF.RANK_IN_KEY FROM 
(SELECT DISTINCT GVKEY, DATADATE, ACCO, AJEX, CURCD, ROW_NUMBER() OVER (PARTITION BY GVKEY, DATADATE ORDER BY DATADATE) AS RANK_IN_KEY 
FROM FUNDA T
WHERE FYEAR >= 2000 AND FYEAR <= 2010) DF
WHERE DF.RANK_IN_KEY = 1 OR (DF.RANK_IN_KEY > 1 AND DF.AJEX IS NOT NULL)
```

An alternative would be to use R to run a simple query and have R run the deduplication. This is syntactically simpler, but at this point, the database engine cannot be used to combine large tables, so the R application needs to handle the computational and memory burden:

```r
# Load the pipe operator for more readable code
library(magrittr)

# Standard practice to access data in Nuvolos from R inside the Nuvolos app
# The nuvolos library is pre-installed on Nuvolos R applications.
conn <- nuvolos::get_connection()
result_data <- dbGetQuery(conn,"SELECT GVKEY, DATADATE, ACCO, AJEX, CURCD FROM FUNDA WHERE FYEAR >= 2000 AND FYEAR <= 2010")

# Simple deduplicate using dplyr::distinct
result_data_dedup <- result_data %>% dplyr::distinct(GVKEY, DATADATE, .keep_all = TRUE)

```

**The second subquery - using the linking table:**

The following is a simplified possible query of the linking logic. The first table named `INP` is just the result of the previously presented query. This is joined together based on `GVKEY` with the linking table. Some care is needed, due to the fact that a link between a `GVKEY` and `PERMNO` can be transient - hence the linking happens only for timestamps that fall in the linking period. More complicated logic can be implemented using overlap intervals. For the appropriate choice of `LINKTYPE`, consult the dataset documentation, the present version is a standard choice.

```sql
SELECT  INP.*, LT.LPERMNO, LT.LINKPRIM, LT.LINKDT, LT.LINKENDDT FROM
    (SELECT DF.GVKEY, DF.DATADATE, DF.ACCO, DF.AJEX, DF.CURCD, DF.RANK_IN_KEY FROM 
        (SELECT DISTINCT GVKEY, DATADATE, ACCO, AJEX, CURCD, ROW_NUMBER() OVER (PARTITION BY GVKEY, DATADATE ORDER BY DATADATE) AS RANK_IN_KEY 
        FROM FUNDA T
        WHERE FYEAR >= 2000 AND FYEAR <= 2010) DF
    WHERE DF.RANK_IN_KEY = 1 OR (DF.RANK_IN_KEY > 1 AND DF.AJEX IS NOT NULL) ) INP
INNER JOIN CCMXPF_LINKTABLE LT
ON LT.GVKEY = INP.GVKEY AND 
    (INP.DATADATE >= LT.LINKDT OR LT.LINKDT IS NULL) AND 
    (INP.DATADATE <= LT.LINKENDDT OR LT.LINKDT IS NULL)
WHERE LT.LINKTYPE IN ('LU', 'LC')
```

Based on flavour and use-case, additional deduplication might be necessary as there might be multiple `PERMNO` matches for a `GVKEY`. This is easiest to be done using the previously presented syntax in R, however, this involves the drawback of not being able to run later join operations using the database engine.

#### Putting it together with CRSP

The last step of the merging process is to take a CRSP table with PERMNO identifiers and join it using the result of the previous query. The `MSF` table contains monthly pricing information and the bid/ask average `PRC` is queried in this toy example.

```sql
SELECT FUNDLINK.*, MSF.PRC FROM
        (SELECT  INP.*, LT.LPERMNO, LT.LINKPRIM, LT.LINKDT, LT.LINKENDDT FROM
        (SELECT DF.GVKEY, DF.DATADATE, DF.ACCO, DF.AJEX, DF.CURCD, DF.RANK_IN_KEY FROM 
            (SELECT DISTINCT GVKEY, DATADATE, ACCO, AJEX, CURCD, ROW_NUMBER() OVER (PARTITION BY GVKEY, DATADATE ORDER BY DATADATE) AS RANK_IN_KEY 
            FROM FUNDA T
            WHERE FYEAR >= 2000 AND FYEAR <= 2010) DF
        WHERE DF.RANK_IN_KEY = 1 OR (DF.RANK_IN_KEY > 1 AND DF.AJEX IS NOT NULL) ) INP
    INNER JOIN CCMXPF_LINKTABLE LT
    ON LT.GVKEY = INP.GVKEY AND 
        (INP.DATADATE >= LT.LINKDT OR LT.LINKDT IS NULL) AND 
        (INP.DATADATE <= LT.LINKENDDT OR LT.LINKDT IS NULL)
    WHERE LT.LINKTYPE IN ('LU', 'LC') ) FUNDLINK
INNER JOIN MSF
ON MSF.PERMNO = FUNDLINK.LPERMNO AND YEAR(MSF.DATE) = YEAR(FUNDLINK.DATADATE) AND MONTH(MSF.DATE) = MONTH(FUNDLINK.DATADATE)
```

To minimize the memory footprint of an application, it is thus suggested to run the above query in R in the following manner:

```r
# Load the pipe operator for more readable code
library(magrittr)

# Standard practice to access data in Nuvolos from R inside the Nuvolos app
# The nuvolos library is pre-installed on Nuvolos R applications.
conn <- nuvolos::get_connection()
result_data <- dbGetQuery(conn,"SELECT FUNDLINK.*, MSF.PRC FROM 
        (SELECT  INP.*, LT.LPERMNO, LT.LINKPRIM, LT.LINKDT, LT.LINKENDDT FROM
        (SELECT DF.GVKEY, DF.DATADATE, DF.ACCO, DF.AJEX, DF.CURCD, DF.RANK_IN_KEY FROM 
            (SELECT DISTINCT GVKEY, DATADATE, ACCO, AJEX, CURCD, ROW_NUMBER() OVER (PARTITION BY GVKEY, DATADATE ORDER BY DATADATE) AS RANK_IN_KEY 
            FROM FUNDA T
            WHERE FYEAR >= 2000 AND FYEAR <= 2010) DF
        WHERE DF.RANK_IN_KEY = 1 OR (DF.RANK_IN_KEY > 1 AND DF.AJEX IS NOT NULL) ) INP
    INNER JOIN CCMXPF_LINKTABLE LT
    ON LT.GVKEY = INP.GVKEY AND 
        (INP.DATADATE >= LT.LINKDT OR LT.LINKDT IS NULL) AND 
        (INP.DATADATE <= LT.LINKENDDT OR LT.LINKDT IS NULL)
    WHERE LT.LINKTYPE IN ('LU', 'LC') ) FUNDLINK
INNER JOIN MSF
ON MSF.PERMNO = FUNDLINK.LPERMNO AND YEAR(MSF.DATE) = YEAR(FUNDLINK.DATADATE) AND MONTH(MSF.DATE) = MONTH(FUNDLINK.DATADATE);")

### Additional operations on the result set
```

### An alternative solution

Compared to the previous route, it is possible to directly link CRSP and COMPUSTAT vendor tables without using any derived entities such as `MSF` or `FUNDA`.

The below query provides an example of doing this, it is assumed that `TIME_SERIES_DAILY_PRIMARY,` `LINK_HISTORY` and `CO_AFND1` tables are available in the working instance's current state.&#x20;

{% hint style="info" %}
For the new regularly updated "Compustat Global for \<your institution>" datasets, we have created the COMPANY\_ANNUAL\_DATA\_ITEMS table which joins the split Compustat company annual fundamentals tables CO\_AFND1 and CO\_AFND2 for your convenience.

You can replace CO\_AFND1 with COMPANY\_ANNUAL\_DATA\_ITEMS in the examples below to use all data item columns from A to Z without needing to join CO\_AFND1 with CO\_AFND2.
{% endhint %}

```sql
SELECT TS.CALDT AS DATE, TS.KYPERMNO AS PERMNO, FN.GVKEY, ABS(TS.PRC) AS PRC, FN.EPSFX AS EPS
FROM
LINK_HISTORY AS L
INNER JOIN TIME_SERIES_DAILY_PRIMARY AS TS
ON L.LPERMNO = TS.KYPERMNO
LEFT JOIN CO_AFND1 AS FN
ON FN.GVKEY = L.CCMID AND
FN.DATAFMT='STD' AND FN.CONSOL='C' AND FN.POPSRC='D' AND
FN.DATADATE BETWEEN TO_DATE(L.LINKDT::VARCHAR, 'YYYYMMDD') AND TO_DATE(NULLIF(L.LINKENDDT::VARCHAR, '99999999'),'YYYYMMDD') AND
FN.DATADATE = TS.CALDT
WHERE L.LPERMNO = 57913
ORDER BY DATE;
```

In order to run this query and assign it to a data.frame object in R, the following snippet can be used.

```sql
# Standard practice to access data in Nuvolos from R inside the Nuvolos app
# The nuvolos library is pre-installed on Nuvolos R applications.
conn <- nuvolos::get_connection()
result_data <- dbGetQuery(conn,"SELECT TS.CALDT AS DATE, TS.KYPERMNO AS PERMNO, FN.GVKEY, ABS(TS.PRC) AS PRC, FN.EPSFX AS EPS
    FROM
    LINK_HISTORY AS L
    INNER JOIN TIME_SERIES_DAILY_PRIMARY AS TS
    ON L.LPERMNO = TS.KYPERMNO
    LEFT JOIN CO_AFND1 AS FN
    ON FN.GVKEY = L.CCMID AND
    FN.DATAFMT='STD' AND FN.CONSOL='C' AND FN.POPSRC='D' AND
    FN.DATADATE BETWEEN TO_DATE(L.LINKDT::VARCHAR, 'YYYYMMDD') AND TO_DATE(NULLIF(L.LINKENDDT::VARCHAR, '99999999'),'YYYYMMDD') AND
    FN.DATADATE = TS.CALDT
    WHERE L.LPERMNO = 57913
    ORDER BY DATE;")
```

