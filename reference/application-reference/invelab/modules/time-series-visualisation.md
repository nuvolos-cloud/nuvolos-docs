# Time-series visualisation

1. **Time-series**. The user needs to first select the overall dataset in the header section as the asset pool, and then the user can select specific data series in this section. It can plot one or multiple assets:
   * Summary Table: at the bottom of the page, this section calculates the summary statistics of selected assets.
   * Boxplot: this section draws the box plot with min, lower fence, 25%, median, 75%, upper fence and max.
2. **Autocorrelation functions**. This section plots the autocorrelation between selected data series.
3. **Rolling functions**. This section needs to select one benchmark series and the comparison series first, then it will show the **length of the rolling window** for calculation. It supports two calculation methods:
   * Correlation: simple Pearson correlation for each rolling window
   * CoVar: calculate the risk dependency between assets by filtering the return series lower (higher) than or equal to the target quantile number value.
4. **Scatter plots**. This section plots the multiple assets return series jointly
   * Joint Distribution: the shadow field represents the loess regression fitting (refer to: [https://rdrr.io/r/stats/loess.html](https://rdrr.io/r/stats/loess.html))
   * Joint Risk Metrics: it supports only two assets. The visualization provides VaR, CoVaR, ES, and MES.
5. **Time-series differential**. This section only uses for currency-related visualization with **\[D\_]** type objects:
   * _Select series a_ from a Forward exchange rate (e.g. currency X)
   * _Select series b_ from a Spot exchange rate (same currency X)
   * _Select series c_ from a USD interest rate (USD)
   * _Select series d_ from a Foreign currency interest rate (same currency X)
   * All series should use the same duration (e.g. 1-Month or 3-Month, etc.)
   * The _Difference plot_ section plots the 1-month forward spread in log **(named e)**, e.g. ``e=log(`AUD:[D_9]`) - log(`AUD:[D_10]`); and the 1-month interest rate differential in log``` `**`(named f)`**``, e.g. f= log(1+`USD:[R_1]`/12) - log(1+`AUD:[D_7]`/12)``. It also provides summary statistics and the box plots of the spread and the differential series.
   * The _Difference regression_ section regresses f on e with their joint distribution.
   * The _Residual plot_ section shows the time series plot of the regression residual.
6. **Compare random portfolios**: it supports only **\[RP\_]** type objects. This section plots the number of portfolio constituents in each random portfolio on the corresponding standard deviations. The shadow field represents the loess regression fitting.
7. **Dependency**. This section calculates the overall correlation and tail correlation between one asset and other assets, then plots and compares the difference between the overall correlation and the tail correlation:
   * It supports two methods of correlation calculation: Pearson correlation and Spearman correlation.
   * It also supports Value-at-Risk and CoVaR.
