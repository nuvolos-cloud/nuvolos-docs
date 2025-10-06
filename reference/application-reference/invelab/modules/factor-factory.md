# Factor factory

This module creates factor return series based on the conventional factor creation method. We need to select an unbalanced dataset to cover a large investment universe and select asset characters (data type) as the ranking base - for example, Market Cap at T-1 - for a size-sorting factor. Note: this module only supports univariate sorting but not bivariate double-sorting.

In the _portfolio settings_ tab, users can choose the number of buckets (default is 10), long-short bucket selection, and then save the specified portfolio as a factor return series.

For more information, please see [Fama, E. F., & French, K. R. (1993). Common risk factors in the returns on stocks and bonds. Journal of financial economics, 33(1), 3-56.](https://www.jufinance.com/mag/fin534_16/Common_risk_factors_Fama_French_JFE1993.pdf)
