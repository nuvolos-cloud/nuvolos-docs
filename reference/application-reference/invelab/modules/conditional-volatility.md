# Conditional volatility

This module calculates conditional volatility and scaled innovations based on three models: GARCH, GJR-GARCH, and EWMA.

All models apply the **rugarch::ugarchspec** function under the _normal distribution_ setting. GARCH uses the "sGARCH" model, GJR-GARCH uses the "gjrGARCH" model, and EWMA uses the "iGARCH" model.
