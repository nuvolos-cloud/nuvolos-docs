# Working with the S\&P 500®

## S\&P 500® index level history

There are multiple possible sources to obtain S\&P 500® index level history when working on Nuvolos:

### S\&P Dow Jones Indices (SPDJI) \[license required]

If you have access to the SPDJI dataset on Nuvolos, the `INDEX_LEVELS` and `INDEX_LEVELS_V1` tables contain the official S\&P 500® index level history, please distribute these two tables from the latest available SPDJI dataset snapshot to your working instance.

You can use the following query to obtain the time series:

```sql
SELECT DATE_OF_INDEX, INDEX_VALUE
FROM INDEX_LEVELS
WHERE INDEX_CODE='500'
UNION
SELECT DATE_OF_INDEX, INDEX_VALUE
FROM INDEX_LEVELS_V1
WHERE INDEX_CODE='500'
ORDER BY DATE_OF_INDEX ASC;
```

### Compustat North America or Compustat Global \[license required]

If you have access to Compustat on Nuvolos, please distribute the `IDX_DAILY` table from the latest dataset snapshot to your working instance.

You can use the following query to obtain the time series:

```sql
SELECT DATADATE, PRCCD
FROM IDX_DAILY 
WHERE GVKEYX='000003'
ORDER BY DATADATE ASC;
```

### CRSP US Stock and Indexes \[license required]

If you have access to CRSP US Stock and Indexes on Nuvolos, please distribute the `DSI` table from the latest dataset to your working instance.

You can use the following query to obtain the time series:

```sql
SELECT DATE, SPINDX
FROM DSI 
WHERE SPINDX IS NOT NULL
ORDER BY DATE ASC;
```

### Python and Yahoo Finance

Please start a Jupyter or Visual Studio Code application in Nuvolos and run the following command to install the `pandas-datareader` [package](https://pandas-datareader.readthedocs.io/en/latest/index.html) in Nuvolos:

```shell
mamba install -y -c conda-forge --freeze-installed pandas-datareader
```

Then you can use the following code to retrieve historical S\&P 500® index levels as a pandas DataFrame:

```python
from pandas_datareader import data as pdr
from datetime import date

df = pdr.get_data_yahoo("^GSPC", start="1928-01-03", end=date.today())
```

## S\&P 500® index historical constituents

There are multiple possible ways to obtain the historical constituents of the S\&P 500 index when working on Nuvolos:

### S\&P Dow Jones Indices (SPDJI) \[license required]

If you have access to the SPDJI dataset on Nuvolos, the `CONSTITUENT_DETAILS` and `CONSTITUENT_DETAILS_V1` tables contain the official S\&P 500® constituents history, please distribute these two tables from the latest available SPDJI dataset snapshot to your working instance.

You can use the following query to obtain the time series:

```sql
SELECT 
SEQUENCE_NUMBER,INDEX_NAME,INDEX_CODE,INDEX_KEY,EFFECTIVE_DATE,COMPANY,RIC,BLOOMBERG_TICKER,CUSIP,ISIN,SEDOL,TICKER,GV_KEY,STOCK_KEY,GICS_CODE,MIC,COUNTRY AS COUNTRY_OF_DOMICILE,REGION,SIZE,CAP_RANGE,CURRENCY_CODE,LOCAL_PRICE,FX_RATE,SHARES_OUTSTANDING,MARKET_CAP,IWF,AWF,GROWTH,VALUE,INDEX_SHARES,INDEX_MARKET_CAP,INDEX_WEIGHT,DAILY_PRICE_RETURN,DAILY_TOTAL_RETURN,DIVIDEND,SOURCE_FILE_NAME
FROM CONSTITUENT_DETAILS_V1
WHERE INDEX_CODE='500'
UNION
SELECT
SEQUENCE_NUMBER,INDEX_NAME,INDEX_CODE,INDEX_KEY,EFFECTIVE_DATE,COMPANY,RIC,BLOOMBERG_TICKER,CUSIP,ISIN,SEDOL,TICKER,GV_KEY,STOCK_KEY,GICS_CODE,MIC,COUNTRY_OF_DOMICILE,REGION,SIZE,CAP_RANGE,CURRENCY_CODE,LOCAL_PRICE,FX_RATE,SHARES_OUTSTANDING,MARKET_CAP,IWF,AWF,GROWTH,VALUE,INDEX_SHARES,INDEX_MARKET_CAP,INDEX_WEIGHT,DAILY_PRICE_RETURN,DAILY_TOTAL_RETURN,DIVIDEND,SOURCE_FILE_NAME
FROM CONSTITUENT_DETAILS
WHERE INDEX_CODE='500'
ORDER BY EFFECTIVE_DATE ASC, SEQUENCE_NUMBER ASC;
```

### Compustat North America (up to 2020-03-31) \[license required]

If you have access to Compustat NA on Nuvolos, please distribute the `SPIDX_CST` table from the latest dataset snapshot to your working instance.

You can use the following query to obtain the time series:

```sql
SELECT DATADATE, GVKEY, IID, CUSIPX 
FROM SPIDX_CST
WHERE INDEXID='500'
ORDER BY DATADATE ASC;
```

### CRSP US Stock and Indexes \[license required]

If you have access to CRSP US Stock and Indexes on Nuvolos, please distribute the `INDEX_MEMBERSHIP` and `NAME_HISTORY` tables from the latest dataset to your working instance.

CRSP makes the following note in their [documentation](https://www.crsp.org/products/documentation/crsp-indexes-sp-500%C2%AE-universe-0) on working with CRSP S\&P 500® indices:

> Due to differences in handling mergers, reorganizations, and other major corporate actions, CRSP data and the S\&P 500® universe do not always have a one-to-one mapping. In some cases this results in a short period where CRSP is missing prices or has multiple prices per company listed by S\&P.
>
> The Count of Securities Used is not always 500 (90 prior to March 1957) due to missing prices. Known reasons for missing prices are when-issued trading, halts, and suspensions.

You can use the following query to obtain the time series:

```sql
SET
NUM_DAYS = (
SELECT
	DATEDIFF(DAY,
	TO_DATE('1926-01-03',
	'YYYY-MM-DD'),
	CURRENT_DATE()+ 1));

WITH DATES AS (
SELECT
	DATEADD(
    DAY,
	'-' || ROW_NUMBER() OVER (
	ORDER BY NULL),
	DATEADD(DAY,
	'+1',
	CURRENT_DATE())
  ) AS DATE
FROM
	TABLE (GENERATOR(ROWCOUNT => ($NUM_DAYS))))
SELECT
	D.DATE,
	IM.KYPERMNO,
	NH.TICKER,
	NH.COMNAM,
	NH.NCUSIP,
	NH.NCUSIP9
FROM
	DATES D
INNER JOIN INDEX_MEMBERSHIP IM
ON
	D.DATE BETWEEN IM.MBRDT AND IFNULL(IM.MBRENDDT, '2099-12-31')
INNER JOIN NAME_HISTORY NH
ON
	IM.KYPERMNO = NH.KYPERMNO
	AND D.DATE BETWEEN NH.NAMEDT AND IFNULL(NH.NAMEENDDT, '2099-12-31')
WHERE
	IM.KEYSET = 1100500
ORDER BY
	D.DATE,
	IM.KYPERMNO;
```
