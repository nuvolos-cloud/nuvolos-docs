# Configuring student applications

When working with student applications on Nuvolos, it is important to consider the following performance characteristics:

## Pre-starting student applications

If a class size is large (e.g. above \~50 users / or if individual applications have been customized to request higher resources) and students are expected to launch their applications at the same time, it can happen that resource allocation becomes slower (e.g. application launch time can be around 5 minutes instead of the usual 30-60 seconds).&#x20;

For a good user experience, we recommend that instructors pre-launch the required application(s) for all users before students are expected to start work with it. Nuvolos supports both automatic and manual application prestart.&#x20;

In both automatic and manual mode the progress and outcome of a pre-launch is visible in the task view.

{% hint style="info" %}
For optimal resource allocation, only the very first prestart triggers the start of a given application for all users in the space. Subsequent prestart events first check which users actually used the applications around the **last prestart time**, and the app will be started only for them automatically.&#x20;
{% endhint %}

### Scheduled startup of student applications

Using automatic application prestart instructors can create scheduled prestarts ahead of time. This can be performed from the 'Application' view in the sidebar, by clicking on the three dots beside the application name and selecting the 'Schedule for start' option, and setting the time and date by when all apps in the space should be up and running.&#x20;

The following limitations apply:\
\- The time of the schedule has to be in at least 30 minutes, as it takes time to start all applications. \
\- In a space, up to twenty scheduled prestarts can exist at the same time\
\- Setting a prestart date more than 6 months into the future is not allowed\
\- Setting a prestart date for archived courses is not allowed

![](<../../.gitbook/assets/app.nuvolos.cloud_org_32_space_3423_instance_22572_snapshot_331830_applications (1).png>)

The scheduled prestarts can be viewed, edited, and deleted from under the list of applications. If you wish the create a new schedule for the same time a week away, you can do that by clicking on 'add to next week' under the Actions column.

![](<../../.gitbook/assets/Screenshot 2024-12-17 172451.png>)

The next scheduled startup can also be viewed from the space overview page.

![](<../../.gitbook/assets/app.nuvolos.cloud_org_32_space_3423_instance_22572_snapshot_331830_overview (1).png>)

### Scheduled startup with GPU

Nuvolos supports courses with GPU access. In such a scenario, every student gets their individual GPU, so they don't need to compete for GPU runtime on shared machines. This makes it possible for students to e.g. write exams on Nuvolos, with everybody having access to the exact same hardware setup in a completely isolated way.

Read more on this at [GPU Lab Sessions](courses-with-gpus.md#gpu-lab-sessions).

### Manual startup of student applications

Pre-launching can be performed from the 'Applications' view on the sidebar, by clicking the three dots beside the application name and selecting the 'Start for all users' option:

![](<../../.gitbook/assets/app.nuvolos.cloud_org_32_space_3423_instance_22572_snapshot_331830_applications (2).png>)

{% hint style="info" %}
Student applications are stopped automatically after 1 hour of inactivity, so it does not make sense to perform the pre-launch more than an hour before the planned start time.
{% endhint %}

Pre-launching will start the application for all users in the space: for students, their respective applications will be started, for space administrators, the application in the master instance will be started. In case a space administrator is also an editor in a student instance, that application will also be started for the administrator.

## Configuring applications

Space administrators can configure settings for student applications as well, in 2 ways:

* Configure a specific application in a specific instance, via the Web UI
* Distribute an application from the Master instance to all students. Configurations are also distributed to students.

{% hint style="info" %}
When distributing applications in Teaching spaces, de careful that

* inactivity limit
* shared mode
* resources settings

are also distributed to student applications!
{% endhint %}

## Performance sensitive code

On Nuvolos each student runs the code with the same application configuration as the instructor.

Nevertheless, it is important to consider that when many students are concurrently executing a computationally intensive code, the application performance might be inferior to what the instructor experienced during material development when potentially the load from other users was lower.

Whilst usually this is within a reasonable factor, we recommend that during **interactive sessions with a large number of students**, either:

a) Code examples should be adjusted such that they execute within a minute or so maximum.

b) The space should be configured to have larger per-student resources to provide adequate compute performance. For the most performance sensitive cases, we suggest dedicated compute nodes for each application - please reach out to our support team to discuss such an option.

For out-of-class work when concurrency is lower, these considerations can be appropriately relaxed.
