# Applications

## Introduction

One of the main uses of the Nuvolos platform is running _applications_. By applications we mean any software tool used to interact with data or code or used as a working environment: for example Jupyter Lab, R Studio, VSCode, MatLab, Stata, and so forth. By default, Nuvolos provides you with a wide curated array of applications in their best or most used configurations, so that you can get started easily with your notebook, experiment, or data analysis. Beyond this, custom configurations can be set up. Nuvolos supports any application that can run on Linux.

Applications are always run within a particular Nuvolos [instance](organisational-hierarchy.md#instances). A given application can be run once, repeatedly, continuously, or multiple times in parallel, as desired. Moreover, applications are always containerised, meaning the tool with all of its dependencies are treated as a single whole (see below for more details).&#x20;

In order to run an application on Nuvolos, you must have at least the [editor role](../../administration/roles/) in an instance.

## Application containerisation

Every application in Nuvolos is _containerized_. Containerization involves bundling an application together with all of its related configuration files, libraries, and dependencies required for it to run across different machines with the same architecture. As a consequence of containerization, applications are isolated and independent of each other. This has several benefits: it means that different configurations of the same application can be run concurrently, that the functioning of the whole container in the expected way is guaranteed (which is useful for scientific reproducibility, for example), and that the application can be distributed (see below).\
\
Initially, each application will contain the default configuration, libraries, and dependencies. Once the user has started an application, they will be able to install new packages and libraries. Because applications are containerized, changing the configuration of one application does not affect any others. That includes concurrent usages of the same application: if you run JupyterLab once and change its configuration (say install a package), and then run another JupyterLab environment (from its default state), the second application will not share packages with the first.

## Application distribution

Because applications are containerised, they can be [distributed](distribution.md) wholesale to other instances. This means the application as it is, with all of its configuration and dependencies, will be sent to the current state of another instance and can then also be run in that instance. This makes distributing the results of experiments or data analysis a simple process. For education purposes, it is possible to use the mass distribution feature to disseminate not just the teaching material, but also the environment in which to interact with the teaching material to all the students of a course in this way.&#x20;

## Applications in snapshots

Applications can be versioned using the [snapshot process](../../features/snapshots/) built into Nuvolos. Thanks to containerisation, this is a single complete operation regardless of the configuration or dependencies of an application. This means that users don't have to worry about correctly copying or backing up every library or dependency and every configuration file to make sure an application is saved correctly.
