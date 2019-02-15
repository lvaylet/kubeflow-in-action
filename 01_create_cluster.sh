#!/bin/bash

PROJECT_ID=kubeflow-in-action
CLUSTER_NAME=my-kubeflow-cluster
# Available Kubernetes versions can be listed with: gcloud container get-server-config
CLUSTER_VERSION=1.11.6-gke.6
ZONE=europe-west1-b

# Set current project and region/zone
gcloud config set project ${PROJECT_ID}
gcloud config set compute/zone ${ZONE}

# Activate APIs
# Available APIs can be listed with: gcloud services list --available
# ---
# Kubernetes Engine API (required to create the Kubernetes cluster)
gcloud services enable container.googleapis.com
# Compute Engine API (required to create the Kubernetes cluster)
gcloud services enable compute.googleapis.com
# Dataflow API (required by 'preprocess' step in pipeline)
gcloud services enable dataflow.googleapis.com
# ML Engine API (required by 'hypertrain' step in pipeline)
gcloud services enable ml.googleapis.com
# App Engine Admin API (required by 'deployapp' step in pipeline)
gcloud services enable appengine.googleapis.com

# Create Kubernetes cluster
gcloud container clusters create ${CLUSTER_NAME} \
    --cluster-version ${CLUSTER_VERSION} \
    --enable-autoupgrade \
    --zone ${ZONE} \
    --network default \
    --subnetwork default \
    --scopes cloud-platform \
    --enable-cloud-logging \
    --enable-cloud-monitoring \
    --machine-type n1-standard-2 \
    --enable-autoscaling \
    --max-nodes=10 \
    --min-nodes=3 
#   --num-nodes 4 
#   --preemptible
#   --enable-autoprovisioning --max-cpu=40 --max-memory=1024 

kubectl create clusterrolebinding ml-pipeline-admin-binding \
    --clusterrole=cluster-admin \
    --user=laurent.vaylet@renault.com

kubectl create clusterrolebinding pipeline-runner-binding \
    --clusterrole=cluster-admin \
    --serviceaccount=kubeflow:pipeline-runner
