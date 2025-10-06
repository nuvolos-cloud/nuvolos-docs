# Carry trade strategies

This module creates carry-trade strategies for interest rate products. It requires selecting two objects in the data selection module: (a) **Spot Exchange Rate** data type in **USD** currency under the **Exchange Rate** table; (b) **Interest Rate 1-Month** data type in the local currency under the **Interest Rate** table. In addition, the latter object must include the USD interest rate.

In this module, the user must first select both data objects in the _data selection_ tab.

In the _position setup_ tab, there are two portfolio strategies:

* Equally-weighted calculation: 1/N
* Maximal Sharpe-Ratio calculation: uses the method of maximising the Sharpe ratio value with the matrix solver function.

The rebalance type can be **static** or **dynamic**.

For the long position, it needs numerous carry currencies and the allowed number of active currencies. The user can choose to use the same configuration for short position or select a separate set of currencies for short carry.
