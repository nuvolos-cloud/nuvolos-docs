# Factor tilting

This module analyses and tilts the factor structure of a portfolio. It requires selecting one return time-series as the reference base asset and selecting a few ETF return series for the tilting direction.

First, we decompose the reference asset with the selected ETF assets by an OLS regression without interception term. The coefficients show the exposure weight of each ETF asset.

Next, after selecting the tilting direction on one ETF asset with w% weight, the new portfolio allocates w% on the selected ETF asset and 1-w% on the reference asset.

After saving this new tilting portfolio, users can compare the portfolio characters and (cumulative) return series in corresponding tabs.
