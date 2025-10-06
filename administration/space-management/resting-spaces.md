# Resting spaces

Usually, during the lifecycle of a space, there are periods where data in the space is not accessed at all. However, the data might be still relevant later and should be kept on Nuvolos.&#x20;

The resting feature enables users of the platform to optimize their storage footprint. Data that is not needed for a longer period of time can be moved to more affordable storage, and can be loaded back to the performant Nuvolos Filesystem with one click, to resume work on it.

## Resting states

Regarding this feature, a space is in one of the following states at any given time:

* **Awake**: The 'normal' state, where files are stored on the Nuvolos Filesystem
* **Pre-resting**: When the space fulfills all criteria to be rested in the next 24 hours, preparations are made for the transition. Data files are still accessible on the Nuvolos Filesystem. _**You can stop the transition to the next phase by starting any applications in the space.**_
* **Resting**: The transitory state when the space goes from pre-resting into rested state. During this short (few minutes) period, no action is allowed in the space.
* **Rested**: The state where data files have already been moved to more affordable resting storage. They can be downloaded or distributed, but you cannot access them via Nuvolos applications.
* **Waking**: The transitory state when data is moved back from resting storage to the Nuvolos Filesystem. No action is allowed in the space in this state, which can last from a couple of minutes to hours, depending on the total stored data in the space.

## Finding rested spaces

By default, your rested spaces are not shown in the navigation panel. You need to use the toggle to show them:

<figure><img src="../../.gitbook/assets/image (27).png" alt=""><figcaption><p>Use the toggle to show rested spaces</p></figcaption></figure>

## Rested snapshots

During pre-resting state, special snapshots of type 'rested' are created. Data in these snapshots are stored on a more affordable storage backend than the Nuvolos Filesystem, yet they are also isolated from regular backups. Once the state enters rested state, data in the space is only present in regular or rested snapshots. You can check the size of rested snapshots in the snapshots view of an instance.

## Resuming work in a rested state

To resume work in your rested state, you need to trigger the transfer of data files from resting storage to the Nuvolos Filesystem, also called as the wake up process. This can be done by 2 ways:

1.  Use the **wake up** button in the blue banner at the top:\


    <figure><img src="../../.gitbook/assets/Screenshot 2025-01-22 153310.png" alt=""><figcaption><p>Wake up the space with the dedicated button</p></figcaption></figure>

    \
    You'll receive an email once the space has woken up, and is ready for use.\

2.  Start **any application** in the **Current State** of one of the instances in the space:\


    <figure><img src="../../.gitbook/assets/image (145).png" alt=""><figcaption><p>Wake up space by starting an application</p></figcaption></figure>

    \
    You'll receive and email once the space has woken up, and the application start has been initiated. It can still take some more time until the application becomes online, like in the case of any application start.

{% hint style="info" %}
Depending on the total stored data in the space, waking up can take from a couple of minutes to a few hours. The size of the rested snapshot(s) will give you an indication if the process is expected to be fast or slow.
{% endhint %}

## Configuration

The resting feature currently support only organization-level configuration, and thus can only be managed by organization managers. **Organization managers** can reach out to Nuvolos support to enable the feature and configure the following parameters:

* **Eligible spaces**: Every space in the organization, or a list of spaces
* **Activity threshold**: Every eligible space is evaluated once every day for an activity trigger. The activity trigger is based on application activity - if the time elapsed since the last application start in any instances of the space exceeds the activity threshold, the space enters into pre-resting state. The activity threshold is recommended to be set somewhere between 1 year and 30 days, based on observed usage data.

## Monitoring resting storage

Resource pool managers can monitor resting storage consumption in the [resources dashboard](../monitoring-resource-usage/resting-limits-and-capacities.md).

## Pricing

The resting feature is available both as a subscription component (pre-payed resting storage) or as a pay-as-you-go service (pay with credits for as much as you use). Reach out to support to inquire pricing for both models.
