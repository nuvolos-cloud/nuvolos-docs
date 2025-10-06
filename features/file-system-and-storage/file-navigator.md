---
description: >-
  The Nuvolos Web UI has a file navigator to manage your files directly from the
  browser
---

# File navigator

When working on Nuvolos, typically you're using a computer program in a running Nuvolos application to interact with your files. However, there are some common file manipulation tasks that can be carried out directly via the Web UI:

### Workspace vs Personal files

You can navigate both the [Workspace ](../applications/configuring-applications.md#persistent-locations)files of the instance and your [Personal ](../applications/configuring-applications.md#persistent-locations)files with the file navigator. Use the dropdown below the Upload button to switch:

<figure><img src="../../.gitbook/assets/image (143).png" alt=""><figcaption><p>Switch between Workspace and Personal with the dropdown</p></figcaption></figure>

### Upload files

You can upload files from both your local computer, or from a publicly available web URL

<figure><img src="../../.gitbook/assets/image (122).png" alt=""><figcaption><p>Upload files from local device or URL</p></figcaption></figure>

### Download files

You have multiple options to download files from Nuvolos to your local machine:

1. Download a single file
2. Download a single folder as a zip archive
3. Download up to 10 selected files or folders as a zip archive
4. Download all files in the current folder as a zip archive

<figure><img src="../../.gitbook/assets/image (125).png" alt=""><figcaption><p>If no files are selected, <strong>Download all</strong> can be found next to <strong>Upload</strong> and <strong>Create</strong></p></figcaption></figure>

### Move, copy,  rename, delete

You can move, copy, rename or delete files from the Nuvolos Web UI as well.

<figure><img src="../../.gitbook/assets/image (124).png" alt=""><figcaption><p>Files can be moved, copied, renamed or deleted</p></figcaption></figure>

### Extract (unzip) archives

You can extract (unzip) archives on the web UI:

<figure><img src="../../.gitbook/assets/image (126).png" alt=""><figcaption><p>For supported formats, the <strong>Extract all</strong> button appears automatically</p></figcaption></figure>

Currently archives in the following formats are supported:

```
.zip, .gz, .tar, .tgz, .tar.gz, .bz2
```

During extraction, a folder with the same name as the archive will be created automatically, and all contents are extracted there. If a file or folder with the same name already exists, a new folder name is generated to avoid overwrites.

{% hint style="info" %}
Archives are extracted in the background, please look at the tasks view to check if it has completed.
{% endhint %}

The Web UI also supports manipulating the contents of certain files, which is described in the section [Preview files](preview-files.md).

### Limitations

{% hint style="info" %}
Soft links are not displayed in the Web UI's file navigator, but they still work in your Nuvolos applications.
{% endhint %}

###
