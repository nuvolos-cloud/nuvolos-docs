# I can't create an application

#### If you're having problems creating a new application, here are some potential causes:

* **You do not have permission to create an application.**

In order to create an application in an instance, the user must be the instance editor. If you don't have the required role to create an application, you can ask the instance editor to do it, or you can create the application in one of the instances of which you are the editor.

* **You followed the wrong steps for creating an application.**

Make sure you follow the correct steps required for creating an application. For more details, check [here](../../../features/applications/create-an-application.md).

* **You are in the Distributed instance.**

A special instance called 'Distributed' exists in each space. This instance contains a list of all snapshots that were shared with other members of the space. You cannot create an application from within the Distributed instance. Make sure you open any of the other instances where you are an editor to be able to create an application.

* **You are not in CURRENT STATE.**

An application can be created only from within the current state of your instance. Make sure that you navigate to CURRENT STATE in order to be able to create an application.

![](<../../../.gitbook/assets/Screen Shot 2020-06-11 at 9.25.56 AM (2).png>)

* **You have lost connection to the internet.**

If you lose your internet connection, your request to create an application might not be received by the server. Make sure you restore your connection, refresh the page, and try to create the application again.

* **There has been a server-side error and the application creation request was not properly processed by Nuvolos.**

In some cases, it might happen that a server-side error occurs such that the request to create an application is not processed properly by the server. Please wait for some time and then try to create the application again.

#### &#x20;None of these solutions worked - how to proceed?

If none of the above solutions worked, please contact [**support@nuvolos.cloud**](mailto:support@nuvolos.cloud)**.**
