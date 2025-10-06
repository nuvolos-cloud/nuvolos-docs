# Risk measures

This module mainly calculates two risk measures, Value-at-Risk (VaR) and Expected Shortfall (ES). It does so based on four different models: the empirical model, extreme value theory (EVT), a normal distribution, and Student's t-distribution.

### VaR

* _Empirical_: directly uses a quantile function to sort the data sample and find the quantile value at the target percentile.
* _EVT_: we first use the **QRM::fit.GPD** function to fit the generalised Pareto distribution based on the data-exceeding threshold (the selected EVT two-side tail percentage). Next, we use the **QRM::RiskMeasures** function to find the quantile value at the target percentile. The package "QRM" considers the 'lambda' value, which is the total obs / number of excesses by threshold.
* _Normal_: we first use **MASS::fitdistr** to fit the data sample to get the mean and standard deviation, then the **qnorm** function to find the quantile value at the target percentile.
* _Student's t_: similar to the normal distribution model, it uses **QRM::fit.st** functions to fit the mean, sigma and nu, then the **QRM::qst** function to find the quantile value at the target percentile.

### ES

* _Empirical_: filters the subset data exceeding the quantile threshold and calculates their average value.
* _EVT_: **QRM::RiskMeasures** can also calculate the ES value for the EVT model.
* _Normal_: uses the data sample to **MASS::fitdistr** to fit the mean and standard deviation, then the formula **$mu - sd \* dnorm(qnorm(p))/p$** to calculate the ES value.
* _Student's t_: similar to the normal distribution model, it uses **QRM::fit.st** functions to fit the mean, sigma and nu, then the below formula to calculate the ES value: \
  &#xNAN;**$ES\_st = 1/p / (nu - 1) \* (nu - 2 + qt(1-p, nu)\*\*2) \* dt(qt(1-p, nu), nu)$ $ES = - (mu + sig\*ES\_st)$**

### Conditional risk measures

Conditional risk measures use one time-series data object as their reference. We then consider a certain bottom percentile of this reference data series and filter out the corresponding time period. Last, under the same period, we filter the target assets and calculate corresponding risk measures. For example, if the reference series is S\&P 500 index, "below 50%" means the S\&P 500 is lower than its median value. Then we only consider these periods and filter the target assets to the same period and calculate corresponding risk measures.
