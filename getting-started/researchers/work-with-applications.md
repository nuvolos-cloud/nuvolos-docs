## Work with applications

In Nuvolos, each application is a separate entity with a separate set of resources and environmental settings. For more detailed information, see the [Applications Guide](../../features/applications/README.md). Some important considerations:

1. You can have multiple applications of the same type (e.g. RStudio) in the same instance with different sets of packages or package versions.
2. When you [take a snapshot](../../features/snapshots/create-a-snapshot.md), applications are snapshot along with all the packages, environmental files and so on.
3. Applications can be distributed (see above).

### Create a new application

In the workflow guide, we previously created an RStudio application upon creating the space itself. Let us assume that we have changed our mind, deleted the RStudio application and now we want to add a JupyterLab application to the Master instance of the research project.

1. Navigate to the Master instance overview (from the dashboard or by changing context in the [breadcrumbs](../../features/navigate-in-nuvolos.md))
2. Click on the Applications tile or sidebar menu item.
3. Click "ADD NEW APPLICATION" and select the application you want.

{% embed url="https://www.youtube.com/watch?v=8-oiUr2NTcA" %}

### Run an application

In order to run an application, you can follow two routes:

1. Run a recent application from your dashboard.
2. Navigate to the instance of your choice and run the application directly from there.

{% embed url="https://www.youtube.com/watch?v=xW9qZCLpG6w" %}
Run an application from a project.
{% endembed %}

#### Running from dashboard

The three latest applications will appear on your dashboard. You can verify the location of the application by hovering over the start-stop button.

{% embed url="https://www.youtube.com/watch?v=NR0Bnc7xS0Y" %}
Running an application from the quick access menu on the dashboard
{% endembed %}
