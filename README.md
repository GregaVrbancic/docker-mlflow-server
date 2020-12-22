# MLflow Server Docker Image

Python 3.7.6 based [MLflow](https://www.mlflow.org/) Docker image.

## Usage

### Build and run locally:

```bash
docker-compose -f docker-compose-local.yml up
```

You can also set the following environmental variables:

- MLFLOW_S3_ENDPOINT_URL=${S3_ENDPOINT_URL}
- AWS_REGION=${S3_REGION}
- AWS_ACCESS_KEY_ID=${S3_ACCESS_KEY_ID}
- AWS_SECRET_ACCESS_KEY=${S3_SECRET_ACCESS_KEY}
- ARTIFACT_ROOT=${S3_BUCKET}

### Use already built image

```docker-compose up```


