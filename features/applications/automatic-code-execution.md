# Automatic code execution

Nuvolos support automated code execution upon app startup. This can be useful if you want to run some initialization steps upon each startup, or if you want to automatically start a calculation on app startup.

You can define a **startup.sh** file in the workspace (inside the running userapp, it will be located at /files/startup.sh) that will be automatically executed in the background via bash upon app startup.

{% hint style="info" %}
The startup.sh bash script will be execute in the background, as a separate process. Thus, you cannot directly modify properties of the main application from it (e.g. visual editor font size, etc.). For such a use-case, consult the documentation of the application how to define command executed on each startup.
{% endhint %}

The stdout and stderr streams of the script are redirected to **/files/startup.log**, so the progress of the script can be tracked via its output in real time.
