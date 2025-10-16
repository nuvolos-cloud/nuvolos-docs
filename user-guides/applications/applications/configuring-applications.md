---
description: Best practices for configuring your applications on Nuvolos
---

# Configuring applications

Most Nuvolos applications come with a vast amount of configurable settings, and often they support extra packages, which in turn have their own separate settings. This document describes the recommended way to manage such configurations that most suit your needs.

## Persistent locations

Every Nuvolos application is built on top of customized Linux distribution, tuned specifically for performance and security in the cloud. This underlying OS is initialized fresh on each start - this means, even if you can write to some locations like /tmp, changes in these locations are ephemeral, and will disappear with the next restart.

There are 3 locations that do retain changes between restart:

* The Workspace files (generally mounted under /files, and hence also referred to as the FILES area)
* The Personal files (generally mounted under \~, and hence also referred to as the HOME area)
* The Application library files (mount point depends on the app type, also referred to as APP LIBRARY area)

You can check the mount points for these locations in the app's description. If your app has a description, it'll have a clickable description text:

<figure><img src="../../.gitbook/assets/image (93).png" alt=""><figcaption><p>All these apps have a clickable description field</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/image (70).png" alt=""><figcaption><p>The description contains the information about mount points</p></figcaption></figure>

## Temp storage

Every application has file system locations dedicated for storing temporary files. These locations are volatile (a.k.a. ephemeral), meaning that all data stored in them is erased once the application is shut down. However, the storage medium behind them is even more performant than the Nuvolos filesystem, so they are ideal for storing fast-changing files like logs, cache, intermediate artifacts, etc.

We recommend using the following paths:

* `/tmp` :  Available in every applications. Available storage under `/tmp` depends on the general load of the cluster, so as a rule of thumb, don' try to use more than 10 GB of storage space there, otherwise your application might be stopped by the system for overusing temp storage.
* `/ephemeral` : Available on some credit-based sizes. On the credit-based sizes, you have exclusive access to the storage, so you can safely use all of it. Use the `df -h /ephemeral` command in your running app to check your usage level.
* `/nvme0n1, /nvme1n1, ...`  : Available on some credit-based sizes. On the credit-based sizes, you have exclusive access to the storage, so you can safely use all of it. Use the `df -h /nvme*` command in your running app to check your usage level.

## Application start notification

Nuvolos supports sending a notification about your application being ready for use. Once your application has loaded completely, Nuvolos will try to send a system notification. This will pop up a consent window in your browser, where you can accept or reject these notifications.

{% hint style="info" %}
Nuvolos will only send you notifications about your application being ready to use, nothing else
{% endhint %}

If you accept the request, Nuvolos will send you notification once your app is ready to be used and the Nuvolos browser window is not in focus. This works both for scaled and normal applications.

If you wish, you can enable/disable these notifications anytime later as well. Note that each browser and operating system manages such notifications at multiple levels. Please consult your browser's/operating system's documentation on how to manage notification permissions.&#x20;

Some examples:

