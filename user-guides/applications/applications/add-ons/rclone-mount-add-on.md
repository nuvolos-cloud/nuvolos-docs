---
description: >-
  The Rclone mount add-on mounts files stored in a cloud storage account into
  your Nuvolos application using the Rclone utility.
---

# Rclone mount add-on

[Rclone](https://rclone.org) is a command-line utility for managing and syncing files and directories between various cloud storage providers, as well as local filesystems. It supports a wide range of cloud storage services such as Google Drive, Dropbox, Amazon S3, Microsoft OneDrive, and many others.

### Prerequisites

Before adding a Rclone mount add-on to your application, a Rclone remote must be configured.

You can configure a Rclone remote either via the command line in a terminal inside a Nuvolos application, or using the Rclone GUI Nuvolos application.

{% hint style="info" %}
Rclone stores configuration files in the Personal area of your Nuvolos instance, so the configured remote will be only visible to your user. If other users wish to use the same Nuvolos application with a Rclone mount add-on configured, they will also need to configure a Rclone remote.
{% endhint %}

#### Use existing configuration file

If you have already configured Rclone on another machine, you can migrate your existing configuration file to Nuvolos:

1. Upload the configuration file to Nuvolos
2. Copy it to `~/.config/rclone/rclone.conf` in your instance

The Nuvolos addon uses Rclone v1.62.2, make sure to only use remotes compatible with this version.

#### Command line configuration on Nuvolos

To configure a remote via the command line on Nuvolos, we recommend using a terminal in a JupyterLab application. You can install the Rclone utility with the following command:

`mamba install -y -c conda-forge rclone`

Once Rclone is installed in your application, you can configure a remote with the `rclone configure` command. Please refer to the [Rclone documentation](https://rclone.org/overview/) on how to configure the remote service of your choice.

#### Configuration using the Rclone GUI Nuvolos application

Please add a Rclone GUI Nuvolos application to your working instance, which is available under the Data Operations category:

<figure><img src="../../../.gitbook/assets/Screenshot 2023-04-05 at 13.59.29.png" alt=""><figcaption></figcaption></figure>

Start the application, and click on the _Login_ button to navigate to the Rclone dashboard. No username or password is required:

<figure><img src="../../../.gitbook/assets/Screenshot 2023-04-05 at 14.04.13.png" alt=""><figcaption></figcaption></figure>

Click on _Configs_ and _Create a New Config_ to create a new config. Give a name to your remote configuration and select the cloud storage provider of your choice, then proceed with the configuration options displayed.

<figure><img src="../../../.gitbook/assets/Screenshot 2023-04-05 at 14.04.58.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
Please note that the Rclone GUI does not support all configuration options available in the `rclone` command line utility.
{% endhint %}

### Using the configuration

Once your Rclone remote has been configured, you can add the _Rclone mount add-on_ to your application in the application configuration:

<figure><img src="../../../.gitbook/assets/Screenshot 2023-04-05 at 14.09.48.png" alt=""><figcaption></figcaption></figure>

Start / restart your application and if the remote was successfully configured, you will be able to access the files stored in your cloud storage account under the `/rclone` path in your Nuvolos application.

{% hint style="info" %}
If there are multiple remotes defined in the Rclone configuration file, only the first remote will be mounted under the `/rclone` path.
{% endhint %}

### Configuration walkthroughs

We have examples for some of the most common remote types:

* [AWS S3](../../file-system-and-storage/access-s3-buckets-with-rclone.md)
