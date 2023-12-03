#!/bin/bash

echo "Deploy Cloudbuild with speed"

read -p "Enter your GCP projct:" PROJECT

if [ -z "$PROJECT" ]; then
   echo "ERROR: Project value cannot be empty. Exiting."
   exit 1
fi   

echo "You entered GCP project: $PROJECT"


