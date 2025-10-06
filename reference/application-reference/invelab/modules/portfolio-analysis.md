# Portfolio analysis

### Volatility risk contribution & ES risk contribution&#x20;

Plot the asset contribution by the corresponding risk. Please refer to the [Frontiers module](frontiers.md) for detailed calculation functions.

### Turnover

Calculates the total weight (position) changes over each period and then cumulates it as the total turnover plot.

### Transaction cost&#x20;

A percentage of the turnover. By setting this value, the user can save a new portfolio return series to include the transaction cost.

### Default loss

This is used for portfolios with an unbalanced dataset. It is possible that the invested assets are missing the next period return. In such a case, we ascribe a default loss to this asset. The user can set the default loss value here.
