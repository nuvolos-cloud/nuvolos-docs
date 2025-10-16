# RStudio

For Rstudio we recommend using the 'Local Jobs' feature to run jobs in the background. This way you can submit multiple jobs whilst also making sure the job continues to run if you navigate away from Rstudio without blocking the interface.

[Learn more about local jobs in Rstudio](https://github.com/rstudio/webinars/blob/master/74-background-jobs/slides.pdf).

## Recovering an unresponsive RStudio session

In certain cases RStudio sessions can become unresponsive, due to large amounts of output printed or large amount of data loaded. If restarting the application in Nuvolos doesn't resolve the issue, you can follow the steps in the [Application Troubleshooting](../../faqs/troubleshooting/application-troubleshooting/) guide to clear the application state.

## RStudio is responsive but it doesn't accept commands

If you can interact with the RStudio window (menu items are working, dropdowns open, etc.) but commands you try to run in R will not execute, it might be that the R console is showing a plus sign at the start of the line:

![R waiting for further input](<../../.gitbook/assets/Screenshot 2021-10-31 103625.png>)

If this is the case, R is waiting for further input. As you can see in the above example, a curly brace was open, and R waits the curly brace to be closed for the expression to be complete (and executable).

If you want to cancel the statement, make sure to focus on the R console in RStudio by clicking on it, then hit the Escape button on your keyboard.

![After the cancelled statement](<../../.gitbook/assets/Screenshot 2021-10-31 103918.png>)

## Using Tensorflow and Keras with RStudio

Tensorflow and Keras can be installed via miniconda in Rstudio. To install them, use the following steps:

1. Restart the R session to be in a clean setting (select Session > Quit Session on the top menu)
2. Make sure reticulate can use miniconda via running in the R commands:

```
Sys.setenv("RETICULATE_MINICONDA_ENABLED" = TRUE)
reticulate::install_miniconda()
```

3\. Install tensorflow R package and then call the `install_tensorflow()` function. If you would like to use GPU acceleration, run `install_tensorflow(version="gpu")`:

```
install.packages("tensorflow") 
library(tensorflow)
install_tensorflow() # use install_tensorflow(version = "gpu") for GPU support
```

4\. Install Keras R package and then call the install\_keras() function:

```
install.packages("keras")
library(keras)
install_keras()
```

To test the installation, follow the example from the RStudio website: [https://tensorflow.rstudio.com/guide/keras/#mnist-example](https://tensorflow.rstudio.com/guide/keras/#mnist-example)

### GitHub CoPilot with RStudio

Starting from RStudio app version R 4.3.2 with RStudio 2023.09, the GitHub CoPilot integration is configurable in Global Options:

<figure><img src="../../.gitbook/assets/Screenshot 2023-11-06 at 20.36.31.png" alt=""><figcaption></figcaption></figure>
