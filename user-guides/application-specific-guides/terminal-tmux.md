---
description: Terminal emulator based on tmux
---

# Terminal \[tmux]

This terminal emulator is based on [tmux](https://man7.org/linux/man-pages/man1/tmux.1.html). Here are some useful tips for efficient use.

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

## Scroll terminal output

The easiest way to scroll up in tmux is to enter copy mode via

```
Ctrl + B, then [
```

Then you can use the arrows/mouse scroll to navigate the terminal output. You can exit copy mode by pressing `q`.

## Exit the main session

When your Nuvolos tmux app starts, a session called `main` is created automatically. If you issue the `exit` command in this session, it'll kill it. This means the next time you try to open the app's window, you'll see a message

```
no sessions
```

&#x20;Currently there is no way to restart the tmux session from such a state - if you encounter this, please restart the entire app.

## Configuring tmux

You can add your own configuration at `~/.tmux.conf` . The settings will be applied on the next restart of the Nuvolos application, or you can apply them to the current session via `tmux source-file <file>`.

## Tmux cheat sheet

If you need further guidance with tmux, check out this [cheat sheet](https://phoenixnap.com/kb/tmux-cheat-sheet).
