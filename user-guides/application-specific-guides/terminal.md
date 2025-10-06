---
description: A pure terminal emulator application
---

# Terminal

The terminal application on Nuvolos is a `xterm` terminal emulation served directly to your browser. The terminal emulation runs the `bash` shell.

### Changing the terminal settings

In order to change aesthetical settings to the terminal emulation, you need to edit the `/opt/conda/ttyd/settings.yml` file. A minimal example to configure the font size:

```
settings:
    fontSize: 28
```

* The possible settings in this file are documented [here](https://xtermjs.org/docs/api/terminal/interfaces/iterminaloptions/). Some explanation on the settings can be found [here](https://github.com/xtermjs/xterm.js/blob/master/typings/xterm.d.ts).
* The changes take place after doing a full page reload in your browser or restarting the application.

### Configuring bashrc

Nuvolos treats .bashrc slightly different than a regular Linux system. Read the [documentation ](../../features/applications/create-a-persistent-.bashrc.md)on how to set up a persistent .bashrc for your terminal application.
