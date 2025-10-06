# Valuation

This module implements the basic Gordon Growth Model to demonstrate the valuation of an investment project.

Since this module targets to calculate the expected return and investment value of Chinese investment projects, we take the size bottom 20% of Chinese listed firms and regress their annual returns with certain financial characters. We finally choose two variables, "Total Asset Growth Rate" (TAGR) and "Gross Profit Ratio" (GPR), and use corresponding coefficients to calculate the expected return (ER) for an investment project.\
&#xNAN;**$ER = 26.67% - .656 \* TAGR - .1013 \* GPR$**

Adjusting the inputs of "Total Asset Growth Rate" and "Gross Profit Ratio" under the _characteristic model_ tab lets you calculate and save the expected return of an investment project.

In the _portfolio composition_ tab, users can apply the Gordon Growth Model to evaluate a project's cash flow and total value. Users need to input the initial investment cost, the first annual cash flow (D\_1), and the expected growth rate (g), then select the calculated cost of equity (r) from the previous step. The project evaluation will illustrate the cash flow development.
