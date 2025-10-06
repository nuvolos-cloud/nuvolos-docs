---
description: >-
  You can set custom environment variables and secrets for Nuvolos applications
  via the web UI.
---

# Environment variables and secrets

{% hint style="info" %}
You should use secrets and environmental variables to store secret information such as database access information, API tokens, etc.

Storing secret information on the file-system is a bad security practice and might lead to inadvertent sharing of secret information.
{% endhint %}

## Environment variables

Nuvolos supports setting custom environment variables for your applications at the account level. You can configure variables in the **Settings -> Environment** tab.

<figure><img src="../.gitbook/assets/image (105).png" alt=""><figcaption></figcaption></figure>

## Secrets

Nuvolos supports setting custom secrets for your applications at the account, space and organization level. The different secrets are treated similarly within the applications, the only difference is the permissions to read, create, update and delete them.

### Account secrets

All Nuvolos users can set secrets for their account. You can configure variables and secrets in the **Settings -> Secrets** tab.

<figure><img src="../.gitbook/assets/image (102).png" alt=""><figcaption></figcaption></figure>

A good use case for account secrets is personal access tokens for third party vendors, like Hugging Face, OpenAI, etc. Any token you set at account level will be automatically available to all your apps, but only for you, and not other users in the same org/space.

### Space secrets

Nuvolos supports setting custom secrets for spaces, that are available for all members in the space who are viewers in at least one instance of the particular space.&#x20;

You can see (and configure) space secrets in the **Manage Space -> Course/Project Configuration -> Secrets** tab.

<figure><img src="../.gitbook/assets/image (69).png" alt=""><figcaption></figcaption></figure>

{% hint style="warning" %}
Only users with **Space Administrator** Role have the permission to create, update and delete space secrets.
{% endhint %}

A good example for space level secrets is connection credentials for a shared third party resource like a database server, where distinct Nuvolos users can use the same credentials. However, we generally recommend to create separate users with separate secrets on third party resource as well for better security and auditing purposes. Even in this case, many settings can be set at the space level (e.g. database hostname, port, certificate, etc.)

### Organization secrets

Nuvolos also supports setting custom secrets for a whole organization, that are available for all members in the particular orginization.

As an Organization Manager, you can configure organization secrets in the **Organization settings -> Secrets** tab from the dropdown settings menu on the dashboard.&#x20;

<figure><img src="../.gitbook/assets/image (104).png" alt=""><figcaption></figcaption></figure>

<figure><img src="../.gitbook/assets/image (113).png" alt=""><figcaption></figcaption></figure>

{% hint style="warning" %}
Only users with **Organization Manager** Role have the permission to access the **Secrets** tab, where they can create, update and delete organization secrets.
{% endhint %}

As a member of an organization, you can access organization secrets on the **Secrets** tab in the **Space configuration** menu as shown [here](environment-variables-and-secrets.md#space-secrets). Note, that on this screen all space secrets appear alongside the organization secrets that are not [overriden](environment-variables-and-secrets.md#override-policy) by space secrets.

### Override policy

In order to decide which secrets are available in a running application, an override policy is implemented as follows:

* Hierarchy level: **Organization secret < Space secret < Account secret,** where personal secrets are the highest in hierarchy.
* In case there are secrets defined with the same name on different hierarchy levels, the above defined order takes place to determine the effective secrets for a given application.&#x20;
* For example, the **Organization Manager** has set an **Organization secret** called `ACCESS_KEY`  with an arbitrary value, but you have an **Account secret** with the same name. When you launch an application in the organization with the mentioned secret set, you will notice that upon reading the environment variables, you get the value for the `ACCESS_KEY` secret that you set for your account. The similar logic applies for all other pairs of secrets in the hieararchy level.&#x20;

{% hint style="warning" %}
If you would like to avoid overriding Organization and Space secrets, always make sure to check their names [here](environment-variables-and-secrets.md#space-secrets) before creating Account secrets!
{% endhint %}

## Usage

Both variables and secrets are made available in running applications. There are slight differences in how secrets and environmental variables are treated:

* Environmental variables:&#x20;
  * Become environmental variables in running applications.
  * Values can be viewed from the Web UI.
  * Subprocesses may or may not inherit them when spawned.
* Secrets:
  * Become environmental variables in running applications.
  * Also become files that are located under the `/secrets` folder, where the filename is the secret name and the content of the file is the secret value.
  * Values cannot be viewed from the Web UI.
  * Since stored in a fix location, any spawned subprocesses are able to access them in a straightforward manner from the `/secrets`folder.

