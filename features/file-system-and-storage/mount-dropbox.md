---
description: Mount your Dropbox folder into running Nuvolos applications
---

# Mount Dropbox

### Enabling Dropbox access

Nuvolos supports synchronizing files with your Dropbox account. In order to enable synchronisation, go to the [Account >  Settings > Dropbox Sync ](https://az.nuvolos.cloud/user/settings/dropbox) and click the **Enable** button.&#x20;

### Mounting your Dropbox folder

When you [link your Dropbox account](synchronize-with-dropbox.md#link-your-dropbox-account) on Nuvolos, a special folder is created in your main Dropbox folder at **Apps > nuvolos.cloud.** When using the mount integration, this folder will be visible on your application's filesystem as the directory **/dropbox.**

{% hint style="info" %}
The **/dropbox** folder is only visible when running Nuvolos applications. You cannot interact directly with your Dropbox files via the Nuvolos Web UI.
{% endhint %}

<figure><img src="../../.gitbook/assets/image (116).png" alt=""><figcaption><p>Files under the Apps/nuvolos.cloud folder in Dropbox (right) appear as files under the /dropbox folder in your Nuvolos application (left)</p></figcaption></figure>

When working with the files in /dropbox folder in your Nuvolos application, on a high level, the following happens:

* Reading a file from under /dropbox (and any subfolders) -> triggers a download of the file contents on the fly
* Writing a file under /dropbox (and any subfolders) -> triggers an upload of the file to Dropbox  on the fly

Dropbox synchronization only happens if files are read from / written to /dropbox.

### Unlink your Dropbox account

You can unlink your Dropbox account anytime at [Account >  Settings > Dropbox Sync](https://az.nuvolos.cloud/user/settings/dropbox). Applications started after unlinking will not connect to Dropbox, running applications will still have a connection until restarted.

### Limitations

There are some limitations to this integration to keep in mind:

* **Dropbox rate limits**: if you're making lots of changes very fast on the files/folders under **/dropbox**, it might take some time until those are reflected in your Dropbox account because the rate of operations is limited by Dropbox, and some operations will need to be delayed by the integration tool for later execution.
* **File size limit**: The mount integration does not support reading/writing files larger than 15 GB.
