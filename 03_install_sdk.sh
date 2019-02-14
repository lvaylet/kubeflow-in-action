#!/bin/bash

# Usage
# Set local Python with:
# $ pyenv local 3.6.7
# Create and activate virtual environment with:
# $ python3 -m venv ./venv
# $ source venv/bin/activate
# Upgrade pip with:
# $ pip install --upgrade pip
# Install SDK locally with:
# $ ./03_install_sdk.sh
# Compile and package Kubeflow pipeline with:
# $ python mlp_babyweight.py mlp_babyweight.tar.gz

pip install python-dateutil https://storage.googleapis.com/ml-pipeline/release/0.1.2/kfp.tar.gz --upgrade
