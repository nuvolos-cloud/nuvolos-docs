# Claude Code

The [Claude Code](https://docs.claude.com/en/docs/claude-code/overview) Nuvolos application enables you to install the popular AI Agent with one click. It is based on the Terminal application and supports long-running sessions.

## Authentication

Claude Code currently enforces a mandatory first-time setup procedure, which means it's not enough to configure the `ANTHROPIC_API_KEY` environment variable alone (although, claude will accept the environment variable without a first-time setup, when used in non-interactive mode: `claude -p your_prompt_here`).&#x20;

### Configuration files

Claude stores your authentication setup in your HOME folder, in a `~/.claude.json`  file. This means, every user using the same Claude app must authenticate themselves independently, when using the very same Nuvolos app.

If you need to, you can run the application in Shared mode. In this case, every Nuvolos user can use the same running application, with the same authentication setup. However, connecting with different users to the same tmux session can yield unexpected results, so use this at your own discretion.

### Skip first-time setup

As the results of the first-time setup configurations are stored in the `~/.claude.json` file, you can distribute this file from your Personal folder along with the Claude app to other instances to skip subsequent first-time setups.

