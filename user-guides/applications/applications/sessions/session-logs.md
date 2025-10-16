---
description: Viewing the application's logs output for a specific session
---

# Session Logs

Being able to monitor the application's log outputs is crucial for efficient troubleshooting of your applications. The Session Logs function lets you do just that.

From the application sessions screen, click on the Actions button to see the logs for a specific session.

<figure><img src="../../../.gitbook/assets/image (34).png" alt=""><figcaption><p>Opening the Actions dialog box for a particular session lets you see the logs output of the application</p></figcaption></figure>

{% hint style="info" %}
As a security measure, you are only able to see the logs for a specific application session if:

* You **started** the session

OR

* The application was **run in** [**SHARED MODE**](../configuring-applications.md#run-in-shared-mode) for that specific session
{% endhint %}

This will take you to the Session logs screen. The Application's name and the specific session's ID you are viewing are shown. The log output is shown in a descending order, i.e., the latest logs are shown at the bottom of the output window.

<figure><img src="../../../.gitbook/assets/image (35).png" alt=""><figcaption><p>The Application Session's Logs Screen. The latest logs are shown at the bottom.</p></figcaption></figure>

{% hint style="info" %}
Logs are collected in real time but due to processing, they can be a delayed up to a few minutes until visible on the interface. Also, logs can be retrieved only for **the last 7 days.**
{% endhint %}

## Log Interface Controls

1. Containers
   * Allows you to select which application or sidecar (a.k.a. [Add-on](../add-ons/)) you wish to see the logs for
   * [**Main-App**](../) is the application you have configured (e.g. Visual Studio Code, Jupyter Lab etc.)
   * Any **sidecar** configured to run alongside the application for this session (e.g. Redis, MongoDB etc.)
2. Show Timestamp
   * Toggle timestamp visibility in the output
   * Log messages may or may not have a timestamp in the message itself
3. Number of lines
   * Sets the maximum number of lines of logs that is displayed (default = 100 lines of log output)
4.  Filter(s)

    * After Timestamp - Set a **timestamp only on or after** which such logs will be shown (default = no timestamp, so show the latest log messages)
    *   Log text - Show logs to only those **containing the text specified.** Note that:

        * The filters are applied at different stages:
          * The timestamp and number of lines filters are applied first (i.e. at the time of query) then,
          * The text filters are applied in Nuvolos after the logs are retrieved.

        For example: there are 150 lines of log output for a given application, the last 100 of which are comprised of:

        * 50 lines with the text `warning`&#x20;
        * 30 lines with empty log messages
        * 20 lines that do not contain the relevant text ("warning")

        With the default filters, before the `warning` text filter is applied, **the last 100 lines** of log output will be shown. When `warning` is typed in the text filter, the text filter is then applied, so the log output displays 50 lines with the relevant text.



    In the following example, log output with filters:

    * **100 lines of logs**
    * **only on or after** 02 May 2025 12:00:00
    * **containing** "config.yaml"

    are shown.

<figure><img src="../../../.gitbook/assets/image (38).png" alt=""><figcaption><p>Filtering the logs output to display only after 02 May 2025 1200H and containing "config.yaml" in the log message.</p></figcaption></figure>

