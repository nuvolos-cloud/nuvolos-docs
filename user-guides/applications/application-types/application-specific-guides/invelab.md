# InveLab

The Nuvolos team created InveLab to apply advanced finance models with real financial data to allow students to learn finance concepts intuitively and practically. Among other things, this platform lets students develop the following skills:

* Visualising real financial data.
* Understanding the process of portfolio construction, in-sample & out-of-sample back-testing, international diversification and currency hedging.
* Analysing investable assets, including hedge funds, to assess their ability to generate abnormal performance (alpha).
* Modelling and measuring the dependence among risks, such as Value-at-Risk and Expected Shortfall.
* Practicing various quantitative investment strategies, including factor investments, factor-tilting, etc.

### InveLab editions

The fundamental building blocks in InveLab are _modules_, which represent different operations on financial data. One module might enable visualising a dataset, while another might use the same dataset to compute portfolio weights. Since they generally depend on each other, you don't directly work with individual modules in InveLab. Rather, we have created bundles of modules called _editions._ Editions tell a complete story about some aspect of financial analysis, and guide you through the various modules intuitively.

Each InveLab edition can be installed as an independent Nuvolos application. Currently Nuvolos offers the following editions:

* Alternative Investments
* Global Asset Allocation and Management
* Risk Management in Private Banking
* Data Analysis & Advanced Modelling
* Unified course application
* Regression application

### Workflows

When you start one of the InveLab editions, you'll see a screen similar to this:

<figure><img src="../../.gitbook/assets/image (74).png" alt=""><figcaption><p>Welcome screen of a freshly installed InveLab edition</p></figcaption></figure>

To work with InveLab modules within a given edition, first you need to start a _workflow_. A workflow is a named container for all the objects you work with during your analysis. Whenever you add/modify data in any of the modules, the new state of your workflow will be saved. For this reason, there is no explicit save button in InveLab - anytime you change some objects, a new save is created automatically.

The next time you start InveLab, you can resume your work from where you left off. You can also start multiple workflows in parallel, and run different analysis on them in the same edition.

#### Distributing workflows

In a teaching setting, it can be useful for instructions to prepare workflows for students that already have some prepared data in them, so the students only need to focus on the modules that consume the prepared data.&#x20;

This can be easily achieved on Nuvolos in just a few steps:

1. The instructor prepares the workflow(s) in the InveLab edition running in the Master instance of the course space;
2. The instructor distributes the application for all students;
3. Students see the prepared workflows and can work with them.

When distributing an InveLab application, all saved workflows in the Master instance are distributed to student instances, with the following features:

* Workflows can be distributed throughout the course, but students might need to restart their applications to register new incoming workflows
* It is safe for instructors to change workflows already distributed to students. The next time the applications is distributed, the instructor's changes will not overwrite any changes made by students in their instances.
* It is not possible to distribute updates to a workflow that has already been distributed once. However, you can duplicate an existing workflow and distribute it as a brand new workflow.&#x20;

### InveLab modules

Within editions, the structure of InveLab is divided into _objects_, representing financial data types, and _modules_, representing different operations of financial analysis. Modules operate on objects. Some modules have dependencies on others. A typical edition with some modules will look like this:

<figure><img src="../../.gitbook/assets/image (112).png" alt=""><figcaption><p>The first few modules of the Data Analysis and Advanced Modelling edition. You can rename or duplicate your workflow at the triple dot menu at the top right.</p></figcaption></figure>

Here are some general tips for how to work with InveLab modules:

* Each module requires an input to activate. Certain operations generate and save an output, which can then be used for other modules or functions as an input.
* A new workflow always starts with selecting a dataset (except the valuation module). If an input is missing, the module will show in grey and cannot be entered.
* In any input or output field, you can click the object for operations to **show object information**, **show related objects**, or **delete the object**.
* Deleting the parent object will also delete all child objects.

