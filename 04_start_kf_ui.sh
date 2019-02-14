#!/bin/bash

export NAMESPACE=kubeflow

kubectl port-forward -n ${NAMESPACE} $(kubectl get pods -n ${NAMESPACE} --selector=service=ambassador -o jsonpath='{.items[0].metadata.name}') 8085:80

# Now visit http://localhost:8085 to display the Kubeflow UI, or http://localhost:8085/pipeline to display the Kubeflow pipelines
