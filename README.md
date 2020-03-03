# MLflow Server Docker Image

Python 3.7.6 based [MLflow](https://www.mlflow.org/) Docker image.

## Usage

Build and run locally:

```bash
docker build --rm -t mlflow-server:latest .
docker run --rm --name mlflow-server -v /tmp/mlflow:/mlflow -p 5000:5000 mlflow-server
```

