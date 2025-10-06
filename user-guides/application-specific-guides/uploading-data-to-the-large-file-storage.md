# Uploading data to the Large File Storage

If you want to upload data directly to the Large File Storage, this is possible via a support request.

Requirements:

1. You need to obtain an access link from Nuvolos support.&#x20;
2. Download and install the latest version of [Azure Storage Explorer](https://azure.microsoft.com/en-us/products/storage/storage-explorer/?msockid=1e46f65073866c791d9be2cc729b6d4e#Download-4).

## Steps to establish connection

The following steps describe how to establish a direct connection to the large file storage.

1. Open Azure Storage Explorer.
2. Select the option "Attach to a resource".

&#x20;

<figure><img src="../../.gitbook/assets/Screenshot 2024-11-22 120304.png" alt=""><figcaption></figcaption></figure>

3. Select "File Share" in the popup menu.



<figure><img src="../../.gitbook/assets/Screenshot 2024-11-22 120247.png" alt=""><figcaption></figcaption></figure>

4. Select "Shared access signature URL" as connection method.

<figure><img src="../../.gitbook/assets/Screenshot 2024-11-22 120322.png" alt=""><figcaption></figcaption></figure>

5. Give any name as "Display name" and copy-paste the link you received into the "File Share SAS URL" field.

<figure><img src="../../.gitbook/assets/Screenshot 2024-11-22 120412.png" alt=""><figcaption></figcaption></figure>

At this point, you have access to the file share and are able to browse/upload files.

## Uploading files

To upload new files, use the upload button in the Azure Storage Explorer:

<figure><img src="../../.gitbook/assets/Screenshot 2024-11-22 120434.png" alt=""><figcaption></figcaption></figure>

