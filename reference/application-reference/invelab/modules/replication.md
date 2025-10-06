# Replication

This module calculates linear replication following [this paper](https://jasminah.com/Papers/hasanhodzic_lo07b.pdf)'s method.\
In short, this method applies the regression model without the interception term and uses the estimated coefficient as the weights of replicated assets. There are a few options for users to adjust:

* _Weights sum to 1_: generally, the sum of coefficients (weights) should equal to 1 in the replication regression. If not, then the remaining weight is allocated to the risk-free asset.
* _Short-selling constraints_: usually, the replicated assets cannot take short positions.
* _Volatility adjustment_: please refer to the paper linked above for more details on this option.
