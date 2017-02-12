#!/bin/bash

ORG_ID=1
PRODUCT_NAME="OCP Docker images"

upstream_repos=( openshift3/ose-deployer \ 
     openshift3/ose-docker-registry \
     openshift3/registry-console \
     openshift3/ose-pod \
     openshift3/ose-docker-builder \ 
     openshift3/ose-sti-builder \ 
     openshift3/ose-haproxy-router \ 
     openshift3/logging-deployment \
     openshift3/logging-elasticsearch \
     openshift3/logging-kibana \
     openshift3/logging-fluentd \
     openshift3/logging-auth-proxy \
     openshift3/metrics-deployer \
     openshift3/metrics-hawkular-metrics \
     openshift3/metrics-cassandra \
     openshift3/metrics-heapster \
     openshift3/ose \
     openshift3/node \
     openshift3/openvswitch \
     rhel7/etcd \
     openshift3/ose-keepalived-ipfailover
)

hammer product create --name "$PRODUCT_NAME" --organization-id $ORG_ID

for i in ${upstream_repos[@]}; do
  hammer repository create --name "$i" --organization-id $ORG_ID --content-type docker --url "https://registry.access.redhat.com" --docker-upstream-name "$i" --product "$PRODUCT_NAME"
done


