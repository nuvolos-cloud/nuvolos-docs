# Pricing structure

## Executive summary

The Nuvolos platform natively provides compute resources as well as configurable tools for computational research and educational use cases, as well as for combinations of both.

The pricing structure of Nuvolos consists of two parts: the Nuvolos subscription and on-demand resources. The [Nuvolos subscription](pricing-structure.md#the-nuvolos-subscription) is based on your contract with us and runs on an annual basis (different terms are possible on agreement). The on-demand resources are additional resources that can be purchased with Credits on top of those provided for by the Nuvolos subscription. It is possible to have a Nuvolos subscription without Credits, but you cannot spend Credits on Nuvolos without a subscription. Resources include compute capability as well as storage (see [below](pricing-structure.md#storage)).

With a Nuvolos subscription, you can have one or more [resource pools](pricing-structure.md#resource-pools), which are logical groups of resources. They can be either [shared](pricing-structure.md#shared-resource-pool) or [dedicated](pricing-structure.md#dedicated-resource-pool). In this overview, we will briefly explain each of these concepts in more detail.

## The Nuvolos subscription

A subscription to Nuvolos is based on a yearly contract signed between you and the company that develops Nuvolos, ALPHACRUNCHER AG (or ALPHACRUNCHER Inc.). The subscription is specific to your particular use case and requirements; there are no fixed tiers or plans for Nuvolos subscriptions. Instead, you convey us your particular use case and rough number of users, and we determine based on that use case the estimated annual seats and resources you will need and provide these to you.&#x20;

The base subscription consists of the following parts for a given subscription period:

* access,
* compute allocation,
* storage allocation.

The cost of the Nuvolos subscription is in turn based on the number of seats associated to the access component and the quantity of compute and storage resources allocated on an annual basis. The size of the resource components and the access component are not linked. In this way, what you pay is always custom-tailored to the resource needs you actually have, preventing the problem of overpayment for underutilized plans or tiers typical of SaaS offerings.

In general terms, a subscription allocates to the subscriber a certain number of seats (we distinguish full-time and part-time users), a certain number of compute units or [CUs](pricing-structure.md#ncus-and-scaling), and a certain amount of high-performance storage capacity.&#x20;

Seats limit concurrent active user access to the platform - we monitor compliance with the agreement by looking at average concurrent utilisation rates. \
\
The compute units (CUs) can be spent on _concurrent_ usage of applications (i.e., tools such as Airflow, VSCode, Spyder, etc.) up to the maximum total amount that is allocated to you based on your subscription. The unit of measurement is compute unit hours (CUhours) and your agreement states a term total. Note that the subscription's resource allocation is always for an _average_ usage over the year: to allow for the flexibility necessary for research, your subscription allows for short-term fluctuations in usage in excess of the allocated CUs.

## Credits

Besides the general Nuvolos subscription, you can also purchase Credits. These are units of measure for on-demand resources. They allow access to additional CUs, as well as special allocations such as dedicated resource pools, special kinds of storage, and professional services.&#x20;

Credits can be bought at the rate of 8 Euros or 9 USD per Credit. They can be purchased at any time as long as you have a Nuvolos subscription. Any unused Credits will roll over to be available for the next year provided you renew your Nuvolos subscription. Credits cannot be acquired or used independently of a Nuvolos subscription.

Credits can be applied to any resources that can be obtained using Microsoft Azure cloud services, including specific compute needs, graphic cards, storage types, and so forth.

## Application resource accounting

Each application on Nuvolos has a [size](../features/applications/application-resources.md#size-and-price-of-an-application), which determines both how many resources it uses _and_ how the costs of these resources are covered. Each size belongs to one of the following categories:

* Sizes included in plan ("Included")
* Credit-based sizes purchasable with credits ("Credit")

Whenever you run an application at a size that is included in your plan, the resource usage is recorded in [CUs](nuvolos-compute-units-ncus.md). This resource usage is regularly compared against your subscription limits (as described [above](pricing-structure.md#the-nuvolos-subscription)).\
Also, sizes included in the plan do **not** come with resource guarantees. An application with 4 CU can use up to 4 vCPU and 16 GB RAM of a larger machine. Based on the load generated by other platform users, it might only be able to utilize less resources at peak load.\
You can set how many CUs an application will have available as resources by changing the [application size](../features/applications/application-resources.md) yourself. Self-service changes within the platform are possible between 1 and 16 CUs.

By contrast, if you run an app at a credit-based size, the application's resource pool will be charged in Credits according to its price. Credit-based sizes need to be [enabled by a space administrator](../administration/space-management/hpc-spaces.md#hpc-integration) in each space.&#x20;

Credit charges start when the application is started and stop when the application is stopped, either due to [inactivity](../features/applications/long-running-applications.md#automatic-stopping-due-to-inactivity), shortage of credits or the end user's action to stop the app. During runtime, credit charges are accounted every 15 seconds.

Credit-based sizes run on dedicated compute nodes, so here CPU and RAM resources are guaranteed to be exclusively available for the application, regardless of other platform users.&#x20;

## Resource pools

There are two types of resource pools: shared resource pools and dedicated resource pools. The standard Nuvolos subscription provides for NCUs out of a shared resource pool.

### Shared resource pool

In the shared resource pool, all applications you run will draw from the same resource allocation, i.e. from your general allocation of NCUs. A shared resource pool is essentially nothing other than a certain amount of vCPU and RAM that is configured identically and dedicated to running all applications you choose to run.

### Dedicated resource pool

It is also possible to draw from a dedicated resource pool. This is a resource pool configured specifically to optimise for one particular application, and only one application will draw on it at a time. This is useful in case you need a particularly heavy or unusual compute usage for a particular application (say, a High Performance Computing use case).&#x20;

Applications on dedicated resource pools can scale between 8 vCPUs/32GB RAM and 120 vCPUs/456GB RAM. As with shared resource pools, you can scale yourself as needed using the Nuvolos platform.

Unlike the regular NCU allocation out of a shared resource pool, usage of a dedicated resource pool requires purchasing additional Credits corresponding to the intended usage.

## Storage

By default, the Nuvolos subscription includes sufficient storage for your use case. The storage provision is based on our high performance file system, backed up by Snowflake as our database provider.&#x20;

Specific storage needs, such as SQL-compliant table storage and large file storage for unusually large volumes of unstructured data, can be purchased as additional services using Credits.

## Cost control

Cost control can be exercised in various ways.&#x20;

Firstly, self-service scaling of resources combined with the ability to allocate budgets of resources or resource types gives you substantial flexibility as to how and when you use the resources available to you.

Secondly, for academic institutional use cases, NCU availability is tailored to the academic year. This means NCUs allocated to you will be available for a certain amount of hours within the academic year, excluding the summer holiday period. This in turn lowers the cost of the subscription, ensuring you do not pay for resource availability during a period when the resources are likely to go unused. For details on time constraints on NCU availability, refer to our documentation on [NCU architecture](nuvolos-compute-units-ncus.md).
