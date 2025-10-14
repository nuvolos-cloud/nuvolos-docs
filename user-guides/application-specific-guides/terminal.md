---
description: A pure terminal emulator application
---

# Terminal

The terminal application on Nuvolos is a `xterm` terminal emulator served directly in your browser. The terminal emulation runs the `bash` shell in a persistent tmux session, thus supporting long-running applications.

It also comes with persistent `conda` and `node.js` package managers (via nvm). This means, any packages that you install with these managers will persist between restarts.

## Important shortcuts and tricks

Here are some tips how to use the terminal effectively:

* **Ctrl + A**: Go to beginning of line
* **Ctrl + E**: Go to end of line
* **Ctrl + Left/Right arrow**: Move word-by-word instead of character-by-character
* **Ctrl + U**: Delete from cursor position to beginning of line
* **Ctrl + K**: Delete from cursor position to end of line
* `cd -` : Go back to last used directory

## Clipboard support

You can use `Ctrl + Shift + V` or `Shift + Insert` to paste into the terminal from your host machine's clipboard.

To copy text out from the terminal, simply highlight the text on the screen with the mouse.

## Exit the main session

When your Nuvolos app starts, a tmux session called `main` is created automatically. If you issue the `exit` command in this session, it'll kill it. This means the next time you try to open the app's window, you'll see a message

```
no sessions
```

&#x20;Currently there is no way to restart the tmux session from such a state - if you encounter this, please restart the entire app.

## Configuring tmux

You can add your own configuration at `~/.tmux.conf` . The settings will be applied on the next restart of the Nuvolos application, or you can apply them to the current session via `tmux source-file <file>`.

## Tmux cheat sheet

If you need further guidance with tmux, check out this [cheat sheet](https://phoenixnap.com/kb/tmux-cheat-sheet).

## Configuring bashrc

Nuvolos treats .bashrc slightly different than a regular Linux system. Read the [documentation ](../../features/applications/create-a-persistent-.bashrc.md)on how to set up a persistent .bashrc for your terminal application.
