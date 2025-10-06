# Installing the CLI

### Prerequisites

To use the Nuvolos CLI, you need to create an API key first. An API Key is a password-like token that Nuvolos uses to authenticate the workloads you wish to create using the CLI or the Python API.

To create an API key, navigate to **User Settings** and click on the[ **API ACCESS**](https://app.nuvolos.cloud/user/settings/api-access) tab:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-12 at 14.32.57.png" alt=""><figcaption></figcaption></figure>

Click on the **+ ADD NEW API KEY** button. This will create a new API key.

{% hint style="info" %}
The API key is only displayed on creation! Please save it locally if you want to use the Nuvolos CLI from your own computer.
{% endhint %}

The new API key will be available and automatically configured for all Nuvolos applications you start.

You will need to have Python 3.7 or newer installed to use the CLI or the Python API.

### Installing the CLI

To install the CLI, install the `nuvolos-cli` package from PyPI with the following command:

`pip install -U nuvolos-cli`

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-12 at 15.21.06.png" alt=""><figcaption></figcaption></figure>

You can verify the installation and the availability of your API key with the `nuvolos info` command:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-12 at 15.23.48.png" alt=""><figcaption></figcaption></figure>

### Additional steps for a local install

If you are installing the CLI on your local computer, you will need to configure the CLI to use the API key you have created with the `nuvolos config --api-key <YOUR_API_KEY>` command.
