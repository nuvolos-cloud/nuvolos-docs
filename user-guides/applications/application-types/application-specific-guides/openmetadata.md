---
description: OpenMetaData with Azure File Share support is available on Nuvolos.
---

# OpenMetaData

### Overview

OpenMetaData is an end-to-end metadata management platform that enables unlocking the value of data assets in common use cases of data discovery and governance, as well as emerging use cases related to data quality, observability, and people collaboration.

OpenMetaData on Nuvolos supports the ingestion of files stored on Azure File Shares, which allows you to track operations performed on files stored in Azure File Shares.

### Setting up OpenMetaData

Add a new OpenMetaData application to your working instance in Nuvolos:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-19 at 08.40.25.png" alt=""><figcaption></figcaption></figure>

OpenMetaData runs in a VSCode application on Nuvolos, along with a pre-installed Airflow application, which executes the ingestion workflows created by OpenMetaData.

#### Starting your application

Once you have added the OpenMetaData application to your Nuvolos instance, start your application.

After a couple of minutes, you should see an initialization screen:

![](<../../.gitbook/assets/Screenshot 2024-02-19 at 08.41.44.png>)

This initialization can take a few minutes upon the first start of a new application as both the OpenMetaData and Airflow databases need to be set up in the background.

Once the application starts, you will see a VSCode interface:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-19 at 15.14.23.png" alt=""><figcaption></figcaption></figure>

VSCode is used so the Airflow interface can also be accessed and DAGs be created/refined as necessary. You can also install additional packages via the built-in Terminal.

#### Opening OpenMetaData

To show OpenMetaData, open the [Command Palette](https://code.visualstudio.com/docs/getstarted/userinterface#_command-palette) and issue the `OpenMetaData: Show OpenMetadata` command:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-19 at 09.39.35.png" alt=""><figcaption></figcaption></figure>

OpenMetaData opens in a new tab in VSCode:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-19 at 15.30.11.png" alt=""><figcaption></figcaption></figure>

Click on the _Sign in with Auth0_ button to log in to OpenMetaData. On the first start, a new user will be created for you.

{% hint style="info" %}
If you are an administrator in your Nuvolos space, your OpenMetaData user will be an administrator within the OpenMetaData application. If you are not an administrator in the Nuvolos space, a non-privileged OpenMetaData user will be created.

OpenMetaData checks for administrators only on the first start of the application, if you have been granted Nuvolos space administrator privileges after the application was started, you will need to ask your co-admins to grant you admin roles in OpenMetaData.
{% endhint %}

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-19 at 16.03.39.png" alt=""><figcaption></figcaption></figure>

### Adding an Azure File Share storage:

Click on _Settings -> Storages -> Add New Service_ and select AZFS from the available storage services:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-19 at 16.04.29.png" alt=""><figcaption></figcaption></figure>

Give a name to your storage service and obtain the name of the Azure File Share to be used and a [connection string](https://learn.microsoft.com/en-us/azure/storage/common/storage-account-get-info?tabs=portal#get-a-connection-string-for-the-storage-account) (the credential) that provides read access to the Azure File Share:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-19 at 17.22.43.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-19 at 17.44.01 (1).png" alt=""><figcaption></figcaption></figure>

Click _Test Connection_ to test whether the credentials can be used to access the Azure File Share:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-19 at 19.37.10.png" alt=""><figcaption></figcaption></figure>

### Adding an ingestion pipeline for Azure File Share

You can create an ingestion pipeline to create OpenMetaData containers and objects from folders and files in Azure File Share. The pipeline is an Airflow DAG, created and managed by OpenMetaData.

To create an ingestion pipeline, edit your new AZFS (Azure File Share) storage and click _Add Metadata Ingestion_ on the _Ingestions_ tab:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-25 at 15.43.30.png" alt=""><figcaption></figcaption></figure>

You can name your ingestion pipeline if you wish. You **need to choose&#x20;**_**Storage Metadata Config AZFS**_**&#x20;as the value for Storage Metadata Config Service** and provide the connection string for the Azure File Share and the name of the file share:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-25 at 16.28.18.png" alt=""><figcaption></figcaption></figure>

In the next step, you can specify the schedule for the ingestion pipeline:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-25 at 16.28.31.png" alt=""><figcaption></figcaption></figure>

Once the schedule is defined, click _Add & Deploy_ to create the ingestion pipeline in Airflow:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-25 at 18.32.44.png" alt=""><figcaption></figcaption></figure>

### Running the ingestion pipeline

Click _Run_ to execute the ingestion pipeline on demand:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-25 at 18.34.43.png" alt=""><figcaption></figcaption></figure>

You can see the logs from Airflow by clicking on the _Logs_ link.

#### Viewing the Airflow DAG

You can open Airflow with the _Airflow: Show Airflow_ VSCode command:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-25 at 19.20.45.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-25 at 18.35.02.png" alt=""><figcaption></figcaption></figure>

#### Checking the newly ingested metadata:

You can check the newly ingested metadata in the _Explore -> Containers_ view:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-25 at 18.42.22.png" alt=""><figcaption></figcaption></figure>
