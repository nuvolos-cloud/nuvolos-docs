# Monitoring resource usage

We strongly suggest reading the [billing overview](broken-reference) before reading this page as there are some critical concepts to get familiar with.

Resource monitoring is possible to a varying extent for all users. The view provided by the monitoring interface depends on your [roles](../roles/) related to the resource pool you are viewing.

* All users are capable of seeing a minimal overview and the credit usage of the resource pool if any of the following applies to them:
  * they are the managers of the resource pool
  * they have instance editor/space administrator role in a space belonging to the resource pool
* Resource pool managers can review activity in the resource pool they are managers in, and they can drill down to review usage all the way until the space level.
* Space administrators can review activity in the space they are administrating.

## The monitoring dashboard

The usage monitoring dashboard is available in the user menu for all users in the top right corner of the screen, under the **Resources** menu:

<figure><img src="../../.gitbook/assets/image (2).png" alt=""><figcaption></figcaption></figure>

## General usage

#### Drilling down

Drilling down to sub-levels is possible in the plan and credit utilisation tab. The first and default level is the resource pool level. The next level is the organisation level and lastly, the space level.

* The resource pool level selector contains all the resource pools the user has sufficient roles to view.
* The organisation level contains all the organisations linked directly to the resource pool, or organisations that contain a space that is linked to the resource pool. Resource pool managers will see all the organisations that match the description, however, other users will see a filtered result here, where only those organisations will be available which have spaces, where the user is a space administrator or editor in an instance within the space.
* The space level contains all the spaces in the selected organisation that are linked to the selected resource pool. Resource pool managers will see all these spaces, while other users will only be able to select spaces where they are space administrators or instance editors in an instance within the space.

#### Privacy considerations and redaction

Nuvolos implements a strict privacy policy when it comes to monitoring usage. Users have the ability to monitor resource consumption, but only the absolutely necessary identifying information is displayed. Due to this, certain object names are redacted on the monitoring dashboard. The following section clarifies how redaction is applied in different places.

**Drill-down menu**

* Resource pool and organisation names will not be redacted for any users
* Space names
* Please note, that for privacy purposes we only show the user the name of the space if they are either space administrators or have an editor instance role in one of the instances of the space. Every other space shows up with a numerical identifier. Usage may still be viewed, but the content of the space will not be visible to the user.

**Plan and credit utilization tabs**

The donut charts on the plan and credit utilisation tabs show the distribution of resources within the sub-level of the current level. At different levels, users might encounter some redacted names:

* Resource pool level:
  * No redaction
* Organization level:
  * Any space will be redacted where the user does not have a space administrator or instance editor role
* Space level:
  * NCU and credit utilisation charts drill down to user level (the charts show email addresses):
    * Resource pool managers will not have any redaction
    * Space administrators will not have any redaction
    * Instance editors will have every email redacted that is not their own
  * Filesystem utilisation drill down to instance level
    * Resource pool managers will have every instance name redacted unless they are also a space administrator in the space or have an editor role in the given instance
    * Space administrators will not have any redaction
    * Instance editors will have every instance redacted where they are not instance editors

#### Time range

The time window of the report by default is the current month, however, it is possible to choose different time windows (the length of the window is always a maximum of 1 year).

{% hint style="info" %}
The time range is shown on the plan or credit utilisation tabs only, as the overview is time range independent.
{% endhint %}

#### Enabling services

Resource pool managers can enable additional services on the overview page.

## Structure

### Overview

<figure><img src="../../.gitbook/assets/image (4).png" alt=""><figcaption></figcaption></figure>

The overview page provides an overview of the resource pool. The top tiles show high-level information:

* term of the subscription
* [NCU usage and capacity](ncu-limits-and-capacities.md) of the current contracted period.&#x20;
* [File system usage and capacity](file-system-limits-and-capacities.md) of the current contracted period.
* credit balance
* [Resting usage and capacity](resting-limits-and-capacities.md) of the current contracted period.

