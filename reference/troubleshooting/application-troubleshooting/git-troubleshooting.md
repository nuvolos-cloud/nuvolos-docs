# Git troubleshooting

On this page, we collect the typical issues related to the [Nuvolos Git integration](../../faqs.md#is-git-supported).

## I cannot clone a private repository from a running Nuvolos application

This can happen for various reasons:

1. The application runs in [shared mode](../../../features/applications/configuring-applications.md#run-in-shared-mode)
2. You have not restarted your application since you generated the SSH key
3. You're using the wrong URL for the clone command (you should use the SSH-based URL starting with `git@...` for **private** repositories instead of the HTTP-based starting with `https://...`)

## I created a new space based on a git repo, but the repository wasn't cloned

When creating a new space based on a repo, you need to pay attention to the following:

1. If you want to clone a **public** repository without [setting up your SSH key](../../faqs.md#is-git-supported), you **must** use the `https://...` clone URL. The  `git@...` will only work with a correct SSH key setup, as the protocol itself always requires the SSH key to work, regardless if the repository is private or public.
2. If you want to clone a **private** repository, you **must** [set up your SSH key](../../faqs.md#is-git-supported), and use the clone URL beginning with `git@...` .
