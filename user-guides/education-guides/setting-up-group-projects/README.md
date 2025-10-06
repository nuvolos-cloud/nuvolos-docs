# Setting up group projects

Group projects are supported in Nuvolos. In order to set up a seamless experience, we suggest taking the following steps.

## Create a new space

This space will only contain group work-related instances. The "normal", single-user instances should be contained in a separate space with the standard teaching material.

{% hint style="info" %}
We suggest creating a new space due to the fact that distributing two threads of workflows on top of each other means that individual and group work might get unnecessarily tangled.

**New spaces can only be created by faculty members**. If you are a TA and don't have faculty permissions, please ask the course instructor to create the space for you.
{% endhint %}

## Add group instances

New instances should be created for each group one-by-one, using the "Joint instance for multiple users" option. When entering emails for users already attending a course on Nuvolos, please make sure to enter the e-mail they have listed under their name in the **Members** list for the course they are attending. **If the group invitation is sent to the wrong e-mail, the student will not be able accept with their existing Nuvolos user.**

Once the invitations are accepted, each group member will be an editor of the instance that was created for the group. This has the following consequences:

* Each group member will be able to modify files in a common workspace, and the current state of the instance becomes more transparent.&#x20;

{% hint style="warning" %}
_Warning:_ _multiple users might be editing the same file_. We highly recommend to [use JupyterLab 3.1 or higher with "Shared" editing mode](broken-reference) for group instances. For other configurations, the exact outcome of this operation is application-dependent, but this is a situation that needs to be avoided by the group. It is suggested that work is broken down into appropriately small blocks if possible and scheduled if multiple users editing a single file is not avoidable.
{% endhint %}

The students will receive an invitation to this particular instance to their e-mail address. Once they accept the invitation, they will be able to see two spaces - their regular coursework space and their own single-user instance as well as the group-work space with their group work instance.

The below workflow comprises of two main steps:

1. Creating a group instance named `Group 1` for the students,
2. Inviting the students as editors to the created `Group 1` instance.&#x20;

![](../../../.gitbook/assets/invite_group_student_ed.gif)

## Upload files to the master instance of the group workspace

After the exact structure of the group workspace is set up, files can be uploaded to the master instance. This step can happen before adding all the group instances, depending on the timeline of the course.

## Distribute files to the group instances

The distribution can be carried out just as usual. As highlighted previously, since in this setup the individual and group work spaces are kept separately, if a new group needs to be set up, it can be initialized easily via the distributed instance.

As the course proceeds, the distribute feature can be used cumulatively to move forward the group work instances as well. Please note that it is also possible to "bridge" information between regular and group work instance, via cross-distributing between spaces.

