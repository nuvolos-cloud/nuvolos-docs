# Dynare.jl

### Prerequisites

Nuvolos has a pre-built application with Dynare 5.3 and Julia 1.8, with the Dynare.jl package is pre-installed.

Add a new "Dynare 5.3 + Julia 1.8 + VSCode" application to your working instance in Nuvolos:

<figure><img src="../../.gitbook/assets/Screenshot 2022-12-05 at 13.10.33.png" alt=""><figcaption></figcaption></figure>

### Dynare.jl example

Start the application and create a new Julia file `dynare_demo.jl` with the following contents:

```julia
cp("/usr/local/lib/dynare/examples/example2.mod","/files/example2.mod", force=true)

using Dynare

context = @dynare "example2.mod";

using JLD2
DD = load("example2/output/example2.jld2")
```

This example will copy one of the example models provided with Dynare to the Files area (`/files` ) parse and run the calculations on the model. You can run the example either from the command line with the `julia /files/dynare_demo.jl` command, or using VSCode's debugger by pressing the `F5` key.

The output will be saved under `/files/example2/output/example2.jld2` in JLD2 format, which can be processed with the [JLD2 Julia library](https://github.com/JuliaIO/JLD2.jl).&#x20;

Plots are available under the `/files/example2/output/graphs` folder:

<figure><img src="../../.gitbook/assets/Screenshot 2022-12-05 at 13.24.05.png" alt=""><figcaption></figcaption></figure>

{% hint style="info" %}
This application does not provide a Linux X window display. The plots will not be automatically opened. You can open them with VSCode by double-clicking on the .png files in the file navigator tree view.
{% endhint %}
