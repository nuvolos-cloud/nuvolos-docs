# D-Wave Inspector

### Prerequisites

You will need a D-Wave API Key to be able to submit jobs to D-Wave Cloud. You can register for a trial account and copy your API key from[ D-Wave LEAP.](https://cloud.dwavesys.com/leap/)

Navigate to the Applications view and add a new VSCode app with the type "Code-Server 4.8.3 +D-Wave" to your working instance:

<figure><img src="../../.gitbook/assets/Screenshot 2022-11-15 at 12.34.22.png" alt=""><figcaption></figcaption></figure>

Start the app, it will create a demo script in your Files are, under the path `/files/dwave_test.py`.

Once the app is started, open a Terminal and configure your D-Wave Cloud connection with the command `dwave config create`

<figure><img src="../../.gitbook/assets/Screenshot 2022-11-15 at 12.38.31 (1).png" alt=""><figcaption></figcaption></figure>

Copy your D-Wave API key from the [LEAP dashboard](https://cloud.dwavesys.com/leap/) and paste it into the terminal prompt.

### Running your first computing job

In the terminal, once you have configured your D-Wave cloud access, run the demo Python script with `python dwave_test.py`.

The following script runs a very simple computation on D-Wave's QPU in the cloud:

```python
import dwave.systemimport dwave.inspector
from dwave.system.samplers import DWaveSampler
from dwave.system.composites import EmbeddingComposite

sampler = EmbeddingComposite(DWaveSampler())
h = {'a': -1., 'b': 2}
J = {('a', 'b'): 1.5}
response = sampler.sample_ising(h, J)

# Inspect
dwave.inspector.show(response, block=dwave.inspector.Block.FOREVER)
```

The last line of the script will open D-Wave Inspector in a new editor tab and block until CTRL+D or CTRL+C is pressed. The D-Wave Inspector application only runs until the script is terminated.
