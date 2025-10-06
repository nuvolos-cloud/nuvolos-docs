# Nuvolos Compute Units (NCUs)

## NCU Definition

The Nuvolos Compute Unit (NCU) is the computational unit for regular (non-HPC) applications run by users, and is the main unit of account for Nuvolos subscriptions.

In terms of computational resource, an NCU consists of 1 virtual CPU (vCPU) and 4 GBs of RAM and adequate temporary storage to run a particular application.

## NCU consumption of applications

Every time a user starts an application, a corresponding number of NCUs are checked out from the service. The following default values apply:

* Applications in teaching spaces consume a single NCU,
* Applications in research and dataset spaces consume 4 NCUs.

It is possible for space administrators to change the NCU consumption of applications. In research spaces, even instance editors can change the NCU settings of applications, to allow for seamless collaboration.

## NCU limits of a resource pool

Each [resource pool](resource-pools-and-budgets.md) is endowed with a certain number of NCUs available to be used consecutively. The information on NCU limits is available in the monitoring dashboard. There are three types of NCUs quoted, each differs in terms of time availability:

* **Round-the-clock** NCUs are available to use 24 hours a day, every day of the term of the Nuvolos subscription.
* **Power save** NCUs are available to use 12 hours a day, every day of the month during the academic year (thus power save NCUs are not available in the summer months).
* **Burst** NCUs are available to users 3 hours a day every workday during the academic year (thus, burst NCUs are not available in the summer months).

In practice, each NCU type corresponds to a certain amount of compute hour limit for the subscription term:

* **Round-the-clock** NCUs are available for 8760 hours a year.
* **Power save** NCUs are available for 3240 hours a year.
* **Burst** NCUs are available for 540 hours a year.

To calculate the total compute hours available to a resource pool for a year, the total amount of compute hours available to a resource pool is the sum product of resource pools and the above yearly rates.
