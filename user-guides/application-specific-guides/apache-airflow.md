# Apache Airflow

For researchers who require scheduled workflows, Nuvolos supports Airflow as a self-service application. Airflow runs inside a JupyterLab application, making it easy to edit Airflow DAG files, install packages and use the Nuvolos filesystem for data processing.

The JupyterLab application is collaborative, so DAGs can be worked on simultaneously by multiple users in a "Google Docs"-like fashion.

### Configuration

DAGs should be created as Python files in the `/files/airflow/dags` folder, [refer to Airflow documentation](https://airflow.apache.org/docs/apache-airflow/stable/tutorial.html) for an example.

#### Setting up your first DAG

1. Create a new Python file named `/files/airflow/dags/tutorial.py` and copy the contents of the tutorial DAG from [the Airflow tutorial](https://airflow.apache.org/docs/apache-airflow/stable/tutorial.html#example-pipeline-definition).
2. Click on the Airflow tab and click on the All DAGs filter selector on the UI, the DAG should show up on the list like on the screenshot below. It can take up to a minute for the DAG to show up on the list, as Airflow is periodically scanning Python files the `/files/airflow/dags` folder for new DAG definitions.
3. Click on the slider toggle next to the `tutorial` DAG name to enable the DAG and start the first execution.
4. You should quickly see that the DAG has executed successfully by seeing a _1_ in a green circle in the _Runs_ column.

![](<../../.gitbook/assets/Screenshot 2021-11-02 at 10.31.07.png>)

Airlfow Connections and Variables can be configured on the Airflow UI.

Airflow on Nuvolos uses a CeleryExecutor back-end to be able to execute tasks in parallel.

### Installing packages

To install packages used in DAGs, simply open a JupyterLab terminal and pip / conda / mamba install the required package. Please refer to the [Install a software package](../../features/applications/install-a-software-package.md) chapter of our documentation for detailed instructions.

### Logs

Task execution, scheduler and DAG bag update logs are in `/files/airflow/logs`.

### Saving data to Nuvolos

The following example illustrates how to create a DAG that downloads CSV data from an API, saves the data as a compressed Parquet file and uploads the data as a Nuvolos table.

{% hint style="info" %}
Airflow will use the database credentials of the user starting the application.
{% endhint %}

#### Prerequisites

1. Create a new Airflow application in your working instance and start the application.
2. Once Airflow starts, open a new terminal tab and run the following commands to install package dependencies:
   1. `mamba install -y --freeze-installed -c conda-forge pandas-datareader`
   2. `mamba install -y --freeze-installed -c conda-forge pyarrow`

Once the setup is complete, the following script should be saved as the file `/files/airflow/dags/csv_to_nuvolos`:

```python
""" Example DAG to demonstrate how to download a time series as a CSV file, 
convert it to Parquet then upload it to Nuvolos. """
from datetime import datetime, timedelta

from airflow import DAG
from airflow.operators.python_operator import PythonOperator
from airflow.models import Variable


def export_to_parquet(series, start, end):
    """ Downloads a time-series from St. Luis FRED and exports it as a Parquet file. """
    import pandas_datareader as pdr

    df = pdr.get_data_fred(series, start=datetime.strptime(start, "%Y-%m-%d"), end=datetime.strptime(end, "%Y-%m-%d"))
    df.reset_index(inplace=True)
    df.to_parquet("/files/fred_data.parquet")
    

def upload_data():
    from nuvolos import get_connection, to_sql
    import pandas as pd
    
    df = pd.read_parquet("/files/fred_data.parquet")
    with get_connection() as conn:
        to_sql(df=df, name="fred_data", con=conn, if_exists='replace', index=False)


default_args = {
    'owner': 'airflow',
    'depends_on_past': False,
    'email': ['airflow@example.com'],
    'email_on_failure': False,
    'email_on_retry': False,
    'retries': 1,
    'retry_delay': timedelta(minutes=5),
}

with DAG(
    'csv_to_nuvolos',
    default_args=default_args,
    description='CSV upload to Nuvolos example DAG',
    schedule_interval=None,
    start_date=datetime(2021, 1, 1),
    catchup=False,
    tags=['example'],
) as dag:
    
    t1 = PythonOperator(
        task_id='export_to_parquet',
        python_callable=export_to_parquet,
        op_kwargs = {
            "series" : ['TB3MS'],
            "start" : "1934-01-01",
            "end" : "2021-10-01"
        },
    )
    t1.doc_md = """#### FRED data download
Downloads time-series data from FRED and saves them to /files/fred_data.parquet.
"""

    t2 = PythonOperator(
        task_id='upload_to_nuvolos',
        python_callable=upload_data
    )
    t2.doc_md = """#### Data upload to Nuvolos
Uses the [to_sql function](https://docs.nuvolos.cloud/data/upload-data-to-nuvolos#1.-python) of the Nuvolos connector to upload the data as a Nuvolos table.
"""
    t1 >> t2
```

Save the file, a new DAG should show up within a couple of seconds on the Airflow tab. Click on the slider toggle next to the `csv_to_nuvolos` DAG name to enable the DAG:

![](<../../.gitbook/assets/Screenshot 2021-11-09 at 15.45.43.png>)

Click on the blue "play" icon to trigger the execution of the DAG. Click on the name of the DAG to see the progress:

![](<../../.gitbook/assets/Screenshot 2021-11-09 at 15.48.26.png>)

When all steps run to success, they show up dark green in Airflow. You can now check the resulting table in the Tables view:

![](<../../.gitbook/assets/Screenshot 2021-11-09 at 15.51.06.png>)

### Airflow with VSCode

Airlfow is now also available bundled with VSCode, which makes developing DAGs easier. To use Airflow with VSCode, please select the latest version of the "Airflow + Code-server + Python" app from the Airflow application type:

<figure><img src="../../.gitbook/assets/Screenshot 2022-11-03 at 13.31.14.png" alt=""><figcaption></figcaption></figure>

Next, when the application launches, open the Command Palette with `Ctrl + Shift + P` or `Command + Shift + P` on a Mac and type "Airflow" to select the `Airflow: Show Airflow` command:

<figure><img src="../../.gitbook/assets/Screenshot 2022-11-03 at 14.06.26.png" alt=""><figcaption></figcaption></figure>

This command will open Airflow in a new VSCode tab:

<figure><img src="../../.gitbook/assets/Screenshot 2022-11-03 at 14.33.51.png" alt=""><figcaption></figcaption></figure>

To install additional Python dependencies, open a Terminal in VSCode and install the package with `mamba install -y -c conda-forge --freeze-installed <package_name>`
