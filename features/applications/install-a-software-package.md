# Install a software package

In Nuvolos, almost all applications are equipped with conda environments and we also let our users load user-written packages and extensions.

## Basic provisions

All Nuvolos applications come with a set of useful \*nix applications pre-installed:

* git
* git-lfs
* vim
* build-essential (includes make)
* xterm for GUI based applications for terminal emulation
* Nuvolos data connectors for supported languages

## The conda environment

Most Nuvolos applications come equipped with the package manager [conda](https://docs.conda.io/en/latest/), and more recent applications alias conda to a faster drop-in replacement called [mamba](https://github.com/mamba-org/mamba). Conda is a language-agnostic package manager which lets you install language-specific packages and system libraries as a non-root user. For the Python language, most packages available via **pip** can also be installed via **conda**.

{% hint style="info" %}
Try to install software with **conda** first and keep **pip** as a fallback option. Exception to this rule are GPU related libraries, please consult our [GPU documentation](../../user-guides/research-guides/gpu-computation.md) on the topic.&#x20;

We also recommend passing the '--freeze-installed' flag when installing with conda, to ensure the minimal possible changes to the conda environment.

If you cannot self-service your packages, contact us at [**support@nuvolos.cloud**](mailto:support@nuvolos.cloud) and we will help you.
{% endhint %}

As an example, suppose you want to install [imagemagick](https://anaconda.org/conda-forge/imagemagick) and [gifsicle](https://anaconda.org/conda-forge/gifsicle) for mass editing gifs. The following command will install this to the conda environment of your application:

```
conda install --freeze-installed gifsicle imagemagick
```

{% hint style="success" %}
When distributing and snapshotting an application, the contents of the conda environment are also impacted. This is a key feature for reproducibility.
{% endhint %}

## LaTeX

The most widespread installers of TeXLive require root privileges to install TeX, and thus won't work with Nuvolos applications. You have a handful of options to work with TeX on Nuvolos:

1. You can install Overleaf as a standalone Nuvolos application
2. You can install various JupyterLab versions with TeX preinstalled (search by the tag `language:latex`)
3. You can install TeX using [TinyTex](https://yihui.org/tinytex/)

### Install TinyTeX

Open a terminal in your application, and execute the following command:

```bash
export TINYTEX_DIR=${CONDA_DIR:-~} && wget -qO- "https://yihui.org/tinytex/install-bin-unix.sh" | sh && if [ -f /files/.nuvolos/.bashrc ]; then echo "PATH=$TINYTEX_DIR/.TinyTeX/bin/x86_64-linux:$PATH" >> /files/.bashrc; else echo "PATH=$TINYTEX_DIR/.TinyTeX/bin/x86_64-linux:$PATH" >> /files/.nuvolos/.bashrc; fi && export PATH=$TINYTEX_DIR/.TinyTeX/bin/x86_64-linux:$PATH && echo "Successfully installed TinyTex"
```

{% hint style="info" %}
If your application has a conda environment, TinyTeX will be installed next to it, and that means your TeX environment will be snapshotted/distributed along with your regular conda packages
{% endhint %}

TinyTex installs by default a lightweight TeX distribution. You can use tlmgr to install additional [TeX packages](https://www.ctan.org/pkg) you need, e.g.

```bash
tlmgr install collection-fontsrecommended
```

You can list available collections with

```
tlmgr info --list collections
```

and schemes with&#x20;

```
tlmgr info --list schemes
```

### TinyTeX in notebooks

To use TeX from notebooks, you'll probably need to execute the following command in one of the first cells of your notebook

```python
import os
os.environ['PATH'] = f"{os.environ.get('CONDA_DIR') or os.path.expanduser('~')}/.TinyTeX/bin/x86_64-linux:{os.environ['PATH']}"
```

## Tips and tricks

### Single-purpose applications

{% hint style="info" %}
We strongly suggest creating single-purpose applications.&#x20;
{% endhint %}

This practice has the following benefits:

1. Conda or R package environments remain monolithic and fairly lightweight. Adding more and more packages to the same environment will inevitable result in an unmanageable environment.
2. Distribution and snapshotting takes less storage and resources and conclude faster.

### Create a new application instead of upgrading

{% hint style="info" %}
If you are contemplating doing a major version update on your application, we suggest creating a new app in the same instance and starting there from scratch.
{% endhint %}

This practice has the following benefits:

1. Conda environments can break after major updates.
2. The reproducibility of your work may suffer - however it is trivial to maintain two monolithic and separate application structures in parallel, even in the same instance!
3. Distribution is based on filesystem-differences and after-upgrade distributions may become less stable due to the massive number of changes occurring on the filesystem.

##
