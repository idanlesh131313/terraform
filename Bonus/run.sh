#!/bin/bash
gcloud config set project modern-tangent-331205
gcloud compute instances create mysql-server-1 --source-instance-template mysql-server-template --zone us-central1-a