# CloudBeaver

CloudBeaver is a lightweight web application designed for comprehensive data management. It allows you to work with various data sources, including SQL, NoSQL, and cloud databases, all through a single secure cloud solution accessible via a browser.

## Saving connection details

CloudBeaver runs on Nuvolos in anonymous mode (since authentication is handled by Nuvolos itself). This has the consequence that any connections added in the Private project will not persist between application restarts. To create a connection that persists, use the **Shared** project:

<figure><img src="../../.gitbook/assets/Screenshot 2024-12-19 143135.png" alt=""><figcaption><p>Use Shared project setting when creating new connection</p></figcaption></figure>

{% hint style="info" %}
If you create a new connection in the Shared project, any user having access to the application (Instance Editors and Space Admins) will be able to see it.
{% endhint %}

