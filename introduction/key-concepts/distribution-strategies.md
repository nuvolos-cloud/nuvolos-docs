# Distribution strategies

Nuvolos supports various distribution strategies. These are:

* Overwrite (default),
* Distribute extra and
* Clear target and replace.

## Overwrite strategy

Overwrite is the default strategy. Suppose we distribute file _a/b/text.txt_. If a file with the same name on the same path exists in the target, it gets overwritten by this distributed file. Files not existing in the target get created.

{% hint style="info" %}
The reason that overwrite is the default strategy is that it gives control to the distributor over the target, without any unintended side effects. We suggest leaving most distribution use-cases at this setting.
{% endhint %}

## Distribute extra

Distribute extra is the least intrusive strategy. Suppose we distribute file _a/b/text.txt_. If a file with the same name on the same path exists in the target, it does not get overwritten by this file. Only files not existing in the target get created.

{% hint style="warning" %}
Distribute extra is useful if you do not want to accidentally modify the target files. This is actually a rare use-case as you will not necessarily know the exact functioning of the files that you have managed to distribute.
{% endhint %}

## Clear target and replace

Clear target and replace is the most straightforward and intrusive strategy. It erases the target contents completely first, then it copies whatever was distributed.

{% hint style="info" %}
Clear target and replace is most useful if you want to guarantee that whatever you distributed runs exactly as in your environment.
{% endhint %}
