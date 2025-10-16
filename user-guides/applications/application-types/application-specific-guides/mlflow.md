# MLFlow

### Adding an MLFlow app

To add a new MLFlow app to your working instance, go to the Applications view and select the "MLFlow 2.13 + Jupyter" application type:

<figure><img src="../../.gitbook/assets/Screenshot 2022-11-30 at 9.06.32.png" alt=""><figcaption></figcaption></figure>

&#x20;Start your application, MLFlow will open in a new JupyterLab editor tab:

<figure><img src="../../.gitbook/assets/Screenshot 2024-06-01 at 20.17.57.png" alt=""><figcaption></figcaption></figure>

If you close the MLFlow tab, you can reopen it using the following command in the JupyterLab Command Palette (_Command/Ctrl+Shift+C_):

<figure><img src="../../.gitbook/assets/Screenshot 2024-06-01 at 20.12.09.png" alt=""><figcaption></figcaption></figure>

### MLFlow in Visual Studio Code

MLFlow is also available with VSCode:

<figure><img src="../../.gitbook/assets/Screenshot 2024-06-03 at 09.07.39.png" alt=""><figcaption></figcaption></figure>

To open MLFlow in a VSCode tab, use the following VSCode command:

<figure><img src="../../.gitbook/assets/Screenshot 2024-06-03 at 09.11.51.png" alt=""><figcaption></figcaption></figure>

<figure><img src="../../.gitbook/assets/Screenshot 2024-06-03 at 09.12.13.png" alt=""><figcaption></figcaption></figure>

### Tracking model training

{% hint style="info" %}
MLFlow server runs on port http://127.0.0.1:8080, you will need to set this tracking server in your code with:

`import mlflow`\
`mlflow.set_tracking_uri("http://localhost:8080")`
{% endhint %}

The following tutorial, adapted from the MLFlow documentation, shows how to track model training and register the trained model with MLFlow on Nuvolos:

<pre class="language-python"><code class="lang-python"><strong># The data set used in this example is from http://archive.ics.uci.edu/ml/datasets/Wine+Quality
</strong># P. Cortez, A. Cerdeira, F. Almeida, T. Matos and J. Reis.
# Modeling wine preferences by data mining from physicochemical properties. In Decision Support Systems, Elsevier, 47(4):547-553, 2009.

import os
import warnings
import sys

import pandas as pd
import numpy as np
from sklearn.metrics import mean_squared_error, mean_absolute_error, r2_score
from sklearn.model_selection import train_test_split
from sklearn.linear_model import ElasticNet
from urllib.parse import urlparse
import mlflow
import mlflow.sklearn

import logging

logging.basicConfig(level=logging.WARN)
logger = logging.getLogger(__name__)


def eval_metrics(actual, pred):
    rmse = np.sqrt(mean_squared_error(actual, pred))
    mae = mean_absolute_error(actual, pred)
    r2 = r2_score(actual, pred)
    return rmse, mae, r2


if __name__ == "__main__":
    mlflow.set_tracking_uri("http://localhost:8080")
    mlflow.set_experiment("Wine Quality")
    warnings.filterwarnings("ignore")
    np.random.seed(40)

    # Read the wine-quality csv file from the URL
    csv_url = (
        "http://archive.ics.uci.edu/ml/machine-learning-databases/wine-quality/winequality-red.csv"
    )
    try:
        data = pd.read_csv(csv_url, sep=";")
    except Exception as e:
        logger.exception(
            "Unable to download training &#x26; test CSV, check your internet connection. Error: %s", e
        )

    # Split the data into training and test sets. (0.75, 0.25) split.
    train, test = train_test_split(data)

    # The predicted column is "quality" which is a scalar from [3, 9]
    train_x = train.drop(["quality"], axis=1)
    test_x = test.drop(["quality"], axis=1)
    train_y = train[["quality"]]
    test_y = test[["quality"]]

    alpha = float(sys.argv[1]) if len(sys.argv) > 1 else 0.5
    l1_ratio = float(sys.argv[2]) if len(sys.argv) > 2 else 0.5

    with mlflow.start_run():
        lr = ElasticNet(alpha=alpha, l1_ratio=l1_ratio, random_state=42)
        lr.fit(train_x, train_y)

        predicted_qualities = lr.predict(test_x)

        (rmse, mae, r2) = eval_metrics(test_y, predicted_qualities)

        print("Elasticnet model (alpha=%f, l1_ratio=%f):" % (alpha, l1_ratio))
        print("  RMSE: %s" % rmse)
        print("  MAE: %s" % mae)
        print("  R2: %s" % r2)

        mlflow.log_param("alpha", alpha)
        mlflow.log_param("l1_ratio", l1_ratio)
        mlflow.log_metric("rmse", rmse)
        mlflow.log_metric("r2", r2)
        mlflow.log_metric("mae", mae)

        tracking_url_type_store = urlparse(mlflow.get_tracking_uri()).scheme

        # Model registry does not work with file store
        if tracking_url_type_store != "file":

            # Register the model
            # There are other ways to use the Model Registry, which depends on the use case,
            # please refer to the doc for more information:
            # https://mlflow.org/docs/latest/model-registry.html#api-workflow
            mlflow.sklearn.log_model(lr, "model", registered_model_name="ElasticnetWineModel")
        else:
            mlflow.sklearn.log_model(lr, "model")
</code></pre>
