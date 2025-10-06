# Moment estimation

This section provides three methods to calculate the correlation, expected return, and standard deviations. These methods are used in other modules as well, such as **dynamic strategy**.

### Correlation

It plots the correlation across pair-wise assets. When the number of assets is less than or equal to 10, it will show the correlation matrix with numbers. Above 10 assets, it will show the heatmap as default. It uses the below methods to calculate covariance first, then converts it to the correlation matrix:

* _Sample statistics_. Regular covariance calculation for the data in the sample period.
*   _Factor model_. Selecting used factors and the risk-free rate, they are applied to:

    1. Calculate the beta(s) of each asset based on the selected factors and the risk-free rate.
    2. For each asset $i$ and a vector of factor b:
       * its expected return can be written as `$E[R_i] = E[R_f] + E(R_ib)$, where $E(R_ib) = \beta_{ib} * E[\text{Factor}_b]$`,
       * so the covariance between asset $i$ and $j$ is written as `$cov(R_i, R_j) = b_i*CF*b_j' + cov(R_{ib}, R_f) + cov(R_{jb}, R_f) + var(R_f)$`, where:
         * bi = a {1\*m} vector of asset i's exposures to the m factors
           * CF = an {m\*m} matrix of the factor covariances
           * bj = a {1\*m} vector of asset j's exposures to the m factors;

    See also this reference from William Sharpe: [https://web.stanford.edu/\~wfsharpe/mia/fac/mia\_fac3.htm](https://web.stanford.edu/~wfsharpe/mia/fac/mia_fac3.htm)
* _Shrinkage method_:
  * Classic: Ledoit-Wolf Shrinkage Variance Estimate with weight in NULL. For more information, please refer to [https://search.r-project.org/CRAN/refmans/BurStFin/html/var.shrink.eqcor.html](https://search.r-project.org/CRAN/refmans/BurStFin/html/var.shrink.eqcor.html)
  * Glasso: estimates a sparse inverse covariance matrix using a lasso (L1) penalty, using the approach of Friedman, Hastie and Tibshirani (2007). For more information, please see [https://cran.r-project.org/web/packages/glasso/glasso.pdf](https://cran.r-project.org/web/packages/glasso/glasso.pdf)

### Expected Return

* _Sample statistics_. Simple mean of historical observations without null values.
* _Factor_. For asset $i$, the expected return $E\[R\_i]$ is calculated as
  1. Run regression : `$R_{it} - R_{ft} = alpha_i + beta_{ij} * Factor_{jt} + \varepsilon_{it}$`
  2. Calculate the expected return `$E[R_i] = E[R_f] + \sum_j \beta_{ij} * E[\text{Factor}_j]$`.
* _Shrinkage method_: same as sample statistics.

### Sigmas&#x20;

Same as the correlation/covariance matrix calculation.

\
