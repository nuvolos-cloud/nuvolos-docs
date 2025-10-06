# Frontiers

This module directly applies the frontier functions on a return series without creating the moments first. Please refer to the [moment estimation](moment-estimation.md) module if you want to create a moment object first.

This module plots not only the mean-variance frontier but also the mean-ES frontier with relevant settings.

### Portfolio optimisation based on variance

1. Find the possible expected return range under the asset pool;
2. Based on this range, list a sequence of expected returns ranging from the minimum to the maximum as the target returns of 100 portfolios;
3. Get the optimised weights by targeting one expected return.
   * The optimisation uses the [_quadprog_ package](https://www.rdocumentation.org/packages/quadprog/versions/1.5-8/topics/solve.QP).
   * It requires the mean vector, covariance matrix, constraint list, and the target rate. If you are not calculating the minimum variance portfolio, you do not need the mean vector or target rate.
   * A special portfolio called the tangency portfolio uses the method of maximising the Sharpe-ratio^2 value with the solver [_ipoptr_](https://rdrr.io/github/jyypma/ipoptr/man/ipoptr.html).&#x20;

### Portfolio optimisation based on expected shortfall (ES)

This involves similar steps as the variance optimisation, but with a different optimisation function.

* The solver here uses the package [_rglpk_](https://www.rdocumentation.org/packages/Rglpk/versions/0.6-4/topics/Rglpk_solve_LP)_._

### Constraints

The user can set up constraints on each asset.

* _Short-sale constraints_: this selection adds constraints for all assets to ensure that their weights are larger than 0.
* _Add constraints_: the user can add specific constraints to be ">=" (larger or equal to), "<=" (less or equal to), or "==" (exactly equal to) certain weights. This can apply to both single assets or the sum of a group of assets (by selecting multiple assets together).

### Special portfolios&#x20;

This shows what portfolios or assets the user is interested in plotting on the graph.

* Equally-weighted
* Minimum risk
* Tangency portfolio
* Portfolio constituents
* Equal risk contribution: to calculate the equal risk contribution portfolio, please refer to [Maillard, S., Roncalli, T., & Teiletche, J. (2008). On the properties of equally-weighted risk contributions portfolios. SSRN.](http://thierry-roncalli.com/download/erc.pdf)
* Conditional information: the module can calculate and plot frontiers based on the condition of an asset series, such as when the S\&P500 return is at the bottom 50% of its overall historical data.

### Further sections

After selecting one portfolio on the efficient frontier, it will show a few sections at the bottom of the page.

* _Info_: the user can use the "**Save selected mean-variance portfolio returns**" button to save the selected portfolio for other modules.
* _Weights_: shows the asset weight allocation of the selected portfolio.
* _Historical returns_: plots the historical return distribution of the selected portfolio in the sample period.
* _Risk contributions_: shows the bar plot of each asset's contribution to the portfolio's risk in both variance and expected shortfall.

\
