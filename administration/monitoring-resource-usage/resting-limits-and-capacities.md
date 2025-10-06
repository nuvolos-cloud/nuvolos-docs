---
description: Monitoring your resting usage across your subscription
---

# Resting Limits and Capacities

## Resting capacity

Right below the Subscription tile, you will find the tile related to your [resting storage](../space-management/resting-spaces.md). It can have the following 3 states:

### Resting is disabled

<figure><img src="../../.gitbook/assets/image (9).png" alt=""><figcaption></figcaption></figure>

To enable resting, reach out to support

### Resting is enabled in pay-as-you-go mode

<figure><img src="../../.gitbook/assets/image (10).png" alt=""><figcaption></figcaption></figure>

In this case, the RP will be charged daily in credits for the storage footprint in resting.

### Resting is included in your subscription

<figure><img src="../../.gitbook/assets/image (8).png" alt=""><figcaption></figcaption></figure>

At renewals, you can choose to prepay for a certain resting capacity. In this case, usage is free of charge below the set limit, but overage will be charged daily in credits.

### Tracking Your Consumption

The resting capacity tile tracks the total resting storage footprint across all spaces mapped to this resource pool. This metric is updates once a day, and will increase on days when some space(s) are put to rest. Conversely,  when you wake up a space, data is moved from resting storage back to the Nuvolos file system, which decreases the resting storage footprint.&#x20;

Resource pool managers can click the Details button at the bottom right of the tile to understand how their utilization was generated over time. The button takes you to the Plan Utilization tab, with the date range selector set to the same interval as the current File system limit.

## Resting limits

Resting limits are storage limits imposed on your total resting storage in the resource pool. You can use resting in a pure pay-as-you-go model or prepay for a certain resting storage for your subscription.

Resting limits are defined by the following information:

* Resting limit (capacity) - the storage amount allocated for a specific period in your subscription. In case you're using pay-as-you-go, your storage footprint will be displayed instead.&#x20;
* Resting Limit Term Start - the start date when the resting limit takes effect. This is the date of the start of your contract or the date of your last renewal.
* Resting Limit Term End - the end date when the resting limit expires. This is the end date of your subscription period.

### Exhausting your resting capacity

Once the resting limit in your subscription has been exhausted, the resource pool will start incurring daily credit deductions. Every day, the excess storage above the RP's limit will be charged to the resource pool in credits, as in pay-as-you-go mode. You can review the cost of resting storage on the [prices](https://app.nuvolos.cloud/service-prices) page.

<figure><img src="../../.gitbook/assets/image (11).png" alt="" width="362"><figcaption></figcaption></figure>

To avoid such overage costs, you can delete old unneeded spaces.
