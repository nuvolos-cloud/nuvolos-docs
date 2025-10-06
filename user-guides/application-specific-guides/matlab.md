# MATLAB

MATLAB constructs like [parfor ](https://www.mathworks.com/help/parallel-computing/parfor.html)can be leveraged in applications using local [parallel pools](https://www.mathworks.com/help/parallel-computing/parpool.html).\
Nuvolos will configure MATLAB to use the appropriate number of CPUs automatically, so you can start your parpool simply with the command:

```
pp = parpool('local');
```

The pool will be deleted after 30 minutes of idle time or with an application restart. To delete it manually, use

```
pp.delete()
```

### Issue with starting the parallel pool

You might have encountered lately the following error message in MATLAB on Nuvolos when starting a new parallel pool:

> Mismatch between number of environment names and values

This is due to a recent change by MathWorks regarding the online login process. The workaround is to issue the following command in the MATLAB terminal:

```
parallel.internal.mwa.ensureLoggedIn()
```

This will open up a dialog where you need to enter again your MathWorks credentials. After that, MATLAB will be able to start the parallel pool.

{% hint style="info" %}
You might not see a blinking cursor in the textbox for your credentials in the popup, but you can still type there.
{% endhint %}
