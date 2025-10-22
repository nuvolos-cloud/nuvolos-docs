# Organisational hierarchy

In order to get started with Nuvolos, it is useful to familiarise yourself with the basic concepts of the platform features and how the platform is organised. In this section, we explain the organisational hierarchy used in Nuvolos and how this affects the workflow on the platform.

Any Nuvolos project consists of three layers of organisational hierarchy: _organisations_, _spaces_, and _instances_, in that order. When you have newly subscribed to Nuvolos, these will be set up for you as part of the signup process.&#x20;

## Organisations

An organisation represents the highest level of interaction context in Nuvolos: once a user logs in to Nuvolos, the first step is to choose an organisation to work in. Starting from an organisation, the user can then select which space they want to work with.&#x20;

Being a member of an organisation grants the user automatic access to specific spaces, and the user may request access to further protected spaces (see the section on [Spaces](organisational-hierarchy.md#spaces) below for more information). By default, the assumption is that one customer entity corresponds to one organisation. In practice, a real-world legal entity (e.g. university) may have more than one organisation associated with it; e.g. if the university has a complicated licensing and cost allocation structure for a vendor dataset, it might be useful to create separate organisations for different datasets, and it will be at the university management's discretion to invite the appropriate users to these special organisations.

In general, organisations are simply that: organisational containers for all the projects associated with a particular customer entity. They do not play an important role in the research or educational workflow itself, but are primarily used for administrative purposes. Organisations own all the data and files created by their members.

## Organisation access control

An organisation has four types of members, each member type having slightly different capability on the organisation structural level.

* **Organisation managers:** managers oversee and manage the assets that an organisation has within Nuvolos. Organisation managers can request the addition of new vendor datasets, create new spaces, and delete any of the spaces inside the organisation. Managers have view privileges in all instances in all spaces of the organisation. This provides full read access to every data ever created by any faculty member of the organisation, plus all vendor datasets available to the organisation. Generally, each organisation has only a few managers. Furthermore, organisation managers can send invitations to faculty members to join the organisation.\

* **Faculty members:** a faculty member can create new spaces (where they automatically become _space_ administrators) and send invitations to colleagues or students to join or create an instance in the spaces where they are administrators.\


## Spaces

A core feature of Nuvolos is that projects are encapsulated and self-contained in terms of both data and software. This feature is realised by the concept and hierarchical level called a _space._ A space lives within the context of an organisation, and different spaces can be created for managing activities such as a course, a summer school, a research project, or a dataset. Spaces contain at least one - but in certain use cases may contain many - _instance_ (see [Instances](organisational-hierarchy.md#instances) below), which represents a separate work context that allows for access control and the sharing of data between the members of a space (e.g. teachers and students, or colleagues on a research project).

In short, if an organisation in Nuvolos corresponds to an entity, a space corresponds to a work project undertaken by members of that entity, whether in research or instruction.&#x20;

Resource pools can also be mapped to spaces, for the purposes of allowing an organisation to use different budgets for different projects. For more information, see our documentation on [resource pools](../../pricing-and-billing/resource-pools-and-budgets.md).

## Space access control

Access to space contents (database tables, files, etc.) is controlled at the instance level. However, each space has one or more administrators, who have special privileges. For example, administrators can invite other administrators for the space and have editor rights for all instances in the space. They are also allowed to create new instances in the space and invite editors/viewers for any of its instances. The user who creates the space will, by default, attain space administrator rights.

**Space visibility**

There are different visibility settings for spaces, in order to provide further access control. These are as follows:

* **Public space**: A space that contains publicly available resources available to the entire organisation, including external members: for example, a publicly available dataset uploaded to Nuvolos. Any user in the organisation automatically becomes a viewer of the master instance of public spaces, and organisation managers become viewers in all of its instances.\

* **Faculty-only space**: A space that contains a resource that is only accessible for faculty members of the organisation. Faculty members automatically become viewers of its master instance. Organization managers also become viewers in all of its instances. A typical example: a vendor-provided dataset with a faculty-wide license (as opposed to a campus-wide one).\

* **Private space**: A space that contains a resource that is only accessible for members of the organisation on a case-by-case basis. Only organisation managers become viewers in all of its instances, everyone else has to be invited by the space administrator. Any research group project or course could for example be designated as a private space.

## Instances

As mentioned above, Nuvolos spaces correspond in principle to projects. In turn, spaces consist of one or multiple _instances_. Instances correspond to parallel workflows or working branches in a space, and allow you to organise these and move between them in an easy way.

The purpose of instances is to provide _branching_ of work within a project. Because you can create as many instances of a given workflow as you need within a space, each project can be divided into different experimental runs or trials, or different ways of using the codebase, or different versions of the same application used on a dataset, etc.&#x20;

As working branches, instances also represent the totality of a workflow that can be captured in [snapshots](snapshots.md) for distribution. The benefits of branching in Nuvolos using instances become clear when you can easily transfer files, code, applications, or other data from one branch to another, and use snapshots to revert instances or part of instances as needed. A main branch can be used for the tested results, while each researcher may have their own branch for running experiments, and they can then easily move between these as the workflow demands.

Instances are also useful for instruction use cases: for example, the instructors will use different instances than the course students, constituting different branches of the same teaching material.

## Instance access control

Each space has two special instances, Master and Distributed, which are created automatically at the creation of the space itself. The Master instance is the primary working instance, and acts as the 'source of truth' for the present state of the work. The Distributed instance is used for the [distribution process](distribution.md). These two instances cannot be deleted, except if the entire space is removed.

Each user can have one of the following roles for each instance in each space:

* **Viewers** have read access to all snapshots of the instance, but they cannot create or delete snapshots. The viewer role provides a means to share spaces with users so they are able to see changes in the current state in real time.
* **Editors** can modify the current state. They can add/remove/update files, tables, and other objects, and have all the rights as viewers as well.

## Nuvolos organisational hierarchy use cases

This threefold layering - organisations, spaces, and instances - sums up the organisational hierarchy used in Nuvolos, as well as the access control options associated with each layer. This access control model means you can securely use your instances for use cases like:

* **Institution-wide available vendor data:** Vendor provided data will reside in the dedicated organisation for each institution. The organisation administrators of the institution will be able to see all vendor-provided data and any data created by any affiliates of the institution, as they are viewers of all instances of all spaces.
* **Teaching a course:** Faculty members can create a new space for each course they teach, in any organisation they are affiliated with. They would become administrators of these spaces, while students will become members after they are invited to the course space. If course work requires homework assignments, it is suggested to create a separate instance for each student. Teaching assistants may be assigned a space administrator role so they can handle the administration of the course. It is also possible to create multi-user instances in case the course requires group work or group assignments.
* **Managing a research project:** Researchers can create a separate space for each research collaboration they are part of. In the created space, the head of the project invites collaborators (possibly from other organisations as well). It is possible to create an instance for each collaborator so they can work in parallel and only share results that they consider worth merging into the group project.
* **Private workflows:** Faculty members are able to create new spaces where they become space administrators. In these spaces, only the organisation administrators are viewers of all instances. Faculty members can then select the audience of each instance created in these spaces.

More information about user roles and definitions can be found in the [Roles](../../administration/roles/) section of the documentation.

## &#x20;
