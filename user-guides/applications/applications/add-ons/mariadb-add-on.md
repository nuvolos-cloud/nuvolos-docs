---
description: >-
  The MariaDB add-on provides a MySQL-compatible MariaDB service running in your
  application.
---

# MariaDB add-on

This add-on provides a MariaDB 10.11 database service running on `localhost`, port 3306.

By default, a database named `nuvolos` is created, which can be accessed with the username/password `nuvolos/nuvolos`. For the database administrator password, please reach out to Nuvolos support.

The database data files are stored in the application storage area, if you delete the application, all databases will be lost.

{% hint style="info" %}
If you add a MariaDB add-on to your application, your application will start in shared mode.
{% endhint %}
