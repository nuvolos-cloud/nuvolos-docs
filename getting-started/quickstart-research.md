# Research

## Set up a research project

Research projects are spaces in Nuvolos where researchers can store and work on their code and data. Organisation managers or faculty members may create research projects.

You may create research projects directly from the dashboard. Note that if you have already more than three projects, the add button will be at the bottom of your quick access group.

The project creation has two main steps:

* Naming the project and setting up privacy, potentially adding an Overview immediately.
* Choosing an application.&#x20;

{% embed url="https://www.youtube.com/watch?v=Q2aqYLxn748" %}
How to start a research project
{% endembed %}

{% hint style="info" %}
You can add a README.md file or applications later.
{% endhint %}

When you create a research project, the project initialises with an instance called "Master instance". This is where the application will also be added.

## Add material to the project

You can add files and source code to your project via the file download/upload feature of Nuvolos. There are also other storage and synchronization methods, refer to those [here](../../features/file-system-and-storage/).

{% embed url="https://www.youtube.com/watch?v=pDVlOFr0Ja4" %}
Uploading a single file to an existing project
{% endembed %}



## Create alternate approaches

Creating alternate approaches in your research project can be done in two steps:

1. Create a new instance with an appropriate name.
2. Distribute material from the main master instance.
3. You will need to be comfortable with context switching, we suggest to take a look at our [navigation guide](../navigate-in-nuvolos.md).

#### Create new instance

To create an instance, you need to be a [space administrator](../../administration/roles/) of your project.

1. Navigate to "Space management", denoted by the gear icon and click.
2. Select "Project Users/Instances"
3. Click Add New instance and fill out the required details.

{% embed url="https://www.youtube.com/watch?v=CR5E3e6ZlrE" %}
Creating a new instance in a project
{% endembed %}

#### Distribute material to modify

To distribute some material:

1. First navigate to the files, applications you want to distribute.
2. Click on the stage button for the objects you want to distribute.
3. Click on the distribute menu on the sidebar or on the overview.
4. Follow the steps of distribution. For more details, refer to our [detailed guide on distribution](../nuvolos-basic-concepts/distribution.md).

In the following example, we distribute two files and an application to the previously created empty instance.

{% embed url="https://www.youtube.com/watch?v=2tOKO7hg8n8" %}

{% hint style="info" %}
Distribution is an asynchronous task - once you initiate it, it will run in the background. You will receive an e-mail with the outcome of a distribution.\
If the distribution fails for some reason, do not hesitate to contact us at [support@nuvolos.cloud](mailto:support@nuvolos.cloud).
{% endhint %}

## Invite collaborators

You can invite collaborators if you are a [space admin](../nuvolos-basic-concepts/organisational-hierarchy.md) in a research project. The creator of the project automatically becomes space admin, but every other user has to be invited specifically with that role.

To make an informed decision about the type of roles you want in your project, consult [our detailed guide](../../administration/roles/).

### Invite co-authors with space admin rights

{% hint style="info" %}
If you invite a co-author to your project as a space admin, restricted to the project, they will receive every possible right, including the ability to invite additional co-authors, create alternate instances and deleting the project itself.
{% endhint %}

To invite a co-author, do the following steps:

1. Navigate to your space.
2. Select the gear button on the top of the left sidebar and select "Project Users / Instances" there.
3. Click on "Invite" in the top right corner of the pane.
4. Pick "Administrator Invitation".
5. Type the e-mail address, or comma separated list of e-mail addresses.

The invitations will be sent by e-mail to the recipients who need to accept the invitation to gain the role.

{% embed url="https://www.youtube.com/watch?v=HeySJlNjT9A" %}
How to invite co-authors
{% endembed %}

&#x20;

### Invite co-authors with editor rights

{% hint style="info" %}
If you invite a co-author to your project as an instance editor to an instance, they will only be able to see and edit the contents of that particular instance. They will not be able to create more instances, invite users or do any modifications outside the scope of the particular instance they have the right to edit.
{% endhint %}

To invite a co-author as an instance editor, do the following steps:

1. Navigate to your space.
2. Select the gear button on the top of the left sidebar and select "Project Users / Instances" there.
3. Click on "Invite" in the top right corner of the pane.
4. Pick "User Invitation".
5. Pick the instance and the role you want to invite the user with.
6. Type the e-mail address, or comma separated list of e-mail addresses.

{% embed url="https://www.youtube.com/watch?v=LgOBEcAPbU8" %}

## Work with applications

In Nuvolos, each application is a separate entity with a separate set of resources and environmental settings. Some important considerations:

1. You can have multiple applications of the same type (e.g. RStudio) in the same instance with different sets of packages or package versions.
2. When you [take a snapshot](broken-reference), applications are snapshot along with all the packages, environmental files and so on.
3. Applications can be distributed (see above).

### Create a new application

In the workflow guide, we previously created an RStudio application upon creating the space itself. Let us assume that we have changed our mind, deleted the RStudio application and now we want to add a JupyterLab application to the Master instance of the research project.

1. Navigate to the Master instance overview (from the dashboard or by changing context in the [breadcrumbs](broken-reference))
2. Click on the Applications tile or sidebar menu item.
3. Click "ADD NEW APPLICATION" and select the application you want.

{% embed url="https://www.youtube.com/watch?v=8-oiUr2NTcA" %}

### Run an application

In order to run an application, you can follow two routes:

1. Run a recent application from your dashboard.
2. Navigate to the instance of your choice and run the application directly from there.

{% embed url="https://www.youtube.com/watch?v=xW9qZCLpG6w" %}
Run an application from a project.
{% endembed %}

#### Running from dashboard

The three latest applications will appear on your dashboard. You can verify the location of the application by hovering over the start-stop button.

{% embed url="https://www.youtube.com/watch?v=NR0Bnc7xS0Y" %}
Running an application from the quick access menu on the dashboard
{% endembed %}

## Next steps

### Scale up computations

It is possible to request more resources for your calculations. Configuring your application size is just a few clicks away and you don't need bother setting up a separate environment for this.

&#x20;Check our [application configuration guide](../../features/applications/application-resources.md) for details.&#x20;

### Work with data

[Consult our detailed guide](../../features/database-integration/) to start working with data.
