# I can't create a snapshot

#### If you're having problems creating a new snapshot, here are some potential causes you might want to examine:

* **You do not have the permission to create a snapshot**

In order to create a snapshot in an instance, the user must be an instance editor. If you don't have the required role to create a snapshot, you can ask the instance editor to do it, or arrange an invitation to become an instance editor which will allow you to create a snapshot.

* **You have reached the maximum number of snapshots allowed.**

Nuvolos users might have a limit on the maximum number of snapshots that they can create. If you reach the limit, then you can either delete old and unnecessary snapshots or contact the space administrator to negotiate a higher limit.

* **You followed the wrong steps for creating a snapshot**

Make sure you follow the correct steps required for creating a snapshot. For more details, check [here](../../../features/snapshots/create-a-snapshot.md).

* **You are in Distributed instance.**

A special instance exists in each space and takes the name Distributed. This instance contains a list of all snapshots that you shared with other members of the space. You cannot create a snapshot from within the Distributed instance. Make sure you open any of the other instances where you are an editor to be able to create a snapshot.

* You are not in **CURRENT STATE**.

A snapshot can be created only from within the current state of your instance. Make sure that you navigate to CURRENT STATE in order to be able to create a snapshot.

![](<../../../.gitbook/assets/Screen Shot 2020-06-11 at 9.25.56 AM (1).png>)

* **You have lost connection to the internet.**

If you lose your internet connection, your request to create a snapshot might not be received by the server. Make sure you restore your connection, refresh the page, and try to create the snapshot again.

* **There has been a server-side error and the snapshot creation request was not properly processed by Nuvolos.**

In some cases, it might happen that a server-side error occurs such that the request to create a snapshot is not processed properly by the server. Please wait for some time and then try to create the snapshot again.

#### &#x20;None of these solutions worked - how to proceed?

If none of the above solutions worked, please contact [**support@nuvolos.cloud**](mailto:support@nuvolos.cloud)**.**
