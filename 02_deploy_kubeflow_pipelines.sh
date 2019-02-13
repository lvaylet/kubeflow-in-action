#!/bin/bash

# Set to lastest version available at https://github.com/kubeflow/pipelines/releases
# Note that 0.1.9 does not have a bootstrapper.yaml file.
PIPELINE_VERSION=0.1.8

# Run deployment job
kubectl create -f https://storage.googleapis.com/ml-pipeline/release/$PIPELINE_VERSION/bootstrapper.yaml

# Wait for the deployment to complete
kubectl get job
echo "Waiting until number of successful runs is 1 ..."

while [ $(kubectl get job | tail -1 | awk '{print $3}') -lt 1 ]
do
    echo "waiting"
    sleep 5
done

kubectl get job

# Alternatively:
#jobname=$(kubectl get job | tail -1 | awk '{print $1}')
#kubectl wait --for=condition=complete --timeout=5m $jobname
