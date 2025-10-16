---
description: >-
  The Nuvolos Python API allows you to list objects and create workloads
  directly in the CLI.
---

# Using the CLI

### Displaying the help message

To display the available commands, run the `nuvolos --help` command:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-12 at 18.14.54.png" alt=""><figcaption></figcaption></figure>

### Listing commands

To list the organizations you are affiliated with, use the `nuvolos orgs list` command:



<figure><img src="../../.gitbook/assets/Screenshot 2024-02-12 at 18.19.00.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
All `nuvolos ... list` commands accept the `--format` flag to format the output in `json` or `yaml:`

![](<../../.gitbook/assets/Screenshot 2024-02-13 at 09.39.25.png>)

<img src="../../.gitbook/assets/Screenshot 2024-02-13 at 09.37.36 (1).png" alt="" data-size="line">
{% endhint %}

{% hint style="info" %}
As you can see in the output, **Nuvolos objects** (like organizations, spaces, and apps) **are identified by slugs in the CLI**, which are a normalized representation of their names.&#x20;

They are unique within their level of hierarchy, i.e. organization slugs are globally unique, space slugs are unique within an organization, and application slugs are unique within an instance.
{% endhint %}

To list Nuvolos spaces in the current organization within which your Nuvolos app is running the CLI, use the `nuvolos spaces list` command:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-13 at 09.36.34.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
If you run `nuvolos spaces list` on your local computer, or you want to list the spaces of another org, **use the** `--org <org_slug>` flag to specify the slug of the organization, as returned by the `nuvolos orgs list` command.
{% endhint %}

### Listing running Nuvolos applications

To list the applications you have started and are currently running in Nuvolos, use the `nuvolos apps running` command:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-13 at 15.42.35.png" alt=""><figcaption></figcaption></figure>

This command will also display the status of apps (STARTING, RUNNING, STOPPING) and the current CPU and memory usage of apps.

You can filter the list of running applications for a given org/space/instance or application by specifying additional flags to the command:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-13 at 15.49.37.png" alt=""><figcaption></figcaption></figure>

### Listing Nuvolos applications

To list the Nuvolos applications in the current Nuvolos instance you are working on, run the `nuvolos apps list` command:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-14 at 11.27.12.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
If you are using the CLI on your computer or you want to list the applications in another Nuvolos organization/space/instance, you need to specify the slugs of the organization/space/instance in the command:\
\
`nuvolos apps list --org <org_slug> --space <space_slug> --instance <instance_slug>`
{% endhint %}

### Starting a Nuvolos application

First, get the slug of the application you wish to run with the `nuvolos apps list` command,  then start the application with the `nuvolos apps start <app_slug>` command:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-13 at 15.57.40.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
If you want the command to wait until the application has starte&#x64;**,** you should specify the `--wait` flag:
{% endhint %}

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-13 at 16.08.43 (1).png" alt=""><figcaption></figcaption></figure>

This behavior is particularly useful when running a "Start app" -> "Execute command" -> "Stop app" pipeline, as you can be sure that the application will be ready to execute commands when the `nuvolos app start <app_slug> --wait` command returns.

### Starting a Nuvolos application with a different size&#x20;

You can start a Nuvolos application from the API in a different size, without needing to reconfigure it. First, you need to identify the node\_pool slug for the credit-based resource size you want to use.

{% hint style="info" %}
**Running apps on credit-based resource sizes consumes Credits.** Please check if your Nuvolos space is configured to run credit-based workloads.
{% endhint %}

You can get the list of available credit based-sizes, also termed **node pools** with the `nuvolos apps nodepools` command:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-13 at 19.46.49.png" alt=""><figcaption></figcaption></figure>

To start an app on a dedicated node from one of the node pools, add the `--node-pool="<slug>"` flag, and optionally the `--wait` flag, to the `nuvolos apps start` command:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-14 at 11.03.28.png" alt=""><figcaption></figcaption></figure>

### Executing a command in a Nuvolos application

You can run a command in a running Nuvolos application as if you had a `bash` terminal opened in the given application. This lets you create an automated workflow to execute a workload on Nuvolos. You do this by automatically starting a pre-configured application, running a program in the application, and then stopping the application when the command finishes.

To submit a command for execution, use the `nuvolos apps execute --app <app_slug> 'YOUR COMMAND'` command, like:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-14 at 11.49.33.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
**Currently, not all Nuvolos application types support running commands**. JupyterLab, VSCode (except for the versions with Airflow), Spyder, Terminal and newer RSudio apps support command execution only.&#x20;

To list these applications, select the `api_command_run:enabled` tag on the[ Add new application](../applications/create-an-application.md) screen.
{% endhint %}

#### Getting the output of the command

Upon every command execution, a new folder is created in the selected application's instance under the `/files/nuvolos_api_out` folder in a `<timestamp>_<request_id>` format, where the request  ID (`reqid`) is returned by the CLI command. A `metadata.json` file is created to store details such as the application context, submission timestamp, and the submitted command:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-14 at 11.51.12.png" alt=""><figcaption></figcaption></figure>

#### Accessing standard output and standard error <a href="#accessing-standard-output-and-standard-error" id="accessing-standard-output-and-standard-error"></a>

By default, the standard output and the standard error of your command are redirected to separate files to ensure preservation. The files are located in the folder introduced above, called `output.log` and `error.log`, respectively.

{% hint style="info" %}
`nuvolos apps execute` supports default an output redirect when exactly one command is submitted. If you submitted a command sequence (e.g. `python prepare.py && python evaluate.py`), you need to specify the files where you intend to redirect the `stdout` and `stderr` of each command. Otherwise, the results of the commands without specifications will be saved in the default location.
{% endhint %}

### Stopping Nuvolos applications

You can stop a running Nuvolos application with the command `nuvolos apps stop --app <app_slug>`:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-14 at 17.16.51.png" alt=""><figcaption></figcaption></figure>
