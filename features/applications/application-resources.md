# Application resources

### Size and price of an application

You can configure application resources directly in the applications overview, by clicking on the **size** of the app. This allows you to set the application resources. Running applications need to be restarted after size change.

You can read more about the accounting aspect of application sizes in the [pricing structure](../../pricing-and-billing/pricing-structure.md#application-resources).

<figure><img src="../../.gitbook/assets/Screenshot 2024-04-12 at 15.02.57.png" alt=""><figcaption><p>The size column shows the set resources</p></figcaption></figure>

{% hint style="info" %}
Note that application size refers to the **compute resources** (CPU, RAM, GPU, etc.) of an application. Each application also has a space usage column, which shows how much space the **application files** are using. Space usage comes from any installed packages (conda packages, R packages, database files,  etc.)
{% endhint %}

The applications overview shows you a list of the different applications you have added previously, including their configuration version. It also shows their size, which is expressed in compute units for sizes included in your plan, and is expressed in other relevant data for credit-based sizes (e.g., for GPUs the model is indicated).

More information can always be obtained by hovering over the size infobox:

<figure><img src="../../.gitbook/assets/Screenshot 2024-04-12 at 15.03.22.png" alt=""><figcaption><p>The size infobox</p></figcaption></figure>

By default, your applications will be configured to sizes included in the plan provided by your Nuvolos subscription, based on your annual contract with us. Because Nuvolos allows flexible scaling according to your project needs, however, you can always use resources beyond the base ones provided by your subscription. These are paid for in Credits. The "Credit/hour" overview will show whether a given application will consume Credits to run, and if so, how many. For more information on Credits, refer to our documentation on the [Nuvolos pricing structure](../../pricing-and-billing/pricing-structure.md#credits).

{% hint style="info" %}
Since credit-based sizes allow instance editors to spend credits in the associated resource pool, they need to be [enabled](../../administration/space-management/hpc-spaces.md#enable-credit-based-application-sizes) in every space by a space administrator.
{% endhint %}

### Changing application resources

In order to change the size of an application before running it, click on the size infobox. This will take you to a menu showing the different options available: sizes free of charge can be found on the **Included** tab, while sizes consuming credits are on the **Credit** tab.

<figure><img src="../../.gitbook/assets/Screenshot 2024-04-12 at 15.03.45.png" alt=""><figcaption><p>The resources menu</p></figcaption></figure>

To change the size, simply select one of the configurations and click **SET**. After a few seconds, you will be automatically returned to the applications overview.

In order to assist you with selecting the desired resources, the radio buttons at the top left allow you to optimize for CPU, GPU, or storage, depending on what resource your project most needs at the time. This will provide you with different configurations to choose from.

### Other actions

Other actions, such as renaming, configuring, cloning, and exporting applications, can be performed using the **...** at the right of the application overview. This will provide you with a dropdown menu, where you can perform your desired action on the selected application:

<figure><img src="../../.gitbook/assets/Screenshot 2024-04-12 at 15.16.16.png" alt=""><figcaption><p>The actions dropdown menu</p></figcaption></figure>
