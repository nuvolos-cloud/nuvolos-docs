---
description: >-
  You can provide GPU-enabled machines for your students to practice GPU
  programming in your Nuvolos course.
---

# Courses with GPUs

Nuvolos supports 2 workflows for courses with GPUs: the first approach is **GPU Lab Sessions** and the second is **On-Demand GPU Courses**.

{% hint style="info" %}
You need [credits](../../pricing-and-billing/pricing-structure.md#credits) to use this feature.
{% endhint %}

## Enable GPUs in your course

1. Make sure you have enough credits in the resource pool [mapped to the space](../../pricing-and-billing/resource-pools-and-budgets.md#resource-pool-mappings).
2. Make sure you have [enabled credit-based sizes](../../administration/space-management/hpc-spaces.md#enable-credit-based-application-sizes) in your teaching space.

Now you can decide which flow to use in your course.

## GPU Lab Sessions

GPU Lab Sessions are exactly what their name implies: your students can use GPU-enabled machines to practice GPU programming **during planned sessions.** The experience is like having a virtual lab, where e.g. each student of course GPU101 can use a remote machine with a Tesla T4 card between 10:00-12:00 Mondays, for 8 weeks.

Such GPU Lab Sessions have the following properties that make them appealing:

1. Easy to explain to students
2. Equal opportunity for all students to use machines with the exact same specifications in the exact same time windows
3. All students start with the exact same environment (JupyterLab, VSCode, etc.), but they can make persistent changes to the installed packages and settings.
4. Ideal for exams or courses where access is only needed during specific time windows
5. Predictable, flat pricing. Once you know all the times and durations of all lab sessions, your total cost is fixed.

In this workflow, every space administrator can launch GPU-enabled machines **in the Master instance anytime**. This way, instructors can easily work on the course material right in the course space. Students however cannot start GPU-enabled machines themselves: instructors need to define lab sessions for them. This means, students only need to sign in to Nuvolos when the lab session starts, and they'll find an already running, GPU-enabled Nuvolos application.

### Schedule a GPU Lab Sessions

You can schedule a lab session using the [Schedule for startup](configuring-student-applications.md#scheduled-startup-of-student-applications) feature. For that, you need to have an application that you have [already distributed](../../features/nuvolos-basic-concepts/distribution.md) to all course participants.

To schedule a session on machines with GPU:

1. Make sure you have distributed the application for all students in the space
2. Click the [Schedule for startup](configuring-student-applications.md#scheduled-startup-of-student-applications) button
3. Turn on the **Scale resources** toggle and select the GPU size and configure the **Stop after selected minutes** field.

<figure><img src="../../.gitbook/assets/image (128).png" alt=""><figcaption><p>Teaching spaces with credit-based sizes can prestart applications on machines with GPU</p></figcaption></figure>

{% hint style="info" %}
Since machines with GPU consume credits to run, scheduled startups with GPUs need to define the length of each session in minutes. After the set amount of minutes relative to the prestart schedule, every machine with GPU is automatically shut down in the space (including the machine(s) of the instructor(s)). \
\
Example: if the scheduled start is at 10:05 and stop after selected minutes is 120 minutes, all prestarted apps (including the instructors app) will be shut down at 12:05.
{% endhint %}

#### Limitations of GPU Lab Sessions

* In teaching spaces, only smaller GPUs are enabled, like the Testa T4 and ⅙ A10. Check the Schedule for start menu for current offers in sizes.
* Currently up to 90 concurrent students are supported only. Please reach out to support to clear GPU sizes/attendant lists larger than this.
* Stop after selected minutes can only be set between 30 and 360 minutes.
* The total cost of a session with N students will be around N\*\[session length in hours]\*\[hourly price of GPU machine] + warmup premium, where the warmup premium means that applications are started 30-10 minutes ahead of time to allow for longer machine provisioning times due to higher machine checkout frequency around course start time.
* Scheduled startups using GPU machines will not consider past user activity and will start up a GPU machine for every user in the course space.
* Any running applications started by students will be restarted at the scheduled startup time and moved to GPU machines automatically.&#x20;

## On-demand GPU courses

{% hint style="info" %}
This workflow is currently in preview. Reach out to support to request access.
{% endhint %}

The other available workflow is the On-demand GPU course approach. As the name implies, in this case students can start up GPU-enabled machines **on demand, and not according to a fixed schedule**. This has the following nice properties:

1. More flexible as GPU Lab Sessions: students can decide when they want to use the machines.
2. Equal opportunity for all students to use machines with the exact same specifications for exactly the same total runtime
3. All students start with the exact same environment (JupyterLab, VSCode, etc.), but they can make persistent changes to the installed packages and settings.
4. Ideal for assignments or courses where students are expected to practice outside course hours.
5. Predictable, capped pricing. You define at most how much credits your students are allowed to spend. This gives a predicable cap on your expenses.

### Configure On-demand GPU access

In this workflow, every space administrator can launch GPU-enabled machines **in the Master instance anytime**. This way, instructors can easily work on the course material right in the course space. Students can also start GPU-enabled machines themselves, provided they have not reached their spending limit.

#### Fixed credit limit schedule

To use on-demand GPU access, you can define a **fixed credit limit schedule** like the following:

| Credit limit | End date   | Counter reset |
| ------------ | ---------- | ------------- |
| 1.2          | 2025-09-15 | Yes           |
| 1.2          | 2025-09-22 | Yes           |
| 0.6          | 2025-09-29 | Yes           |

In the above example, every students instance (may it be [individual ](../../administration/space-management/invite-to-a-space.md#to-invite-new-students)or [group](setting-up-group-projects/)) can&#x20;

1. consume up to 1.2 credits from the creation of the space until 2025-09-15 EOD
2. consume up to 1.2 credits more from 2025-09-16 to 2025-09-22 EOD
3. consume up to 0.6 credits more from 2025-09-23 to 2025-09-29 EOD
4. from 2025-09-30, students cannot start GPU-enabled sizes anymore

{% hint style="info" %}
End-of-day (EOD) means 23:59:59 in UTC time zone
{% endhint %}

This means, every student instance can consume **at most 3 credits** until 2025-09-29. The actual usage will be typically less because

* in case an instance has 0 credit usage until 2025-09-16, then it may only consume up to 1.8 credits. This is because counter reset is true for all rows, meaning that consumption is reset to 0 on these dates, and a new period begins.

{% hint style="info" %}
Counter reset also stops any running apps at midnight in the student instances with a credit-based size.
{% endhint %}

#### Tiered credit limit schedule

You can also define a **tiered credit limit schedule** for the students. Consider a similar schedule as before, but now with **Counter reset set to No**.

| Credit limit | End date   | Counter reset |
| ------------ | ---------- | ------------- |
| 1.2          | 2025-09-15 | No            |
| 2.4          | 2025-09-22 | No            |
| 3.0          | 2025-09-29 | Yes           |

In the above example, every students instance (may it be [individual ](../../administration/space-management/invite-to-a-space.md#to-invite-new-students)or [group](setting-up-group-projects/)) can&#x20;

1. consume up to 1.2 credits from the creation of the space until 2025-09-15 EOD
2. consume up to 2.4 credits from the creation of the space until 2025-09-22 EOD
3. consume up to 3.0 credits from the creation of the space until 2025-09-29 EOD
4. from 2025-09-30, students cannot start GPU-enabled sizes anymore&#x20;

The difference compared to a fixed credit limit schedule is that unused credits are not lost in intermediate dates. An instance that becomes active only in the last week can still utilize all 3 credits.

### GPU Lab session in an On-demand GPU course

It is possible to schedule a lab session in an On-demand GPU course, but keep the following in mind:

* you need to **explicitly select** the GPU resource in the schedule configuration. If you don't enable **Scale resources** during schedule time, the applications will be started without GPUs!
* lab session credit spendings for your students **will also be counted** against their credit limit, just like any other sessions they start themselves. Plan your credit limit schedule accordingly.

{% hint style="info" %}
Using a GPU Lab session in an On-demand CPU course can cause credit imbalance for students, because

* student apps are started up in sequence, so different students will incur different credit costs
* if a student's app is started by the system scheduler, it will also be stopped automatically by the system scheduler. Students who started their applications themselves before the lab session can keep working without interruption, but they will also be responsible for closing the application themselves
{% endhint %}

For these reasons, if you plan to use lab session on your On-demand GPU course, it's best to set a separate limit for the lab session's day. Example:

| Credit limit | End date   | Counter reset |
| ------------ | ---------- | ------------- |
| 1.2          | 2025-09-16 | Yes           |
| 0.36         | 2025-09-17 | Yes           |
| 1.2          | 2025-09-23 | Yes           |
| 0.36         | 2025-09-24 | Yes           |

In this example, there is a planned lab session day on 2025-09-17 and 2025-09-24, with a dedicated budget just enough to support the lab session's duration.

### Monitor credit limits and usage

Every instructor can see **in the Master** instance the currently active credit limit in the applications view:

<figure><img src="../../.gitbook/assets/image (13).png" alt=""><figcaption></figcaption></figure>

Every student can see **in their instance** the limit, how much they've used so far and the end date of the active limit:

<figure><img src="../../.gitbook/assets/image (14).png" alt=""><figcaption></figcaption></figure>

To monitor your total spendings in the course, go to the [Resources dashboard](../../administration/monitoring-resource-usage/#the-monitoring-dashboard).
