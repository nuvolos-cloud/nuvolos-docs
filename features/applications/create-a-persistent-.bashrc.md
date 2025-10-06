# Create a persistent .bashrc

In Nuvolos, the \~/[.bashrc](https://www.digitalocean.com/community/tutorials/bashrc-file-in-linux) file is generated automatically, and is tailored for each application. While you can edit this file, the changes will be lost once the application is restarted.

If you wish use a persistent .bashrc, you have different options based on when your instance was created:

## Bashrc locations

For instances created after 2022-02-08, Nuvolos generates a default bashrc at

```
/files/.nuvolos/.bashrc
```

We recommend not to modify this generated bashrc file. Rather, **please create a custom .bashrc** at

```
/files/.bashrc
```

The system will automatically source this latter file too when opening a new shell session.

{% hint style="info" %}
If your .bashrc does not seem to load from /files/.bashrc, it might be that your system-generated /files/.nuvolos/.bashrc file is corrupted or got deleted accidentally. In that case, you may use the location /files/.nuvolos/.bashrc directly to define your own bashrc.
{% endhint %}

## Disable core dump files

When a process crashes due to a serious failure, the operating system might create  a core dump file of the process's memory before the crash. This file can be rather large depending on the memory usage of the process.

Luckily, you can disable core dump files by issuing the following command in a bash terminal:

```
ulimit -c 0
```

{% hint style="info" %}
The ulimit command will only have affect on the terminal session where it is executed!
{% endhint %}

To make sure every terminal opened in your Nuvolos app has core dumps turned off, you can put this in to your custom .bashrc.
