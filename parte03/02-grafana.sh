#!/bin/bash

helm repo add grafana https://grafana.github.io/helm-charts
helm install grafana grafana/grafana
kubectl expose service grafana --type=NodePort --port=3000 --target-port=3000 --name=grafana-np