This table describes the allowed input objects for each module (for object names, please read the **object name** section), where "Y" means that this object category can activate the module as the input:

| Module                    | D | RD/RR | URD | ERD/ERR | PTS | RP/RPP | M | R | MC | SRD | Special Reqs                                                                     |
| ------------------------- | - | ----- | --- | ------- | --- | ------ | - | - | -- | --- | -------------------------------------------------------------------------------- |
| Time-Series Visualisation | Y | Y     | Y   | Y       |     | Y      |   | Y | Y  | Y   |                                                                                  |
| Moment                    |   | Y     | Y   | Y       |     |        |   |   |    |     |                                                                                  |
| Black-Litterman           |   |       |     |         |     |        | Y |   | Y  |     | Both M and MC needed                                                             |
| Dynamic Strategy          |   | Y     | Y   |         |     |        |   |   |    |     |                                                                                  |
| Portfolio Analysis        |   |       |     |         | Y   |        |   |   |    |     |                                                                                  |
| Carry Trade Strategy      | Y |       |     |         |     |        |   |   |    |     | Must have both "Interest Rate 1- Month Monthly" and "Spot Exchange Rate monthly" |
| Conditional Volatility    |   | Y     |     |         |     |        |   |   |    |     |                                                                                  |
| Risk Measures             |   | Y     |     |         |     |        |   |   |    | Y   |                                                                                  |
| Frontiers                 |   | Y     |     |         |     |        |   |   |    | Y   |                                                                                  |
| Mean-Variance Frontiers   |   |       |     |         |     |        | Y |   |    |     |                                                                                  |
| Performance Analysis      | Y | Y     | Y   | Y       |     |        |   |   |    |     |                                                                                  |
| Replication               |   | Y     |     |         |     |        |   |   |    |     |                                                                                  |
| Factor Tilting            |   | Y     |     |         |     |        |   |   |    |     |                                                                                  |
| Factor Factory            |   |       | Y   |         |     |        |   |   |    |     |                                                                                  |
| Benchmarking              |   | Y     |     |         |     |        |   |   |    |     |                                                                                  |

Note that some modules have special requirements for their inputs.

### InveLab objects

The object abbreviations given above correspond to the following meanings:

| Abbreviation | Data type/object category                                 |
| ------------ | --------------------------------------------------------- |
| D            | non-return variables (balanced dataset)                   |
| RD           | total return; return without dividends (balanced dataset) |
| RR           | return reference (one RD)                                 |
| URD          | total return (unbalanced dataset)                         |
| ERD          | excess return                                             |
| ERR          | excess return reference (one ER)                          |
| PTS          | portfolio                                                 |
| RP           | random portfolio                                          |
| RPP          | random portfolio plot                                     |
| M            | moment                                                    |
| R            | non-return reference (one D)                              |
| MC           | market capitalization                                     |
| SRD          | scaled return                                             |
| FR           | frontier (generated via return)                           |
| MFR          | frontier (generated via moments)                          |
| MR           | moving risk                                               |
| CD           | characteristics (e.g. hedge fund's strategy)              |
| UD           | non-total-return variables (unbalanced dataset)           |
| FM           | factor model                                              |

### Basic operations

Below is some additional info for basic operations in InveLab.

#### Date:

**Date range selection** allows you to select the calendar day/month/year to input. You can also write the date directly in the date field with the format yyyy-mm-dd.

**Restrict to periods** can limit the dataset into certain pre-defined date ranges, including:

* Dotcom Bubble (2001)
* Euro-Sovereign Debt Crisis (2010-2012)
* The Great Recession (2007-2009)
* All NBER Recessions

#### Save:

When you can save an object, it is optional to provide a description of the saved object and then save. This will show in the object information.

#### Compare:

When comparing objects, you can choose the same or different objects on the left and right sides for different operations.

### Further information

For a more detailed module-by-module guide to InveLab, please see the [application reference](../../reference/application-reference/invelab/) section of the documentation.