* [Manage site permissions is Chrome](https://support.google.com/chrome/answer/114662?hl=en\&co=GENIE.Platform%3DDesktop)
* [Manage system notifications in Windows 10/11](https://support.microsoft.com/en-us/windows/change-notification-settings-in-windows-8942c744-6198-fe56-4639-34320cf9444e#WindowsVersion=Windows_10)

## Configuring applications

Each Nuvolos application has various properties that can be configured:

*   The **application resources** can be configured by clicking on the button in the **Size** column:\


    <figure><img src="../../.gitbook/assets/image (146).png" alt=""><figcaption><p>Application resources can be access from the Size column</p></figcaption></figure>

    \
    Please see[ application resources](application-resources.md) for details.\

*   The **application configurations** can be accessed from the triple dot menu, using the **Configure** button:\


    <figure><img src="../../.gitbook/assets/image (147).png" alt=""><figcaption><p>Configurations can be found in the actions column</p></figcaption></figure>

In the following section, we'll describe the setting in the application configurations screen:

<figure><img src="../../.gitbook/assets/image (148).png" alt=""><figcaption><p>Application configuration screen</p></figcaption></figure>

### Inactivity limit

To allow for effective use of resources, any Nuvolos application may be shut down by the system if certain inactivity limits are met. For details, see the [long running applications](long-running-applications.md) page.

### Run in shared mode

By default, every Nuvolos application is only accessible to the user who has started it. This guarantees that you can work in complete privacy on the platform. However, in many cases like [group work](../../user-guides/education-guides/setting-up-group-projects/collaborative-application-editing.md), you want to collaborate with other Nuvolos users - this is when shared mode is useful.

If you start an app in shared mode, every user who is allowed to start apps in the instance will **have access to the same running application**. This has the following implications:

* Apps in shared mode are assigned to a special "shared" user. It does not matter which user starts the application - the home folder will always be the home folder of this special "shared" user. It works the same way as for non-shared apps, but since multiple users can access it, consider carefully what kind of privileged information you store there.
* For the above reason, personal secrets are generally not propagated in applications running in shared mode. There are a few exceptional applications where they do propagate, but these special apps do not make it possible to extract these secrets from the running app.
* The user who has started up the application (the "starter") will see it as a regular Nuvolos application. All other users in the instance will see the running app **only if they open the instance of the application**. In other words, the shared app's status will not be accurate for them on the quick access cards and in the top navigation bar.

Shared mode might be required by certain applications, for example server-type applications generally require shared mode, as each instance user should have access to the same server, not independent versions of it. In such cases, the shared mode toggle is disabled.

For other applications, you can enable shared mode, but if the applications do not support multiple connections from different users, the experience might not be optimal. For example, RStudio only allows one live session, so it does not make much sense to enable shared mode for RStudio.

#### Collaborative editing in JupyterLab

There is a particular application where turning on shared mode makes a lot of sense: JupyterLab 4. From JupyterLab 3 to 4, collaborative editing has improved a lot.&#x20;

{% hint style="info" %}
We recommend using collaborative editing only from JupyterLab version 4.0.0 - our tests showed the feature is much more reliable since the latest major release.&#x20;
{% endhint %}

To enable collaborative editing in JupyterLab 4, simply enable shared mode for the app. After your restart the Nuvolos application, you'll see a small badge at the top right of JupyterLab with your collaborative editing name.

<figure><img src="../../.gitbook/assets/image (117).png" alt=""><figcaption><p>If collaborative editing is enabled, you'll see a badge like this at the top right of the JupyterLab screen.</p></figcaption></figure>

Some known limitations regarding collaborative editing:

* In collaborative editing, you cannot manually save files, JupyterLab will save them 1 seconds after it has detected any changes in the document.
* Currently nicknames cannot be chosen in collaborative mode, it'll be the random generated.
* If the collaborative framework fails to load due to e.g. intermittent network problems, JupyterLab won't be able to open any files. In this case, do a full page reload to re-initialize the framework.
* Collaborative mode still does not fix the long outstanding issue with cell output streaming. This means, if you have a long running notebook, and you close your browser window, if you come back you won't be seeing any new message streamed to you in the cell output. To overcome this, we recommend [using Papermill](../../user-guides/application-specific-guides/jupyterlab.md) for long running notebooks.

{% hint style="info" %}
In case you encounter issues with collaborative mode for your workflow, you can turn it off completely by issuing the following command in a terminal:\
\
`jupyter labextension disable @jupyter/collaboration-extension`\
\
You'll need to do a full page reload for the changes to take effect. \
Also keep in mind that when collaboration is turned off, autosave is also disabled, so make sure to save your changes regularly.\
\
You can re-enable collaborative mode anytime with the same command, only using `enable` instead of `disable`.
{% endhint %}

### Persist sessions data in home area between restarts

Most applications store some state information in the user's home folder. Most of the time it is beneficial, however in a teaching scenario you might prefer to start with a clean slate each time the application start up.&#x20;

If you disable persisting sessions data, the app's home folder is initialized empty on startup and any changes in the app's home folder will be discarded upon application stop. Your persistent [HOME ](configuring-applications.md#persistent-locations)folder cannot be accessed by the application in this scenario.

### Connecting to apps from other applications

By default, Nuvolos applications cannot connect to other Nuvolos applications, even when run by the same user. This can be rather limiting for certain server applications, like databases or LLM servers. For this reason, it is possible to allow incoming connections for other applications on a case-by-case basis.

<figure><img src="../../.gitbook/assets/Screenshot 2025-01-17 092958.png" alt=""><figcaption><p>Nuvolos applications may accept connections from other applications</p></figcaption></figure>

{% hint style="info" %}
This connectivity only applies to other Nuvolos applications. Enabling this feature will **not** expose your application on the public internet.
{% endhint %}

There are 4 levels of application connectivity:

* **Nowhere**: the application cannot accept incoming connections
* **Same instance**: any application in the same instance can connect to it
* **Same space**: any application in the same space can connect to it
* **Same organization**: any application in the same organization can connect to it

You need to restart the application for the changes to take effect.&#x20;

{% hint style="info" %}
There are the following rules related to connectivity hostnames:

* The hostname for a particular application **does not** change between restarts or restoring operations.&#x20;
* The hostname for a particular application **changes** when shared mode is enabled/disabled.
* When distributing an app with connectivity enabled, new application objects get **new hostnames** to avoid name collision.
{% endhint %}

When application connectivity is enabled, the application can listen for incoming connections on any of the following ports:

| Port  | Used by        |
| ----- | -------------- |
| 5432  | PostgreSQL     |
| 3306  | MariaDB        |
| 27017 | MongoDB        |
| 6379  | Redis          |
| 7474  | Neo4j          |
| 11434 | Ollama         |
| 8500  | Custom port #1 |
| 8501  | Custom port #2 |

Configure your application to listen on one (or more) of these port(s). Connection attempts on other ports will be rejected.

### Application add-ons

Add-ons can be configured on a separate tab in the configuration screen. See the [add-ons](add-ons/) page for details.

## Configuring in-app settings

If you change your app's configuration via its UI (e.g. the font size of an editor window), it will be persistent between restarts, as all Nuvolos apps store their configurations in either the HOME or APP LIBRARY areas. However, there are important differences between the two locations:

* Configurations stored in the HOME area are different per Nuvolos user account. This means, even if you distribute configuration files from your Personal folder, they won't be visible in other accounts, only yours.
* Configurations stored in the APP LIBRARY area are intrinsic to the application itself. If the app is  distributed, these configurations are distributed too, automatically.&#x20;

Below are some recommended setting for the most common scenarios.

### Personal configuration in a collaborative environment

In certain cases, you might have access to e.g. licensed resources your collaborators should not have access to. In this cases, it makes sense to configure your application to store access keys in either environment secrets or files in your **HOME area**. These will not be shared with your collaborators, even if you explicitly distribute to other instances.

### Shared configuration in a collaborative environment

If you're working with collaborators in a space, you might want to configure your application the same way for every user in the space. We recommend the following setup:

1. Many apps and extensions support storing their configuration in the folder(s) where they are installed. This is the recommended place for storing shared configurations - as these settings automatically distribute along with the app itself.
2. If the above does not work, many apps still support customizing the location where they read configuration files from. You can use environment variables to customize these locations, and store your configurations in either the FILES or APP LIBRARY areas.&#x20;
3. If nothing else works, we recommend using a custom shell script wrapper that handles configurations setup before launching your executable. Many applications like [MATLAB](https://www.mathworks.com/help/matlab/ref/startup.html) or [RStudio](https://support.posit.co/hc/en-us/articles/360047157094-Managing-R-with-Rprofile-Renviron-Rprofile-site-Renviron-site-rsession-conf-and-repos-conf) look for specific files they automatically execute on each startup.