Below that, additional services like [database access](../../features/database-integration/), [credit-based sizes](../space-management/hpc-spaces.md#hpc-integration) and [video library](../../features/video-library.md) can be enabled by resource pool managers, if their subscription allows for it.

At the bottom, [Large File Storage](../../features/file-system-and-storage/large-file-storage.md) drives can be managed.

### Plan utilization view

<figure><img src="../../.gitbook/assets/image (57).png" alt=""><figcaption></figcaption></figure>

The plan utilization view is only available for users that are resource pool managers at the resource pool.

Currently, the monitoring dashboard provides metrics on the following resource groups:

* NCU overview - metrics on standard Nuvolos application runs
* Storage utilization - metrics on filesystem and resting usage on Nuvolos
* User activity overview - metrics on user activity on Nuvolos

#### NCU overview

The NCU overview shows a line and a donut chart for the NCU usage for the selected time range on the current drill-down level.

The NCU timeline shows a daily, weekly, or monthly grouped sum of the NCU hours used in the current drill-down level for the time range selected, and the donut chart shows the sum of the NCU hours for the sub-levels. The sub-levels are the following: Organizations for resource pool level, spaces for organization level, and users (email addresses) for space level.

#### Filesystem utilization&#x20;

The filesystem utilization report consists of two charts, a timeline, and a donut chart. The timeline shows the filesystem utilization in GiBs grouped daily, weekly or monthly for the given time range.

The timeline also shows with an orange line the total storage included in your subscription called the **Subscription limit**. Every day, you storage footprint is compared against the Subscription limit. If your storage footprint is higher than the limit, a overage cost will be credited to your resource pool on a daily basis, until the overage persists.

If the grouping is weekly or monthly, the chart shows the filesystem utilization for the date shown when hovering over a bar. The donut chart on the right shows the filesystem utilization by sub-level for the last date selected in the time range. The sub-levels are the following: Organizations for resource pool level, spaces for organization level, and instances for space level.

{% hint style="info" %}
Please note that the filesystem utilisation reports are only available from 25/07/2022.
{% endhint %}

#### Resting storage utilization

The resting storage report has the same structure as the filesystem utilisation. Resting storage can also have a Subscription limit, in case you pre-payed for resting storage. If you're using a pure pay-as-you-go model, your Subscription limit will be 0 and credits for your resting storage footprint will be deducted daily.

{% hint style="info" %}
Please note that the resting utilization reports are only available from 10/01/2025.
{% endhint %}

#### User activity overview

The user reports section provides a timeline for application runs. The timeline could be daily, weekly, or monthly depending on the time range selected.

### Credit utilization view

<figure><img src="../../.gitbook/assets/image (58).png" alt=""><figcaption></figcaption></figure>

The credit utilization view is available for everyone who has access to a resource pool, however, what items are redacted or not is based on the user's role as described here.

Currently, the monitoring dashboard provides three different charts for credit utilization .

* **Credit utilization by resources:** This chart details the total credit utilization grouped by resource groups for the chosen time range. You can deselect resource groups by clicking on the resource icon on the left, or under the chart. Deselecting a resource will also remove it from the credit utilization by sub-levels chart.
* **Credit utilization by sub-levels:** This chart details the total credit utilization grouped by sublevels for the chosen time range. This is the following for the different levels: organizations for resource pool level, spaces for organization level, and users for space level. At each level, there may be credit usage that cannot be mapped to sub-levels, these will show up as orgless, spaceless, and userless transactions. You can deselect items from the sub-level, or a resource group by clicking on the resource icon on the left.
* **Credit utilization timeline:** This chart details the credit utilization for the selected time range grouped daily, weekly, or monthly depending on the chosen time range. The colours in the bars correspond to the resource group.

### Inventory view

The inventory view is only available for users that are **resource pool managers** at the resource pool. It provides a detailed table view of all orgs/spaces associated with the resource pool, in an exportable format:

<figure><img src="../../.gitbook/assets/image (142).png" alt=""><figcaption><p>The inventory view of the resource monitoring dashboard</p></figcaption></figure>

#### Generate CSV reports

You can export what you see in the inventory view to CSV for further analysis. Use the **Columns** button to control what information is shown on the screen about the orgs/spaces. Click the **Export to CSV** button to download the displayed information in CSV format.

{% hint style="info" %}
The **Export to CSV** functionality exports **all pages** with **all the columns shown** in the view.
{% endhint %}

#### Find spaces with custom filters

You can leverage built-in filters like **Orphaned**, **Archived**, etc. to filter the list of spaces according to the most common use cases. You can export the filtered list as well to CSV.

#### Identify overusing spaces and notify admins

You can sort spaces in the inventory based on their storage footprint, in descending order. If you click on any of the rows, it'll expand and show the name and email of spaces administrators. You can thus contact the administrators of spaces with large storage footprint to discuss storage optimization.

#### Free up space by removing orphan spaces

Resource pool managers cannot directly delete objects in an org/space to free up resources, this needs to be managed by space admins. The only exceptions are spaces with no administrators, also called 'orphan' spaces. Such spaces are generated when personnel leaves an organization, and they do not invite anyone to inherit their spaces. Orphan spaces can be deleted by space administrators to free up the storage they consume.&#x20;

#### Modify instance quota

Space administrators can [increase their space quota](../../features/file-system-and-storage/#increase-quota) in self-service, with some constraints to avoid runaway costs. Resource pool managers have a larger degree of freedom in changing the quota, as they have the complete overview for the resource pool.

First, select an organization to work with in the inventory view.

<figure><img src="../../.gitbook/assets/image (50).png" alt=""><figcaption><p>View to modify space quota</p></figcaption></figure>

You can see each space's current quota by enabling it in the columns dropdown.

<figure><img src="../../.gitbook/assets/image (49).png" alt=""><figcaption><p>Viewing Instance quota</p></figcaption></figure>

Under the 'Actions' column, you can modify each space's filesystem quota. As explained, it means setting the instance quota of every instance to this new value.

The system has a cap on the space quota that RP managers can set in their spaces, which should be enough for almost all use cases. If you have business justification to further increase the quota as the system allows, please reach out to support to have your case reviewed.

<figure><img src="../../.gitbook/assets/image (52).png" alt=""><figcaption><p>Modify space quota modal in Gigabytes</p></figcaption></figure>

You need to confirm the changes.

<figure><img src="../../.gitbook/assets/image (53).png" alt=""><figcaption><p>Confirm the modifications</p></figcaption></figure>

The operation will update the quota of all instances inside the space in the background, which can take a couple of seconds depending on the number of instances in the space.

<figure><img src="../../.gitbook/assets/image (47).png" alt=""><figcaption><p>All went good</p></figcaption></figure>

After 2 seconds, the window will automatically close and you will see the updated quota in the list.

<figure><img src="../../.gitbook/assets/image (48).png" alt=""><figcaption><p>See the updated quota under Instance quota in the list</p></figcaption></figure>

