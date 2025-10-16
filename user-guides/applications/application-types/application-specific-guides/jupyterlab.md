---
description: Tips for using JupyterLab on Nuvolos
---

# JupyterLab

## Long-running notebooks

If running notebooks via Jupyter, we recommend submitting the notebooks for computation using [papermill](https://papermill.readthedocs.io/en/latest/) and specifying an explicit logfile when executing from the Jupyter terminal. This way you can disconnect from the Jupyter application and the notebook execution can continue whilst be able to monitor run progress.

```
papermill --stdout-file /files/my_job.out --stderr-file /files/my_job.err NOTEBOOK_PATH [OUTPUT_PATH]// Some code
```

{% hint style="info" %}
Note that your Jupyter notebook wil only receive cell output updates as long as the notebook is kept open in the browser. If you reopen a notebook that is still calculating in the background, you won't receive cell output updates. This is standard Jupyter behavior, unrelated to Nuvolos. This is one of the reasons why using tools like Papermill makes sense for long-running notebooks.
{% endhint %}

## Adding a new launcher <a href="#adding-a-new-launcher" id="adding-a-new-launcher"></a>

In some cases it might be useful to have multiple conda environments inside a single JupyterLab application and be able to launch notebooks from the JupyterLab launcher with kernels that run in these environments. We recommend that the kernel specification associated with the new conda environments created is always installed into the base conda environment (and not user / system prefix) to make sure that the kernel/launcher will function well after distributing an application. Our examples below follow this convention. If you don't want to share the application, then you can also follow instructions from other sources where typically the kernel specification is installed into the user home directory. The following can be done from a JupyterLab terminal and shortly afterwards a new Launcher should appear.

#### Python <a href="#python" id="python"></a>

In this case we recommend to create a new conda environment and install a launcher **into the environment** as following:

`conda create env --name my_new_env`

`conda activate my_new_env`

`conda install ipykernel`

`ipython kernel install --prefix=/opt/conda --name "My New Env"`

#### R <a href="#r" id="r"></a>

In this case we recommend to create a new conda environment and install a launcher **into the environment** as following:

`conda create env --name my_new_env`

`conda activate my_new_env`

`conda install r-recommended r-irkernel`

`R -e 'IRkernel::installspec(prefix="/opt/conda")'`**​**

**Julia**

Once you have a working Julia installation, execute the following command in Julia REPL:

```
using Pkg
Pkg.add("IJulia")           # Install IJulia package if not already installed
using IJulia
installkernel()             # Installs the default Julia kernel spec for Jupyter
```

## Accessing a local webserver in the browser

Certain python packages come as webserver-based extensions, and you need to open them in a browser window to interact with them. Due to how Nuvolos applications are encapsulated, you cannot just start a new server process in your Nuvolos app and access it from your local browser.

Since this is a fairly common problem in many infrastructures, there is already a solution for this called [Jupyter Server Proxy](https://jupyter-server-proxy.readthedocs.io/en/latest/index.html). As an example, we'll show now how to enable [Tensorboard ](https://www.tensorflow.org/tensorboard)in your JupyterLab application.

1. Make sure you're using a JupyterLab app with version > 3.0.0
2.  Install the webserver application (in this example, Tensorboard) in JupyterLab\


    ```
    pip install tensorboard
    ```
3.  Install Jupyter Server Proxy (probably already installed)\


    ```
    pip install jupyter-server-proxy
    ```
4.  Create a new file `/opt/conda/etc/jupyter/jupyter_server_config.py` with contents\


    ```
    c.ServerProxy.servers = {
      'tensorboard': {
        'command': ['tensorboard', '--logdir', '/files/tensorboard_logdir', '--port', '{port}'],
        'timeout': 120
      }
    }
    ```
5. Restart your Nuvolos application
6.  You should see a new launcher for Tensorboard\


    <figure><img src="../../.gitbook/assets/image (97).png" alt=""><figcaption><p>Tensorboard laucnher in the Notebook section</p></figcaption></figure>
7. Run your tensorflow computation and make note of the directory of your model run. Let's assume it's called `/tmp/my_fit_1`&#x20;
8.  Create a symbolic link for your model directory with\


    ```
    ln -s /tmp/my_fit_1 /files/tensorboard_logdir
    ```

    \
    If you already have a link at `/files/tensorboard_logdir`, you'll need to remove it first with `rm /files/tensorboard_logdir`.
9. Click on the 'tensorboard' launcher to open Tensorboard pointing at your model's run directory.
10. To analyze a different run, repeat steps 7-9.

{% hint style="warning" %}
In the example, the model run output files were put under /tmp deliberately. If your application emits lots of events, any filesystem slowness will negatively impact the performance of your training. For this reason, it's recommended to put these output files on the fastest storage medium available to your application: the local SSD drive under /tmp.\
\
Note that files under /tmp are not retained between Nuvolos application restarts. For this reason, make sure to use a tool like [rsync ](https://anaconda.org/conda-forge/rsync)to move files to persistent storage whenever it's needed. Alternatively, reach out to support to get a quote on additional persistent SSD storage and use that for storing your event files.
{% endhint %}

{% hint style="info" %}
If the server application takes a lot of time to start, you might need to increase the timeout value in the example, otherwise you'll need to refresh the page periodically until the server starts.
{% endhint %}

## Creating a ploty dash application from a notebook

Make sure you have the following packages installed (we suggest to do this via `conda` from the `conda-forge` channel).

* `plotly`
* `dash`

Once these are installed, install the JupyterDash extension:

```
pip install jupyter-dash
```

After this you need to make sure that your dash application has the following logic in it:

```python
from jupyter_dash import JupyterDash
# ... your imports

# the next line is key for the application to be routed to JupyterLab properly
JupyterDash.infer_jupyter_proxy_config()

# ... your code


# now it's time to create the app object
# note that normally, you would create via app = Dash(__name__)
# here we instantiate a JupyterDash instance which already has the correct reverse proxy configuration
# you can use all normal arguments you would pass Dash to pass to JupyterDash
app = JupyterDash(__name__)

# ... your code

# run the app - the jupyterlab mode opens the app in a new tab
app.run_server(mode="jupyterlab")
```

{% hint style="info" %}
Note that this procedure relies on the dash application being run in the context of a notebook.
{% endhint %}

## Real-time kernel resource usage monitoring

JupyterLab has a great [extension ](https://github.com/jupyter-server/jupyter-resource-usage)for monitoring resource usage in real time. You can install it with

```
pip install jupyter-resource-usage
```

After installing, restart your Nuvolos application. From then on, you'll see a new metering icon on the right sidecar:

<figure><img src="../../.gitbook/assets/image (108).png" alt=""><figcaption><p>Real-time resource usage on kernel and host level in JupyterLab</p></figcaption></figure>

Whenever a notebook tab is in focus, this extension displays CPU and RAM usage for the attached kernel, and also host-level CPU and RAM utilization.&#x20;

{% hint style="info" %}
This extension requires IPyKernel version 6.10.0 or above, so it might not work in older JupyterLab versions.
{% endhint %}

## Matplotlib plots with LaTeX

If you wish to use[ LaTeX to render labels and other texts](https://matplotlib.org/stable/users/explain/text/usetex.html) when using `matplotlib`, you can install a LaTeX environment by following the instructions in our documentation:

1. [Install TinyTex](../../features/applications/install-a-software-package.md#install-tinytex)
2. Install the packages required by mathplotlib:\
   ​`tlmgr install type1cm cm-super underscore dvipng`
3. [Configure your notebook's environment](../../features/applications/install-a-software-package.md#tinytex-in-notebooks)
4. Run the notebook cell with `usetex=True` again.

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-23 at 13.28.59.png" alt=""><figcaption></figcaption></figure>
