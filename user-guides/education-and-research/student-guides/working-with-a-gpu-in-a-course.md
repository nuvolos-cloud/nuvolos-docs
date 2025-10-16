---
description: In case your instructor enabled it, you can work with GPUs in courses
---

# Working with a GPU in a course

Nuvolos support two kind of workflows for working with GPUs in courses: the first approach is **GPU Lab Sessions** and the second is **On-Demand GPU Courses**.

## GPU Lab Sessions

In this workflow, your instructor will define lab sessions where you'll automatically have access to a runtime environment with GPU. The instructor will **communicate such schedule** either via the Nuvolos README.md, the university's learning management system (e.g. Moodle) or similar ways.

An example for such a schedule:

> Nuvolos application JupyterLab 4.1.2 will be available with GPU  on every Monday between 10:00-12:00 GMT, from Sept 8 2025, for 8 weeks.

### Using a GPU-enabled application

Lab sessions are defined by the instructors in this workflow - you as a student cannot start the application with a GPU. You only need to sign up for the course, and log in to Nuvolos at the scheduled times - your application will be started for you by the system, with GPU enabled.

You can see if your application has GPU enabled if you hover your mouse over the logo on the left sidebar:

<div align="center" data-full-width="false"><figure><img src="../../../.gitbook/assets/image (150).png" alt="" width="251"><figcaption><p>A green badge and an explicit text shows if your application has GPU</p></figcaption></figure></div>

Key points:

1. Make sure to sign up to the course at least 1 hour before the first scheduled session - the system starts processing the attendee list well before the session start, and if you sign up last minute, **you will not** get a GPU-enabled machine!
2. You don't need to start the application yourself - in fact, **running applications using another size will be restarted** by the system a couple of minutes before the session start, to enabled GPU access.
3. You don't need to stop the application yourself - the system will shut down all student applications at the end of the session. **If you stop your GPU-enabled application, you won't be able to start it again for yourself**!
4. GPU device drivers will be installed automatically for you.&#x20;

## On-demand GPU courses

In this workflow, you can **start the application with GPU yourself**. You can see all relevant information in the applications screen:

<figure><img src="../../../.gitbook/assets/Screenshot 2025-09-08 163243 (1).png" alt=""><figcaption><p>In this example, you could start app <strong>JupyterLab with GPU</strong> with a Tesla T4 card.</p></figcaption></figure>

* The **size** column of the application will display the GPU (e.g. Tesla T4)
* The **credit/hour** column will display how many credits it costs to run this application for 1 hour
* The top right **progress bar** will show how much credit you have used so far, your limit and the end date of the limit.

{% hint style="warning" %}
Credit charges start when you [click the application start button](../../../pricing-and-billing/pricing-structure.md#application-resource-accounting), and not when the Web UI loads! To best utilize your credits, make sure to start your application when you have at least 30 consecutive minutes to use the application, and always stop your application when you no longer need it.
{% endhint %}

#### Credit limits

As you run the application, the progress bar will show you how much credits have you used up from your limit. Each limit has an end date, which means that the current limit applies **until that date**. At midnight (UTC time) on every end date, one of the following things will happen:

* Your credit usage resets to zero, and a new period with a new limit/end date begins.
* You credit usage remains, and a new period with a higher limit/end date begins.
* There is no further limit period defined after this end date, and the _Credit limit_ and _Ends on_ start showing _N/A_. In this case, you **cannot run applications with GPU anymore**.

Key points:

* As opposed to lab session, you **need to start the application yourself**.
* Once you reach your credit limit, all of your running applications with a nonzero credit price **will be stopped**. You need to wait in this case for the next credit limit period to continue working.
* On limit end dates, running applications **will be stopped at midnight (UTC time zone)** in case credit usage is configured to reset to 0.
