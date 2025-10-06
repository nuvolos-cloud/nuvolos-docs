---
description: >-
  The MongoDB add-on provides a MongoDB database service running in your
  application.
---

# MongoDB add-on

This add-on provides a MongoDB 5.0.2 database service running on `localhost`, port 27017.

By default, a database named `mongodb` is created, which can be accessed with the username/password `nuvolos/nuvolos`.

The database data files are stored in the application storage area, if you delete the application, all databases will be lost.

{% hint style="info" %}
If you add a MongoDB add-on to your application, your application will start in shared mode.
{% endhint %}

## Visual editor for MongoDB

If you need a simple visual editor for MongoDB, we recommend using VSCode with the [VSCode Database Extension](https://github.com/cweijan/vscode-database-client).
