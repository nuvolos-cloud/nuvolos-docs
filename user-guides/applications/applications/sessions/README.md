---
description: Accessing an application's sessions history
---

# Sessions

As described earlier, a Nuvolos application is a set of resources and associated configurations. When you start the application, an **application session** is created. Every session is a single continuous run of the application, identified by an unique session id.

An application's current and previous session information is available in Nuvolos. To access the session history of an application, open the Sessions page under the Actions button in the Applications list.

<figure><img src="../../../.gitbook/assets/Screenshot 2025-04-30 232448.png" alt=""><figcaption><p>Getting to the Application's Session history</p></figcaption></figure>

<figure><img src="../../../.gitbook/assets/image (23).png" alt=""><figcaption><p>Application sessions history default view</p></figcaption></figure>

This will take you to the default view of the application's session history. By default, the following information are shown:

* Start / Stop Time
  * Timestamp of when the session was started and/or ended. An active indicator for the stop time column means that the application is still running.
  * Search and filter for a specific **date** using the Start time column
* Runtime
  * Actual running time (HH:MM:SS) of the application's session
* [Size](../application-resources.md#size-and-price-of-an-application)
  * Resource configuration (NCU / Node pool) used for the application at the time the session was started
* Credits Spent
  * Total credits spent for a specific session
  * Only applicable to [credit-based sizes](../application-resources.md#size-and-price-of-an-application); not available for NCU configurations
* Actions
  * View the saved [logs of the application session](session-logs.md) (if allowed)

## Adding Columns to the Session History Viewer

<figure><img src="../../../.gitbook/assets/image (24).png" alt=""><figcaption><p>Columns shown for the Session history can be customized</p></figcaption></figure>

To add more columns and see more information for each of the application's session history, simply click on the "Columns" dropdown and enable/disable the desired columns.

<figure><img src="../../../.gitbook/assets/image (25).png" alt=""><figcaption><p>Session history page showing all possible columns</p></figcaption></figure>

Other columns/information available:

* Session id
  * Unique session identifier. Use this in support requests to specify the run in question.
* Start / Stop user
  * Display name of the user who started or stopped an application session. The stop user can be different from the start user for
    * shared applications, where a different user stopped a session.
    * applications terminated by the System Scheduler, due to [inactivity](../long-running-applications.md#automatic-stopping-due-to-inactivity).
* Sidecar size
  * Total NCU size of **all the sidecars** (a.k.a. [Add-ons](../add-ons/)) configured to run alongside the application for that session
* [NCU hour](../../../reference/glossary.md#ncus)
  * Total NCU hours consumed for the session
  * Includes the main application NCU usage (which is configuration-dependent) and **all** the sidecar NCU usage (if run alongside)

