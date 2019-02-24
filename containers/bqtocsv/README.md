# babyweight-pipeline-bqtocsv

Build and push to project registry with:
```
./build.sh
```

Then test locally with:
```
docker run -t babyweight-pipeline-bqtocsv:latest --project kubeflow-in-action --mode local --bucket kubeflow-in-action-bucket
```
