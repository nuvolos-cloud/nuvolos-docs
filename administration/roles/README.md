# Roles

Nuvolos has a role system that is directly mapped to the structure of Nuvolos. On each structural level, a variety of roles exist with different actions available for different use cases.

In order to fully understand the role system, the structure of Nuvolos is a suggested read.

## Organisation level roles

As described in detail, organisations are cost and accounting centres. On the organisation level, the following four roles exist:

### No role

If a user has no role in an organisation, they cannot view any content contained in the organisation. If a user has a role, it can be revoked by an organisation manager.

### Member

An organisation member is any user who has been invited in any capacity into any space in the organisation.

* Members are able to view **Public** spaces in the organisation.
* Members are able to view any content in the organisation they are specifically invited to.
* Members automatically become _**instance observers**_ in instances of Dataset spaces with Public visibility.
* The membership role signifies that a connection has at least at one point in time existed between the user and the organisation.

### Faculty

An organisation faculty member is a user who has the ability to control resources in the organisation.

* Faculty members can create spaces and invite users to the spaces they have created. Any user who creates a space automatically becomes _space admin_ of that space.
* Faculty members automatically become _**instance viewers**_ in instances of Dataset spaces with Public and Faculty-only visibility and _**space admins**_ in Research and Course spaces with Faculty-only visibility.
* The faculty role is powerful in the sense that it has the ability to propagate licensed content to other users.

### Manager

An organisation manager is a user who has the ability to view resources in the organisation as well as control membership.

* Organization managers can create spaces and invite users to the spaces they have created. Any user who creates a space automatically becomes _space admin_ of that space.
* Organization managers can monitor resource usage in the entire organization, however they can only see and modify the contents of spaces where they have Space or Instance roles.
* Organization managers automatically become _**space admins**_ in Dataset spaces with Public and Faculty-only visibility and in Research and Course spaces with Faculty-only visibility.
* Organization managers can invite additional Faculties or Organization managers to the organization.
* Organization managers can revoke access to the organization's resources.

### Determining your organization role

To find out your current organization role, check the dropdown in the top navigation bar:

<figure><img src="../../.gitbook/assets/image (135).png" alt=""><figcaption><p>You current organization role can be found in the navigation bar</p></figcaption></figure>

Organization roles are handled by the organization managers on Nuvolos. You can find their contact details in the main dashboard, in the organization settings:

<figure><img src="../../.gitbook/assets/image (136).png" alt=""><figcaption><p>The organization settings menu contains contact details of managers</p></figcaption></figure>

## Space level roles

Spaces have a single special elevated role, that of a space admin. Every other user accessing a space has access to the space via having an editor or viewer role in one or more instances of the space.

### Space admin

Space admins have administrative power restricted to the scope of a single space.

* Space admins can view and edit every instance in the space:
  * They can upload/download files, run applications and query/modify tables.
  * They can create/delete snapshots.
* Space admins have the right to invite users to instances as editors or viewers.
* Space admins have the right to create instances in a space.

To find out your space role, check the dropdown in the top navigation bar:

<figure><img src="../../.gitbook/assets/image (22).png" alt=""><figcaption><p>Navigation bar shows Space Admin role for the currently selected space</p></figcaption></figure>

## Instance level roles

There are 3 kinds of instance level roles in Nuvolos. To find out your instance role, check the dropdown in the top navigation bar:

<figure><img src="../../.gitbook/assets/image (21).png" alt=""><figcaption><p>Navigation bar shows Instance Editor role in the Master instance</p></figcaption></figure>

### Editor

* Instance editors **can modify** the contents of the **current state** of an instance: they can upload/download files and run applications.
* Instance editors **can** also **create snapshots** of the current state of the instance.

### Viewer

* Instance viewers can **view** the contents of snapshots in the instance, including writing queries against data.

### Observer

* Instance observers can only **view** the README.md at the root of the instance's Workspace files, and has the ability to **request** a viewer roles in the instance. This role can generally be found in Dataset spaces, to facilitate discovery of Datasets, but provide explicit control over them at the same time.
