---
description: You can create LaTeX documents with Overleaf Community Edition on Nuvolos
---

# Overleaf

### First steps

Go to the Applications view of your working instance and add a new "Overleaf + TexLive" application:

<figure><img src="../../.gitbook/assets/Screenshot 2023-06-02 at 14.05.35.png" alt=""><figcaption></figcaption></figure>

This application will have a useful selection of the latest TexLive packages pre-installed and available for use.

{% hint style="info" %}
Overleaf applications in Nuvolos are shared applications, meaning that if a user starts an Overleaf application, all other users of the instance will connect to the same running instance of the application.
{% endhint %}

Start your Overleaf application. Once the application loads on the first start, you will be asked to configure the administrator account for your Overleaf service. The user name can be any email address; it does not have to be a live account, and no emails will be sent to the specified email address. This account is independent of your Nuvolos account; it only exists in this specific Nuvolos Overlaf application.

<figure><img src="../../.gitbook/assets/Screenshot 2023-06-02 at 14.12.35.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
If you wish to collaborate within Overleaf, the recommended approach is to invite the collaborator as an instance editor in your Nuvolos working instance. This way, the collaborator will be able to run or access the running Overleaf application and the created .tex files.\
\
Overleaf is not configured to send emails from within the application.
{% endhint %}

Once you have created the admin account, you will be redirected to the login page. This will be the screen displayed when the Overleaf application starts in the future:

<figure><img src="../../.gitbook/assets/Screenshot 2023-06-02 at 14.13.27.png" alt=""><figcaption></figcaption></figure>

### Create a project

Log in with the admin account you have just created. You will be prompted to create your first Overleaf project. In Overleaf, source LaTex files and related resources like images and bibliography are organized into projects:

<figure><img src="../../.gitbook/assets/Screenshot 2023-06-02 at 14.14.20.png" alt=""><figcaption></figcaption></figure>

### Edit and compile LaTeX documents

If you create a blank project, you will be presented with a simple .tex file containing some placeholder text. In the example below, we have prepared a simple research paper document to demonstrate

Click "Recompile" on the preview window to see how the paper will look like when exported as a PDF:

<figure><img src="../../.gitbook/assets/Screenshot 2023-06-02 at 14.16.39.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
Overleaf saves .tex files in an internal database, they are not accessible in the Files view in Nuvolos. If you distribute your Overleaf application, .tex files will be distributed along with the application.
{% endhint %}
