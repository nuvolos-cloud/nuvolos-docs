# Applications

In Nuvolos, each application is a separate entity with a separate set of resources and environmental settings. Some important considerations:

1. You can have multiple applications of the same type (e.g. RStudio) in the same instance with different sets of packages or package versions.
2. When you [take a snapshot](../../getting-started/nuvolos-basic-concepts/snapshots.md), applications are snapshotted along with all the packages and environmental files.
3. Applications can be distributed (see above).

## Create a new application

For a step-by-step guide on creating an application, see the [Researcher's Getting Started Guide](../../getting-started/researchers/work-with-applications.md).

## Run an application

Visit [Work with applications](../../getting-started/researchers/work-with-applications.md) to learn how to run an application step-by-step.

## Stop an application

For a step-by-step guide on stopping an application, see the [Researcher's Getting Started Guide](../../getting-started/researchers/work-with-applications.md).

### Auto-stop for applications

Nuvolos can also automatically [stop inactive applications](long-running-applications.md).

### Persist sessions data in the home area between restarts

By default, Nuvolos applications will persist sessions data in the home between restarts, however, for a better performance, this can be disabled under the application configuration as shown below.

![Tick or untick Persist session data in home area between restarts](../../.gitbook/assets/app.nuvolos.cloud_org_32_space_3423_instance_22572_snapshot_331830_applications.png)

Not persisting the home area will allow for a better performance as the data is stored on the faster local disk, not the network storage. Also, since your home area will be reset on each restart, you don't need to worry about breaking your application configuration.

However, there is also a more stringent quota on non-persisted home areas: 2 GB is the max allowed storage footprint. Note that this quota is not a hard limit, rather a soft limit monitored regularly. If your application using a non-persistent home is found to use more than 2 GB space in the home area, it'll be restarted, thus cleaning up the home area.

## Change application resources

Applications can run in various resource configurations called sizes. Sizes with high-end resources consumes Credits, while running applications in standard sizes is included in your Nuvolos subscription.

To learn more about application resources, please consult our documentation [here](application-resources.md).
