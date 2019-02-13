#!/bin/bash

PROJECT_ID=kubeflow-in-action
CLUSTER_NAME=my-kubeflow-cluster
# Available Kubernetes versions can be listed with: gcloud container get-server-config
CLUSTER_VERSION=1.11.6-gke.6
ZONE=europe-west1-b

gcloud config set project ${PROJECT_ID}
gcloud config set compute/zone ${ZONE}

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
