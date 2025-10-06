# GPU computation

## Introduction

To enable GPU acceleration of your code, 2 conditions need to be met:

1. You need to run your application on a GPU-enabled size. By default applications on Nuvolos run on nodes that do not have a GPU card integrated, however you can scale your applications to sizes with GPU. Note that all sizes with GPUs are [credit-based](../../pricing-and-billing/pricing-structure.md#application-resource-accounting).
2. You need to make sure the application libraries are properly configured to use a GPU. The documentation below mostly addresses this topic for various frameworks, such that the application can actually use the available GPU.

### Library versions

The NVIDIA device drivers will be loaded automatically in all GPU-enabled sizes. However, depending on the software you use, additional components (e.g. CUDA toolkit) might need to be installed via conda.

If you launch an app in a GPU-enabled size on Nuvolos, the `nvidia-smi` [tool ](https://developer.nvidia.com/nvidia-system-management-interface)will be available from the command line / terminal. You can use this to check the driver version and monitor memory usage of the card.

```
$ nvidia-smi
Thu Jun  1 08:39:06 2023       
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 510.73.08    Driver Version: 510.73.08    CUDA Version: 11.6     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|                               |                      |               MIG M. |
|===============================+======================+======================|
|   0  NVIDIA A10-4Q       On   | 00000002:00:00.0 Off |                    0 |
| N/A   N/A    P0    N/A /  N/A |    333MiB /  4096MiB |     N/A      Default |
|                               |                      |                  N/A |
+-------------------------------+----------------------+----------------------+
                                                                               
+-----------------------------------------------------------------------------+
| Processes:                                                                  |
|  GPU   GI   CI        PID   Type   Process name                  GPU Memory |
|        ID   ID                                                   Usage      |
|=============================================================================|
+-----------------------------------------------------------------------------+
```

{% hint style="info" %}
Due to the underlying virtualization technology in Nuvolos, the `nvidia-smi` tool is currently unable to list processes using the GPU
{% endhint %}

Note that [nvidia-smi reports](https://stackoverflow.com/questions/53422407/different-cuda-versions-shown-by-nvcc-and-nvidia-smi) the CUDA Driver API version in its output (11.6). However, most high level machine learning frameworks utilize the CUDA Runtime API as well, and the latter is provided by the CUDA Runtime library. Most frameworks are able to automatically install the required version of the runtime, so if you start from scratch, this should not be difficult to set up.

Please find below some examples on how to get started with GPU computations on Nuvolos or consult directly the relevant machine learning library documentation. If you require additional support, please reach out to our team directly.

### GPU monitoring

We recommend to use the nvitop package to interactively monitor GPU usage. You can install it with

```
conda install -c conda-forge nvitop
```

<figure><img src="../../.gitbook/assets/image (141).png" alt=""><figcaption><p>Monitoring with nvitop</p></figcaption></figure>

{% hint style="info" %}
Due to the underlying virtualization technology in Nuvolos, the`nvitop`tool cannot load the details of the processes using the GPU
{% endhint %}

### Large Language Models

A few useful guidelines for running LLMs on Nuvolos:

* Always assess first your VRAM requirements. A helpful estimator can be found here: [https://huggingface.co/docs/accelerate/main/en/usage\_guides/model\_size\_estimator](https://huggingface.co/docs/accelerate/main/en/usage_guides/model_size_estimator)
* Try loading your models with quantized parameters first, which require less VRAM footprint. The HuggingFace transformers model has good built-in support for automatic weights quantization: [https://huggingface.co/docs/transformers/main\_classes/model#transformers.PreTrainedModel.from\_pretrained](https://huggingface.co/docs/transformers/main_classes/model#transformers.PreTrainedModel.from_pretrained)

## Python

Installing the right version of CUDA for python packages can be an overwhelming task. We recommend to always start with a new clean image, and install the high-level AI/ML Python libraries first, only afterwards install other libraries, if possible. This way, PyTorch or Tensorflow can install the exact CUDA libraries they need.

### PyTorch

In our experience, installing PyTorch with pip is better than with conda, as it won't try to overwrite system libraries:

```
pip3 install torch torchvision torchaudio
```

The above command will install PyTorch with the latest major CUDA Runtime version (12). On Nuvolos, currently all GPUs support version 12, except the the A10 card. If you wish to run your computation on A10, please install PyTorch with the older, 11 CUDA Runtime:

```
pip3 install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu118
```

You don't need to have a GPU  available in your application to install PyTorch with GPU support, it's enough to scale up to a GPU-enabled size after you're done with the installation. To test if your installation was successful, execute the following code snippet while already on a GPU-enabled size:

```
import torch

dtype = torch.float
device = torch.device("cuda")
a = torch.randn((), device=device, dtype=dtype)
```

If it completes without an error, your configuration is correct.

{% hint style="info" %}
Note that pip will install the runtime libraries needed by torch, but will **not** set up a complete developer environment that you could use from outside python (see[ official notes](https://docs.nvidia.com/cuda/cuda-quick-start-guide/index.html#pip-wheels-linux)). To use tools like nvcc from the command line, please install the [CUDA Toolkit](gpu-computation.md#cuda-toolkit) via conda instead.&#x20;
{% endhint %}

### NVCC

If you wish to compile CUDA executables with nvcc, you'll need to install the following packages as a minimum:

```
conda install -c nvidia cuda-nvcc cuda-cudart-dev
```

The [cuda-nvcc](https://anaconda.org/nvidia/cuda-nvcc) package provides the compiler binaries, the [cuda-cudart-dev](https://anaconda.org/nvidia/cuda-cudart-dev) provides the header and library files. Both packages are available in CUDA 11 and 12 versions.

### CUDA Toolkit

If you need the entire CUDA toolkit, you can also install it with conda. Recently it has changed how Nvidia ships the package with conda:

```
conda install -c nvidia cuda-toolkit
```

The package is available in both CUDA 11 and 12 versions.

### Tensorflow

To install tensorflow, we recommend using conda as tensorflow requires the cudatoolkit package.

```
conda install -c conda-forge tensorflow-gpu "cudatoolkit<=CUDA_VERSION"
```

where `CUDA_VERSION` is the version reported by `nvidia-smi`. If you don't need to use the latest version of CUDA, it's recommended to start with an older version like 11.6 to achieve compatibility with older CPU cards.

{% hint style="info" %}
We recommend to install both tensorflow and cudatoolkit from the same conda channel if possible, see notes above for cudatoolkit.
{% endhint %}

You don't need to have a GPU available in your running app to install Tensorflow wtih GPU support, it's enough to scale up to a GPU-enabled size after you're done with the installation. To test if your installation was successful, execute the following code snippet while already on a GPU-enabled size:

```
import tensorflow as tf

a = tf.constant([1, 2, 3])
print(a.device)
```

If you see an output similar to&#x20;

```
/job:localhost/replica:0/task:0/device:GPU:0
```

that ends with `GPU:0`, your configuration is correct.

## Rstudio

With Machine Learning (CUDA enabled) Rstudio images you can run GPU computations on GPU accelerated nodes. These images have the CUDA runtime / toolkit installed as well.

### XGBoost

We recommend to use the pre-built experimental binary to get started with XGBoost and R. In a terminal on a GPU node:

```
# define version used - update if needed
XGBOOST_VERSION=1.4.1
# download binary
wget https://github.com/dmlc/xgboost/releases/download/v${XGBOOST_VERSION}/xgboost_r_gpu_linux_${XGBOOST_VERSION}.tar.gz
# Install dependencies
R -q -e "install.packages(c('data.table', 'jsonlite'))"
# Install XGBoost
R CMD INSTALL ./xgboost_r_gpu_linux_${XGBOOST_VERSION}.tar.gz
```

You can test the code via the following example program: [https://rdrr.io/cran/xgboost/src/demo/gpu\_accelerated.R](https://rdrr.io/cran/xgboost/src/demo/gpu_accelerated.R)

### Tensorflow / Keras

You can use Tensorflow with GPU acceleration, by following our Tensorflow installation guide and selecting to install version = "gpu" when installing Tensorflow.
