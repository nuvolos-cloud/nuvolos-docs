---
description: >-
  Use credit-based application sizes to run workloads with high computation
  needs.
---

# HPC spaces

## HPC integration

On Nuvolos, you can run interactive HPC workloads by changing the size of your application to have more compute power. If sizes included in your plan are not sufficient for your use case, you may consider using[ credit-based sizes](../../features/applications/application-resources.md).

For interactive HPC support, the space needs to have this feature enabled by the Space Administrator.  Once enabled, it provides the following privileges for users in the space:

* In research spaces, every Space Administrator and Instance Editor can change the size of an application. The Credit costs will be attributed to the resource pool associated with the space for credit usage.
* In teaching spaces, every Space Administrator can scale up anytime **in the Master instance**, and they can define [scheduled startup with GPU](../../user-guides/education-guides/configuring-student-applications.md#scheduled-startup-with-gpu) for the students. The Credit costs will be attributed to the resource pool associated with the space.

<figure><img src="../../.gitbook/assets/image (129).png" alt=""><figcaption><p>The resource mapping section shows that credit spedings (Credit-based services) in this space are attributed to the Alpharuncher - Demonstration resource pool </p></figcaption></figure>

## Enable credit-based application sizes

This can be enabled under the \[Course/Project/Dataset] Settings > \[Course/Project/Dataset] Configuration menu on the sidebar:

<figure><img src="../../.gitbook/assets/image (130).png" alt=""><figcaption><p>Course/Project/Dataset configuration menu location</p></figcaption></figure>

Once in the configuration menu, toggle the enable/disable button to enable scaling up to credit-based sizes.

<figure><img src="../../.gitbook/assets/image (131).png" alt=""><figcaption><p>The tile for enabling High Performance Computing in a space</p></figcaption></figure>

{% hint style="info" %}
&#x20;Please note that you cannot turn off access to credit-based sizes in self-service. Reach out to support if you need it disabled.
{% endhint %}
