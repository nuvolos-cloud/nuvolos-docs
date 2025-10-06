---
description: >-
  You can access files from your SharePoint Online sites in Nuvolos
  applications. (Preview feature.)
---

# Access files on SharePoint Online

### Prerequisites

To access your SharePoint Online site documents from Nuvolos applications, you must authenticate with Microsoft365 using a web browser so programmatic access to your data on SharePoint Online / OneDrive Business would be authorized for your Nuvolos applications.\
\
There are two options for how the authentication can be performed:

#### 1. Authenticate with RClone on your own computer

Please [install the RClone cloud storage manager](https://rclone.org/install/) utility on your own PC which you use to access Nuvolos.

Once the utility is installed, open a command-line prompt and start to configure a new "remote", a cloud service access by issuing the command `rclone config`:

<figure><img src="../../.gitbook/assets/Screenshot 2023-02-24 at 14.52.27.png" alt=""><figcaption></figcaption></figure>

Select the `onedrive` cloud storage provider:

<figure><img src="../../.gitbook/assets/Screenshot 2023-02-24 at 14.52.51.png" alt=""><figcaption></figcaption></figure>

Select the `Microsoft Cloud Global` region, or the `Microsoft Cloud Germany` region if your data is hosted on Microsoft Cloud Germany:

<figure><img src="../../.gitbook/assets/Screenshot 2023-02-24 at 14.53.10.png" alt=""><figcaption></figcaption></figure>

You will not need to edit the advanced config and you should choose the auto config option, which will open a browser tab to log in to Microsoft365:

<figure><img src="../../.gitbook/assets/Screenshot 2023-02-24 at 14.53.36.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screenshot 2023-02-24 at 14.54.00.png" alt=""><figcaption></figcaption></figure>

Once you have successfully logged on, the browser will instruct you to return to the `rclone` configuration session in the command line.\


Next, either select `OneDrive Personal or Business` or `SharePoint site name or URL` from the type of connection prompt. If you select `SharePoint site name or URL`, please specify the URL of your SharePoint Online site as seen below:

<figure><img src="../../.gitbook/assets/Screenshot 2023-02-27 at 13.37.21.png" alt=""><figcaption></figcaption></figure>

Select the folder with the data you wish to use.

**Once the configuration is complete, `rclone` will present you the `token` and the `drive_id` received from Microsoft365. Please copy these values and save them as secrets in Nuvolos:**

<figure><img src="../../.gitbook/assets/Screenshot 2023-02-24 at 15.12.53.png" alt=""><figcaption><p>token value to copy</p></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screenshot 2023-02-24 at 15.13.58.png" alt=""><figcaption><p>drive_id to copy</p></figcaption></figure>

You can create Nuvolos secrets under your Nuvolos user settings:

<figure><img src="../../.gitbook/assets/Screenshot 2023-02-27 at 16.03.27.png" alt=""><figcaption></figcaption></figure>

Click _Settings_ and then click on the _SECRETS_ tab, click _ADD SECRET_:



<figure><img src="../../.gitbook/assets/Screenshot 2025-01-07 at 15.30.54.png" alt=""><figcaption></figcaption></figure>

Create a secret named `SHAREPOINT_ACCESS_TOKEN` and copy the value of the `token` displayed by `rclone` in the command line prompt as the secret value:

<figure><img src="../../.gitbook/assets/Screenshot 2023-03-24 at 18.48.43.png" alt=""><figcaption></figcaption></figure>

Then create another secret named **`SHAREPOINT_DRIVE_ID`** and copy the value of the `drive_id` displayed by `rclone` in the command line prompt as a secret value:

<figure><img src="../../.gitbook/assets/Screenshot 2023-02-27 at 14.39.59.png" alt=""><figcaption></figcaption></figure>

If you have successfully set both secret values, you have completed the prerequisites that are required to access data from SharePoint Online in Nuvolos applications.

## Configuring your Nuvolos application

Currently, SharePoint Online data access is a preview feature, please reach out to Nuvolos Support to enable SharePoint data mounting for your specific Nuvolos application. Once the feature will reach GA state, this will be configurable in the Nuvolos application configuration.

## Accessing remote files

Once the prerequisite configuration has been done and the applications have been also configured to use SharePoint Online, you can start your Nuvolos application.&#x20;

The files from the remote server will be accessible under the path `/sharepoint`. If you wish to use a different path, please reach out to Nuvolos support.
