# Dynamic strategy

### Portfolio strategy&#x20;

In **estimation settings** you can include one or a handful of investment strategies. For the calculation function of the optimisations for all strategies, refer back to the [frontiers module](frontiers.md). Predefined strategies include:

* _Equally-weighted_: by selecting this strategy, it creates an equal-weighted portfolio for the full sample (not limited by in-sample / out-of-sample setting)
* _Fix-weighted_: same as the "equally weighted" strategy, but this can add fixed weights for individual assets.
* _Minimum variance_
* _Target mean (variance)_
* _Equal risk contribution (variance)_
* _Minimum expected shortfall_
* _Target mean (ES)_
* _Equal risk contribution (ES)_

### In-sample / Out-of-sample configuration

The "In-sample date range" sets the date range to calculate the portfolio optimisation using only the in-sample period data. The sampling method can choose :

* The _fix_ method only calculates the in-sample portfolio optimisation once and applies the optimal weight to the entire out-of-sample period.
* The _rolling (window)_ method calculates the in-sample optimisation first and applies the optimal weight to the next period only. It then moves the window forward one frequency and recalculates the optimisation process.
* _Moments_: please refer to the [moment module](moment-estimation.md) for the same functions and settings.
* _Conditioning information_: please refer to the [frontiers module](frontiers.md) for the same functions and settings.
* _Portfolio weights_: plots the time-variation of portfolio weights through the entire out-of-sample period. By clicking each date or selecting from the date field, the user can check the asset allocation at each time point.

\
