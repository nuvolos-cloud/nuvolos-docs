# Documenting your course

Nuvolos helps you organize and document your course contents with two key features:

## The readme feature

On any folder level, you may include a file named `README.md` that will be automatically rendered as a documentation of the folder, if written in standard [markdown](https://github.com/adam-p/markdown-here/wiki/Markdown-Cheatsheet) format. The top level `README.md` is automatically rendered on the overview of your instance.

{% hint style="info" %}
You may edit the `README.md` file from the Nuvolos UI, via the text edit feature which has a WYSIWYG and a source code type editor.
{% endhint %}

![The editor for changing your readme file.](<../../.gitbook/assets/app.nuvolos.cloud_org_32_space_3423_instance_22572_snapshot_331830_overview (3).png>)

You may also embed videos from streaming providers to your readme file, creating a journal of previous lectures for the students to review. This may be done by copying the **Embed** snippets provided by the standard streaming services as a link into the readme file.

## The videos feature

You may place a hidden file named `.videos.json` in the root folder of your instance. The video links contained in this file will be displayed in the video area of the overview.

The following overview contains a single video file:

![The video section of the overview of an instance](<../../.gitbook/assets/Screenshot 2021-09-27 190947.png>)



&#x20;The video section is generated via the following syntax:

```javascript
{
    "nvVIDEOS": [
        {
            "url": "https://player.vimeo.com/video/507887919",
            "description": "The knowledge creation cloud"
        }
    ]
}

```

The above snippet is saved under a filed named `.videos.json`:

![](<../../.gitbook/assets/Screenshot 2021-09-27 191126.png>)

{% hint style="info" %}
Notice that the file name starts with a dot character and the **Hidden file** toggle is set to show hidden files in the top folder of the instance!
{% endhint %}

