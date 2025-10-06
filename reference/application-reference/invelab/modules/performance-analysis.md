# Performance analysis

### Time-series summary

* _Annualised return_: the return series or average return is converted to the annualised return by multiplying the input value by a factor dependent on the frequency of the input:
  * Daily: 252
  * Weekly: 52
  * Monthly: 12
  * Quarterly: 4
* _Excess mean above risk-free rate_: this requires selecting the risk-free rate series in the **factors** tab.
* _Sharpe ratio_: uses the **excess mean above rf** divided by the **standard deviation**.

### Factors&#x20;

Select factors as shown in the [moment estimation module](moment-estimation.md). After running **calculate factor model regression**, the visualisation mode shows the following options:

* _Model statistics_: shows alpha, beta, R-square, R-square, standard error, etc.
* _Confidence interval plot_: creates a box plot for the selected factor coefficient and its corresponding confidence interval at the 95% level.
* _XY plot_: creates a scatter plot between selected coefficients for all assets.
* _Beta bar chart_: plots selected coefficients in a stack bar plot.
* _Return decomposition_: draws the stack bar plot of all coefficients multiplying the factor risk premium plus alpha.
* _Parallel plot_: can show the coefficient comparison between assets and across split periods.

### Split&#x20;

Selects a date to split all assets into two parts, the first before the split date and the second after the split date.

### Highlight

Chooses a \[CD\_] object type to show the characteristics of certain datasets, e.g. **strategy** for the hedge fund dataset.

### Moving window

Calculates the factor model in the moving window length.
