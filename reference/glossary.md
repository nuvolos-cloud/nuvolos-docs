# Glossary

### Identity provider

An identity provider (IdP) is a service that verifies online identities for 3rd party applications. For example, among many other things, Google is an identity provider - you can access many different websites not operated by Google only by logging in to your Google account. Many institutions, companies and universities also run their own IdP services for validating user identity.

Nuvolos is integrated with support for the following identity providers:

* Nuvolos (an IdP managed by Nuvolos)
* Google
* Institutions in the [eduGAIN ](https://edugain.org/)network

When you sign up to Nuvolos, you identify yourself via one of the above IdPs. For any subsequent login, you must use the same IdP to access your Nuvolos account.

### Credits

Credits (formerly Alphacruncher Credits) are units of measure for additional on-demand resources and professional services outside those provided within the Nuvolos subscription itself. They can be purchased at any time provided you have a Nuvolos subscription. More information can be found in our page on the [Nuvolos pricing structure](../pricing-and-billing/pricing-structure.md).

### Distribution

In this documentation, distribution refers to the dedicated functionality in Nuvolos for sharing Nuvolos artefacts, i.e. code, data, files, applications, and so forth. This is done by a push operation to stage objects and then to send them to other instances, spaces, or organisations. View our [conceptual intro on distribution](../features/nuvolos-basic-concepts/distribution.md) for a summary, or detailed information in our [feature explanation for distribution](../features/object-distribution/).

### GPU computing

GPU stands for Graphics Processing Unit. In essence, it is the separate processor controlling and coordinating image processing. Because they rely on parallel operations, GPUs can be better than regular processors at certain high-end algorithmic tasks involving stream processing of large amounts of data. Nuvolos supports the use of state-of-the-art general purpose GPU computing for this purpose as an additional service purchasable with [Credits](glossary.md#credits). Details can be found in our [user guide for GPU computation](../user-guides/research-guides/gpu-computation.md).

### HPC

HPC is short for High Performance Computing, i.e. the use of high-end computer clusters to solve complex computational challenges. Nuvolos supports interactive HPC use cases through allocating a dedicated node, allowing for scaling to even greater levels of compute power than in the normal Nuvolos use cases. HPC needs are paid for with [Credits](glossary.md#credits). Details can be found at [application resources](../features/applications/application-resources.md).

### Instance

[organisational hierarchy](../features/nuvolos-basic-concepts/organisational-hierarchy.md). In terms of the workflow, they represent branches or immediate working environments of a project. Any project space can have many instances to experiment, try out different data sources or application configurations, and so forth. Two instances are always present: the master instance - which can be thought of as the source of truth about the project - and [the distributed instance](../features/object-distribution/the-distributed-instance.md).

### NCUs

NCUs stand for Nuvolos Compute Units. They are the unit of measurement of regular [applications](../features/nuvolos-basic-concepts/applications.md) and the unit of account used to define the [Nuvolos subscription](../pricing-and-billing/pricing-structure.md). For more information, refer to our [page on NCUs](../pricing-and-billing/nuvolos-compute-units-ncus.md).

### Organisation

In Nuvolos, the organisation is the highest level of the [organisational hierarchy](../getting-started/nuvolos-basic-concepts/organisational-hierarchy.md). It represents the basic organisational unit through which a user interacts with our product, and is primarily used for access control purposes.

### Space

In the Nuvolos [organisational hierarchy](../features/nuvolos-basic-concepts/organisational-hierarchy.md), spaces are the intermediate level. In terms of the practical workflow, each space corresponds more or less to a project. Access control and budgeting can be applied at space level.

### Staging

In the Nuvolos architecture, 'staging' refers to the temporary area where you assign objects for distribution. Each source has its own staging area, so to distribute from multiple sources to the same target, you must distribute multiple times. Refer to [this guide](../features/object-distribution/#distributing-a-selected-list-of-items-a-worked-example) for details.
