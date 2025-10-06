---
description: >-
  In case your application terminates unexpectedly, you can take a few steps to
  investigate the root cause
---

# My code stopped running unexpectedly

The first thing you need to clarify is which part of the stack encountered the unexpected situation that resulted in the premature termination. Think about your local machine: an application can terminate unexpectedly due to&#x20;

* hardware failure
* OS failure (e.g. blue screen of death)
* library error (e.g. unhandled exception in Tensorflow)
* unhandled exception in the code you created

Let's see how to identify and troubleshoot these layers

## My Nuvolos application terminated unexpectedly

If you find you application in a stopped state while you expected it to be running, you can think about it as if your code hit a hardware or OS failure. There could be the following reasons behind:

1. The app was [inactive long enough](../../../features/applications/long-running-applications.md) so that the system stopped it.
2. The main application encountered an unhandled exception. For example, a fatal JupyterLab bug was triggered, causing the entire JupyterLab server backend to shut down. The system automatically restarts such failed backends, but it cannot automatically resume executing the code that it was running at the time of the exception. Thus, the application will be idle after the restart, which can affect its [inactivity limit](../../../features/applications/long-running-applications.md#automatic-stopping-due-to-inactivity).
3. The main application (e.g. JupyterLab) allocated more RAM than it's [CU limit](../../../pricing-and-billing/nuvolos-compute-units-ncus.md#ncu-definition). This is called an out-of-memory (OOM) error. Again, the system will try to restart the main application, but will shut down in case it's unable to restart it.

In all cases, if your application stopped altogether, it makes sense to investigate the [session logs](../../../features/applications/sessions/session-logs.md) first. You might find guidance about what caused the main process to stop. Also, the [sessions page](../../../features/applications/sessions/) will tell you who stopped the application and when.

## My code stopped running in my Nuvolos app

In this case, you find your Nuvolos app running, but the code inside has stopped unexpectedly. Here, there are also multiple possible reasons:

1. The code encountered an unhandled exception. Most programming languages provide an error message with a stack trace about such exceptions. You can use an AI tool or traditional online search to investigate what has caused the issue.
2. The code was killed due to out-of-memory (OOM kill). In this case, the process that you started was killed by the operating system because it was over allocating memory. If you suspect your process might need more RAM that it currently has access to, consider scaling up to a [larger size](../../../features/applications/application-resources.md#size-and-price-of-an-application) and check if the unexpected stopping persists.
3. The code crashed due to a critical error like segmentation fault. In such cases, you'll typically find a core dump file somewhere on the filesystem named `core.<pid>`, unless you [explicitly disabled it](../../../features/applications/create-a-persistent-.bashrc.md#disable-core-dump-files).

In all of these cases, you'll want to examine the error message or the core dump file, to understand more about the nature of the problem.

### Reading a core dump file

You can get valuable info by examining your core dump file using [gdb](https://en.wikipedia.org/wiki/GNU_Debugger) or similar tools:

1. Check if you already have gdb installed in your Nuvolos app with `gdb -h`&#x20;
   1. If not, install it with `conda install gdb`&#x20;
2. Use the file command to find the path of the process that created the core dump file\
   E.g. `file core.144` \
   The response will contain a part like this: `..., execfn: '<executable_path>', ...` \
   Copy the executable path.
3. Open the core dump file in gdb with the same executable that generated it:\
   `gdb <executable_path> core.144` \
   You'll probably need to press Enter a few times to get to the bottom, which will display which call triggered the crash. Example:

```
Program terminated with signal SIGSEGV, Segmentation fault.
#0 0x00007f6ccb4700f8 in cpp_isConstant(Rcpp::Vector<14, Rcpp::PreserveStorage>) ()
from /usr/local/lib/R/site-library/fixest/libs/fixest.so
[Current thread is 1 (Thread 0x7f6ce63c1320 (LWP 130))]
```

In the above example, we could find from the core file which R library is responsible for the crash (fixest).

{% hint style="info" %}
Core dump files can easily take up GBs of storage space. Once you don't need them anymore, remove them to avoid [exhausting your quota](../../../features/file-system-and-storage/#quota-usage).
{% endhint %}
