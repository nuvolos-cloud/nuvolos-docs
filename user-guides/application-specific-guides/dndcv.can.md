# DNDCv.CAN

**(Non-commercial academic use only)**

DNDC (i.e., DeNitrification-DeComposition) is a computer simulation model of carbon and nitrogen biogeochemistry in agro-ecosystems. The model can be used for predicting crop growth, soil temperature and moisture regimes, soil carbon dynamics, nitrogen leaching, and emissions of trace gases including nitrous oxide (N2O), nitric oxide (NO), dinitrogen (N2), ammonia (NH3), methane (CH4) and carbon dioxide (CO2).

### Application setup

This Nuvolos application starts a VSCode environment and has WineHQ 9.1 installed in it. Python 3.11 is also installed in a conda environment. VSCode has useful extensions installed, such as Python, Jupyter, and PyLint.

### User's Guide

For more information on the model and its applications, please refer to the [DNDC 9.5 User's Guide](http://www.dndc.sr.unh.edu/model/GuideDNDC95.pdf) document.

### How to start DNDCv.CAN:

Please open a new terminal tab in the VSCode environment and enter the following command:

```bash
wine start /unix /DNDC/DNDC95.exe
```



<figure><img src="../../.gitbook/assets/Screenshot 2024-02-09 at 09.44.57.png" alt=""><figcaption></figcaption></figure>

The F: drive is mapped to the `/files` area in Nuvolos, the H: drive is mapped to `~`, the personal area in Nuvolos:

<figure><img src="../../.gitbook/assets/Screenshot 2024-02-10 at 11.12.52.png" alt=""><figcaption></figcaption></figure>
