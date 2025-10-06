---
description: >-
  The PostgreSQL add-on provides a PostgreSQL database service running in your
  application.
---

# PostgreSQL add-on

This add-on provides a PostgreSQL 13.3 database service running on `localhost`, port 5432.

By default, a database named `nuvolos` is created, which can be accessed with the username/password `nuvolos/nuvolos`.

The database data files are stored in the application storage area, if you delete the application, all databases will be lost.

{% hint style="info" %}
If you add a PostgreSQL add-on to your application, your application will start in shared mode.
{% endhint %}

{% hint style="warning" %}
Note that you cannot have PostgreSQL and PostGIS add-ons turned on at the same time, because they listen on the same port for connections.
{% endhint %}
