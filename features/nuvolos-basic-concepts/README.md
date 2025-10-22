# Nuvolos basic concepts

Most of the user work in Nuvolos happens in confined single- or multi-user environments called [_spaces_](../../administration/space-management/). When you think about a Nuvolos space, you can think about it as just _a project_. A space is a collection of work environments which in turn contain the files (code and [data](data-integration.md)) and [applications](applications.md) related to the specific project.

Spaces are a collection of _instances_. Instances are the work environments in which workflows are being executed. In particular, any project might comprise of multiple people working on a related subject (_in one space_), however working independently (_in separate instances_), occasionally sharing their results (via Nuvolos solutions that facilitate sharing work on a space level). Instances are a way to maintain parallel versions (branches) of related material. In a single-user setup, a space will generally contain just one main instance - called the _master instance._

Instances are comprised of _states._ The _current state_ is the only mutable state of the instance. The state of a particular instance can be captured in a [_snapshot_](snapshots.md) for versioning. Snapshot states are immutable and are Nuvolos' way of storing a safe version of an instance. States may include any or all of files, database tables and applications, depending on the use case. Files and snapshots can in turn be [_distributed_](distribution.md) to others within the Nuvolos platform.

Spaces are themselves contained in [_organisations_](organisational-hierarchy.md#organisations)_._ An organisation is a collection of spaces and serves essentially as an administrative unit, a cost center and a strong licensing barrier. For example, a summer school might be a separate organisation: each class would be set up as a separate space, with common administration that operates on the organisation level.

<figure><img src="../../.gitbook/assets/Nuvolos basic concepts visualization.jpg" alt=""><figcaption></figcaption></figure>

A more detailed explanation of these concepts can be found in the concept descriptions found below this page.
