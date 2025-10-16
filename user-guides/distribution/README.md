# Distribution

Distribution is the process of sharing your work—including files, data, applications, and even entire snapshots—with others on the Nuvolos platform. It is a "push" operation, meaning you select items from a source and send them to a target location.

This feature is a cornerstone of collaboration in Nuvolos, enabling seamless sharing for research and teaching.

## How Distribution Works

You can initiate a distribution from the UI by staging the items you wish to share (files, applications, etc.) and then selecting the "Distribute Objects" option. The process allows you to select a target (e.g., another user's instance, a course's distributed instance) and choose a strategy for handling conflicts.

## Distribution Strategies

Nuvolos supports various distribution strategies to manage how your shared items interact with existing items in the target location:

*   **Overwrite (Default):** If an item with the same name and path exists in the target, it will be replaced by the distributed item. This is the most common strategy as it gives the sender control over the target state.
*   **Distribute Extra:** This is the least intrusive strategy. It only adds new items to the target and will **not** overwrite any existing items.
*   **Clear Target and Replace:** This is the most intrusive strategy. It completely erases the target's contents before copying the distributed items, ensuring the target is an exact replica of what you sent.

## The Distributed Instance

Every space in Nuvolos includes a special "Distributed Instance." Its primary purpose is to serve as a central repository for materials shared within a space, particularly in educational settings.

When you distribute materials to all students in a course, you are typically pushing them to this instance. New students joining the course will then have their own instances spawned from the state of the Distributed Instance, ensuring everyone starts with the same materials. You can update or recall files from this instance to manage the content available to students.

## Common Use Cases

*   **Distributing Teaching Materials:** An instructor can distribute coursework, data, and pre-configured applications to all students in a course simultaneously.
*   **Onboarding Researchers:** A project lead can distribute a full project snapshot to a new team member, giving them a complete, ready-to-run environment instantly.
*   **Restoring from a Snapshot:** You can selectively distribute files or applications from a previous snapshot back into your current working instance to restore specific parts of your work.
*   **Sharing for Reproducibility:** Distribute your final snapshot to a reviewer or colleague to allow them to replicate your work and results perfectly.
