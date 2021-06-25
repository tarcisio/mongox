#!/bin/bash

helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm install prometheus prometheus-community/prometheus
kubectl expose service prometheus-server --type=NodePort --port=3111 --target-port=9090 --name=prometheus-server-np

