# Troubleshooting applications

## Troubleshooting applications

In certain cases, an application might become unresponsive, unstable or unable to start. This might be due to:

* An application-level problem (e.g. RStudio can freeze the browser if outputting too much information)
* A configuration issue
* A problem occurring after installing extensions or software packages

Nuvolos offers the following features to recover from such scenarios:

### Clearing user application settings <a href="#clearing-user-application-settings" id="clearing-user-application-settings"></a>

If an application is not launching, freezing or otherwise misbehaving (e.g. has wrong screen resolution), the first thing to try is to clear user application settings. Most applications store settings and configuration files in the HOME folder of the user, which can be easily cleared in Nuvolos:

1\. Navigate to the application list

2\. Select "Clear settings" in the "..." menu for the given application

{% embed url="https://www.youtube.com/watch?v=RG6ryaVbppo" %}

3\. Launch the application again.

### Factory reset the application

Sometimes an application won't launch due to changes in the application's files that cannot be simply solved by clearing the settings folder in HOME. Examples:

* Updating Python packages to incompatible versions that prevent the core application libraries (e.g. jupyter) to function properly
* Corruption of file contents due to concurrent writes

Nuvolos has a 'Factory reset' feature for applications. It clears the application's LIB area clean, as if the application has been installed fresh. This can be particularly useful in a teaching scenario, where students cannot install new applications themselves, as a way to fix a broken environment.

{% hint style="info" %}
Note that **Clear settings** and **Factory reset** are complementary features. The former only affects files in the HOME folder of the user triggering the action, while the latter affects the files in the application's LIB area, having impact on all user working in the instance.
{% endhint %}

### Restore application libraries <a href="#restore-application-libraries" id="restore-application-libraries"></a>

In certain cases, installing an application package / library / add-on can adversely impact the behavior of an application (e.g. not being able to execute a code or launch the application at all). In this case, please try restoring the application from a snapshot that contains a still working version of the application:

1. Stop the application you wish to restore.
2. Open the [snapshot ](../nuvolos-basic-concepts/snapshots.md)from the snapshot view.
3. Open the application list on the sidebar.
4. [Stage](../object-distribution/#distributing-a-selected-list-of-items-a-worked-example) the application for distribution.
5. Start a distribution to the same instance, which will overwrite the Current State with the packages from the snapshotted version.
6. Once the distribution is complete, restart the application.

{% hint style="info" %}
In a **course space**, it is also possible to re-distribute an application from the Distributed instance to a student instance. This can be done by students themselves, with the same steps as above, except the application is staged in the Distributed instance, and the target is the student instance.\
\
This makes it possible to revert to the state shared by the instructor and to reinstall/rescue a deleted application in a student instance.
{% endhint %}
