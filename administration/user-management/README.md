# User Roles and Permissions

Nuvolos uses a role-based access control system that maps directly to the platform's [organisational hierarchy](../introduction/core-concepts.md). Permissions are handled at three levels: Organization, Space, and Instance.

## Organization Level Roles

An Organization is the highest-level container in Nuvolos. At this level, there are three primary roles:

*   **Member:** The default role for any user who is part of at least one space within the organization. Members can view public spaces and any other content they are specifically invited to.
*   **Faculty:** A trusted role for users who need to create their own spaces (e.g., for new courses or research projects). Faculty members automatically become administrators of the spaces they create.
*   **Manager:** An administrative role with high-level oversight. Managers can create spaces, manage faculty and manager invitations, and monitor resource usage across the organization. They have view privileges across all spaces to ensure full oversight.

## Space Level Roles

A Space is a container for a specific project. Access is primarily controlled at the instance level, but there is one elevated role at the space level:

*   **Space Admin:** A user with administrative control over a specific space. Space Admins can manage all instances within that space, invite users, create new instances, and manage space settings. The user who creates a space is automatically made a Space Admin.

## Instance Level Roles

An Instance represents a specific workflow or branch within a space. This is where most work is done and where access control is most granular.

*   **Editor:** The standard role for active work. Editors can modify the instance's current state, including adding and editing files, running applications, and creating snapshots.
*   **Viewer:** A read-only role. Viewers can access all snapshots of an instance to view files and query data, but they cannot make any changes.
*   **Observer:** A limited role primarily used for dataset discovery. Observers can only see the `README.md` file of an instance and can request to be upgraded to a Viewer.
