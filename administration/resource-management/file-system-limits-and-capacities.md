---
description: Monitoring your filesystem usage across your subscription
---

# File system Limits and Capacities

## File system capacity

The center tile in the resource monitoring dashboard shows details about your current file system capacity.

<figure><img src="../../.gitbook/assets/image (6).png" alt=""><figcaption></figcaption></figure>

## File system limits

File system limits are storage limits imposed on your total [Nuvolos file system](../../features/file-system-and-storage/#filesystems-on-nuvolos) (NFS) storage. Every Nuvolos subscription comes with a total NFS limit that can be divided between the resource pools of the subscription.&#x20;

Setting file system limits can be an efficient way of managing a Resource Pool's (or project) costs. file system limits are defined by the following information:

* File system limit (capacity) - the storage amount allocated for a specific period. The system aggregates daily the total storage footprint across all spaces mapped to this resource pool.&#x20;
* NFS Limit Term Start - the start date when the NFS limit takes effect. This is the date of the start of your contract or the date of your last renewal.
* NFS Limit Term End - the end date when the NFS limit expires. This is the end date of your subscription period.

### Tracking Your Consumption

The file system capacity tile tracks the total storage footprint across all spaces mapped to this resource pool. This metric is updates once a day, and will increase if your total footprint grows, and can also decrease if your total footprint shrinks. One simple way to decrease your storage footprint is to use the [resting feature](../space-management/resting-spaces.md).

Resource pool managers can click the Details button at the bottom right of the tile to understand how their utilization was generated over time. The button takes you to the Plan Utilization tab, with the date range selector set to the same interval as the current File system limit.

### Exhausting your file system capacity

Once the file system limit has been exhausted, the resource pool will start incurring daily credit deductions. Every day, the excess storage above the RP's limit will be charged to the resource pool in credits. You can review the cost of excess storage on the [prices](https://app.nuvolos.cloud/service-prices) page.

<figure><img src="../../.gitbook/assets/image (7).png" alt="" width="355"><figcaption></figcaption></figure>

To avoid such overage costs, you can&#x20;

1. Free up storage space in the space(s) under the resource pool.
   1. Resource pool managers can use the [resources dashboard](./#filesystem-utilization) to identify which spaces contribute the most to the storage footprint, and notify the space admins of the offending spaces in email.
   2. Space admins can use the [quota usage](../../features/file-system-and-storage/#quota-usage) tool to identify where the bulk of the storage comes from within their space(s).
2. [Enable resting](../space-management/resting-spaces.md) for one or more organizations.

### Resource pools without file system limits

Resource pools are allowed not to have a NFS limit configured - this is typical for budget-type resource pools which primarily host credits for a well-defined purpose. Note that in this case, [plan-based services should not be mapped](../../pricing-and-billing/resource-pools-and-budgets.md#mapping-spaces-to-resource-pools) to this resource pool.
