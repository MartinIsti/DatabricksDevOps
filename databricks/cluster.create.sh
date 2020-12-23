#!/bin/bash

# cluster name must be passed as parameter
clusterName=$1
[[ -z "$clusterName" ]] && exit 1

# name the cluster based on variable
# modify the configuration JSON with an environment suffix for the cluster name
cat databricks/cluster.template.json | sed "s/CLUSTER_NAME/$clusterName/g" > /tmp/conf.json

echo "Creating Cluster"
clusterID=$(databricks clusters create --json-file /tmp/conf.json | jq -r '.cluster_id')

STATE=$(databricks clusters list --output json | jq -r --arg I "$clusterID" '.clusters[] | select(.cluster_id == $I) | .state')

echo "Wait for cluster to be PENDING"
while [[ "$STATE" != "PENDING" ]]
do
    STATE=$(databricks clusters list --output json | jq -r --arg I "$clusterID" '.clusters[] | select(.cluster_name == $I) | .state')
done

# the API is flaky and the library install complains about terminated clusters
# so wait a bit more before continuing task
sleep 10

echo "Cluster $clusterID is pending"
