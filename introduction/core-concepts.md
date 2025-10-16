# Core Concepts

To effectively use Nuvolos, it's helpful to understand a few core concepts. This guide provides a high-level overview of the platform's foundational components.

## Organisational Hierarchy

Nuvolos organizes workflows into a clear, three-tiered structure:

1.  **Organizations:** The highest level, typically representing an entire institution or company. Organizations are containers for all associated data, users, and projects.
2.  **Spaces:** A space represents a self-contained project, such as a research project, a training course, or a dataset. Each space has its own access controls and resources.
3.  **Instances:** Instances are individual, parallel workflows within a space. Think of them as branches of your project. You can have a "master" instance for your main work, and separate instances for experiments, collaborators, or students.

This structure allows for fine-grained access control and logical separation of different workstreams.

## Applications

In Nuvolos, an "application" is any software tool you use for your work, such as JupyterLab, RStudio, or VSCode. Key features of Nuvolos applications include:

*   **Containerization:** Every application is bundled with all its dependencies and configurations. This ensures that it runs consistently everywhere and that changes to one application don't affect others.
*   **Isolation:** Because they are containerized, applications are completely isolated from one another, guaranteeing scientific reproducibility and preventing conflicts.
*   **Distribution:** You can easily share a fully configured application with a colleague or student, eliminating complex setup procedures.

## Snapshots

A snapshot is a complete, point-in-time copy of an instance. It captures everything: your files, data, application configurations, and all dependencies. Snapshots are:

*   **Complete:** Every component of your workflow is saved as a single unit.
*   **Immutable:** A snapshot is read-only and cannot be altered, ensuring a secure and reliable record of your work.
*   **Restorable:** You can restore an entire instance to a previous state from a snapshot at any time.
*   **Shareable:** You can distribute a snapshot to others, allowing them to replicate your environment and results perfectly.

Snapshots are fundamental to reproducibility, collaboration, and risk-free experimentation.

## Distribution

Distribution is the mechanism for sharing work within Nuvolos. It's a "push" operation, where you send objects from a source instance to a target. You can distribute:

*   Individual files or folders
*   Database tables
*   Fully configured applications
*   Entire snapshots

This feature streamlines collaboration, simplifies the process of sharing teaching materials, and makes it easy to onboard new project members by giving them a complete, ready-to-use environment.
