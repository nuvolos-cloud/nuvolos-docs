---
description: Tips and tricks for VS Code applications on Nuvolos
---

# VSCode

VSCode applications are available on Nuvolos as the suggested GUI integrated development environment for Python. All VS Code applications come with a `conda` environment already in place in which you can [install your required packages](../../features/applications/install-a-software-package.md).

## Installing VSCode extensions

Nuvolos runs [code-server](https://github.com/coder/code-server) in VSCode applications, which is a server-based fork of the traditional VSCode app. It comes with its own marketplace, so not every extension you find at [https://marketplace.visualstudio.com/](https://marketplace.visualstudio.com/) will be available in the extension browser of the Nuvolos app.

However, most extensions are made available on GitHub and other sources as .vsix files. Once you have downloaded the .vsix file, you can easily add it to code-server:

1. Upload the .vsix file to Nuvolos
2.  Use the **Install from VSIX** option in the app to install from the .vsix file\


    <figure><img src="../../.gitbook/assets/image (64).png" alt=""><figcaption><p>Use Install from VSIX to install from binaries</p></figcaption></figure>

## Persistent terminal sessions

By default, VSCode terminals are vanilla Bash sessions on Nuvolos, which are prone to stop when not used for a longer while. If you plan to run shell commands for hours and want to monitor their output, it's recommended to use [tmux](https://man7.org/linux/man-pages/man1/tmux.1.html) or screen.

### Set tmux as your default terminal

You can configure tmux as your default terminal in VSCode with the following steps

1. Verify with the command `which tmux` if tmux is installed already. If not, you can install it with `conda install tmux`
2. In VSCode, press `Ctrl + Shift + P` and search for `Open User Settings (JSON)`&#x20;
3. In the opened JSON, add the following block

```
"terminal.integrated.profiles.linux": {
    "tmux": {
        "path": "tmux",
        "args": ["new-session", "-A", "-s", "${workspaceFolder}"],
        "icon": "terminal-tmux",
    },
},
"terminal.integrated.defaultProfile.linux": "tmux",
```

Now every time you open a new terminal, it'll be by default a tmux session. Every [workspace folder](https://code.visualstudio.com/docs/editing/workspaces/workspaces) will have a different named session with the above configuration, e.g.:

1. You can open folder `ABC` in VSCode and start a new terminal, start a long-running script there
2. Change workspace folder to `DEF` in VSCode and start a new terminal. You'll get a different tmux session here
3. Change back to folder `ABC` in VSCode. If you open a terminal, you should see the outputs of your long-running script

## Interactive Python development

The VS Code application is an excellent interactive development environment. You can find a detailed and complete guide for interactive development with IPython [here](https://code.visualstudio.com/docs/python/jupyter-support-py), the following documentation helps you get started quickly in the context of the Nuvolos apps.

### Creating an interactive IPython window in VS Code

VS Code comes equipped with a conda package manager. In order to be able to start interactive IPython windows, you will first need to install some packages into the VS Code app. To do so, take the following steps:

1. Open a VS Code command prompt either by finding **View > Command Palette** in the menu, or by hitting the **Ctrl + Shift + P** key combination.\

2. In the VS Code command palette, type Jupyter: Create and the autocomplete should offer you the Create Interactive Window option.\

3. You might be prompted to install ipykernel, in this case proceed to do so (this might take a minute or so to complete).\
   \
   **If you have omitted step 3, you can later:**\

4. Open a terminal in VS Code. You can do this by finding **Terminal > New Terminal** in the menu or hitting the **Ctrl + Shift + \`** key combination. In the terminal type `conda install --freeze-installed ipykernel` and wait for the process to complete. After that, you should be able to perform steps 1 and 2 without any further issues.

## Accessing a local webserver in the browser

Sometimes you need to work with a local webserver in your VSCode application (e.g. view tensorboard or a streamlit app). Due to how Nuvolos applications are encapsulated, you cannot just start a new server processes in your Nuvolos app and access it from your local browser.

The good news is that VSCode can automatically set up the solution for this problem, called port forwarding. This means, all you need to do is start your local webserver, and VSCode will automatically expose it for you. You can check under the **ports** tab what kind of forwardings VSCode has created.

Example: open a terminal and execute `python3 -m http.server 9000` in it. You'll see a pop-up in the lower right corner notifying you how to access the started webserver:

<figure><img src="../../.gitbook/assets/image (65).png" alt=""><figcaption><p>VSCode enables you to easily access local webservers via the browser</p></figcaption></figure>

You can click on the **Open in Browser** button or the ![](<../../.gitbook/assets/image (66).png>) icon on the ports tab to access your server from the browser.

## Debugging Python in VSCode

If you want to debug python scripts, VSCode is a good candidate as it has a nice visual interface to debug running code. Here are the steps to set up your environment:

1.  Install the [Python Debugger](https://open-vsx.org/extension/ms-python/debugpy) VSCode extension. Once you install it, you should have a new context menu in the debug tab:\


    <figure><img src="../../.gitbook/assets/image (138).png" alt="" width="259"><figcaption><p>The debugger tab is usually right under the Source Control tab<br></p></figcaption></figure>

    The default configuration will try to debug the file in your active editor window as a Python script.
2.  You can further tweak the debugger settings by creating your own configuration via clicking the cogwheel button next to RUN AND DEBUG:\


    <figure><img src="../../.gitbook/assets/image (139).png" alt=""><figcaption><p>Add your custom configuration to fine-tune settings<br></p></figcaption></figure>

    One typical configuration you want to configure is the current working directory (cwd) of the debugger. If your script only works when invoked from a particular directory, either hard-code it or use the `${fileDirname}` variable to set it to the folder of the launched file.\
    To learn more about debugging in VSCode, consult th documentation: [https://code.visualstudio.com/docs/editor/debugging#\_launch-configurations](https://code.visualstudio.com/docs/editor/debugging#_launch-configurations)
3.  Select your custom configuration in the dropdown\


    <figure><img src="../../.gitbook/assets/image (140).png" alt=""><figcaption><p>Custom configuration that changes the CWD to the debugged file's folder first</p></figcaption></figure>
