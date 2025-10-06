---
description: >-
  Monitoring your NCU usage and ensuring you get the most value out of your
  subscription
---

# NCU Limits and Capacities

## NCU capacity

The leftmost tile in the resource monitoring dashboard shows details about your current NCU capacity.

<figure><img src="../../.gitbook/assets/image (5).png" alt=""><figcaption></figcaption></figure>

## NCU Limits

NCU Limits are pre-defined usage limits for ["Included" size](../../features/applications/application-resources.md#size-and-price-of-an-application) runs of Nuvolos applications. Every Nuvolos subscription comes with a total NCU limit that can be divided between the resource pools of the subscription.&#x20;

Setting NCU Limits can be an efficient way of managing a Resource Pool's (or project) costs. NCU Limits are defined by the following information:

* NCU Limit (Capacity) - the number of NCU hours allocated for a specific period. Every time an application with an "Included" size [mapped to this resource pool](../../pricing-and-billing/resource-pools-and-budgets.md#mapping-a-space-during-space-lifetime) is run, it's using up from this capacity. For example, if you run an application with 2 CU size for 3 hours, that consumes  6 NCU hours.&#x20;
* NCU Limit Term Start - the start date when the NCU Limit takes effect. This is the date of the start of your contract or the date of your last renewal.
* NCU Limit Term End - the end date when the NCU hours allocated expires. This is the end date of your subscription period.

### Tracking Your Consumption

The NCU Capacity tile tracks the total consumption of all the [application sessions](../../features/applications/sessions/) set to an "Included" size configuration. The progress bar shows a quick view of how much you have currently used **since the start of the NCU Limit** configured.

Resource pool managers can click the Details button at the bottom right of the tile to understand how their utilization was generated over time. The button takes you to the Plan Utilization tab, with the date range selector set to the same interval as the current NCU Limit.

### Exhausting your NCU Capacity

Once the **limit is reached** or the NCU Limit has expire&#x64;**,** "Included" size application session&#x73;**:**

* will be allowed to start, and
* running sessions will not be terminated,

as long as you still have a positive credit balance.

<figure><img src="../../.gitbook/assets/image (17).png" alt=""><figcaption></figcaption></figure>

If your resource pool has overused its NCU capacity, you have the following options to continue using Included sizes:

* you can talk to an Account Manager and purchase more NCU capacity for your subscription.
* you can use credits to pay for the excess amount of NCU hours. Note that you need to have a positive credit balance to start Included-size applications, otherwise the system will not allow starting them if you are in overage. You can review the cost of excess utilization on the [prices](https://app.nuvolos.cloud/service-prices) page.

{% hint style="info" %}
Summary

* NCU hours consumption is **applicable only for "Included" size configurations**.
* NCU capacity consumption is dependent on the configuration of session:
  * Size (e.g. 4 CU, 16 CU etc.) plus,
  * Add-ons (e.g. Redis, Postgresql etc.).
* Credits will be used upon exhaustion of NCU Capacity.
{% endhint %}

You can track the amount of credits deducted due to NCU overage on the [Credit Utilization](./#credit-utilization-view) tab.&#x20;

### Resource pools without NCU limits

Resource pools are allowed not to have an NCU limit configured - however, in that case, only applications with credit-based sizes are allowed to run there:

<figure><img src="../../.gitbook/assets/image (46).png" alt="" width="563"><figcaption><p>The dashboard tile displayed when a Resource Pool has no applicable NCU Limit.</p></figcaption></figure>

