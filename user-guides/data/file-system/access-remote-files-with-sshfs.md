# Access remote files with SSHFS

In Nuvolos applications, you can access files stored on your server via a secure SSH connection and use them as if they were on the file system of the Nuvolos application.

## Prerequisites

### Create a personal SSH key

To be able to authenticate with your server using SSH, you will need to create an SSH key in Nuvolos and add the generated public key to the `authorized_keys` file on your server to accept the newly generated SSH key. Under Linux systems, the file is usually located under `~/.ssh/authorized_keys` .

To do this, [go to your account settings](https://app.nuvolos.cloud/user/settings/profile) and click on the _SSH Keys_ tab. Click on the _Generate SSH Key_ button to create an SSH key:

<figure><img src="../../.gitbook/assets/ssh_keys.png" alt=""><figcaption></figcaption></figure>

Nuvolos will automatically try all of your SSH keys when using SSHFS.

### Create a shared SSH key

If you want to use the same SSH key for connecting from a specific space with different users, you can use the [space secrets](../environment-variables-and-secrets.md#space-secrets) feature of Nuvolos. If you set secrets with the following names, they'll be tried  as private keys during SSHFS connection phase:

* id\_rsa
* id\_dsa
* id\_ecdsa

{% hint style="info" %}
The key type does not need to match the filename (e.g. a RSA key can be put under id\_dsa), but it's important to use all lowercase for the above names. Also, make sure to add a **trailing new line** after the -----END OPENSSH PRIVATE KEY---— line when setting the secret.
{% endhint %}

### Configure the connection using environment variables

Next, set the following environment variables, either on a user level in your [Nuvolos user settings](https://app.nuvolos.cloud/user/settings/env-vars) or on a space/organization level in the space/organization settings:

* `SSHFS_USER`: The username to use when connecting with the remote host. (default: Nuvolos username)
* `SSHFS_PORT`: The port to connect on to the remote host. (default: 22)
* `SSHFS_SERVER`: The SSH server Nuvolos applications will connect to.
* `SSHFS_REMOTE_PATH`: The path on the remote SSH server to be mounted. Use full path and avoid \~ as it will be expanded on Nuvolos, not the remote.

<figure><img src="../../.gitbook/assets/Screenshot 2025-01-07 at 15.16.58.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screenshot 2025-01-07 at 15.18.04.png" alt=""><figcaption></figcaption></figure>

## Debugging SSHFS connection

If you have trouble setting up your connection, you can set the `SSHFS_DEBUG` environment variable to 1 using [space level](../environment-variables-and-secrets.md#space-secrets) or [account](../environment-variables-and-secrets.md#account-secrets) secrets. This will enable verbose logging in the SSHFS sidecar, and you can check the [logs for your session](../applications/sessions/session-logs.md) to troubleshoot.&#x20;

## Configuring your Nuvolos application

The SSHFS add-on can be added on the application configuration screen to an application:\


<figure><img src="../../.gitbook/assets/Screenshot 2024-06-07 at 12.24.11.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
Please restart your application, if it is currently running, for the changes to take effect.
{% endhint %}

## Accessing remote files

Once the prerequisite configuration has been done and the applications have been also configured to use SSHFS, you can start your Nuvolos application.&#x20;

The files from the remote server will be accessible under the path `/sshfs`. If you wish to use a different path, please reach out to Nuvolos support.
