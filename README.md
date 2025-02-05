# MLflow Server Docker Image

Bitnami Python based [MLflow](https://www.mlflow.org/) Docker image.

## Usage

### Build and run locally:

```bash
docker compose -f docker-compose-local.yml up
```

### Build Docker image
```bash
docker compose -f docker-compose-local.yml build
```

You can also set the following environmental variables:
- DB_HOST=localhost # Database host
- DB_PORT=5432 # Port on which is DB running
- DB_NAME=db # Database name
- DB_USER=postgres # Database username
- DB_PASSWD=postgres # Database password
- MLFLOW_S3_ENDPOINT_URL=${S3_ENDPOINT_URL}
- AWS_REGION=${S3_REGION}
- AWS_ACCESS_KEY_ID=${S3_ACCESS_KEY_ID}
- AWS_SECRET_ACCESS_KEY=${S3_SECRET_ACCESS_KEY}
- ARTIFACT_ROOT=${S3_BUCKET}
- HOST=${HOST} # exposed MLFlow host (default: 0.0.0.0)

### Use already built image

```docker compose up```
