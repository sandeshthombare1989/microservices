#!/bin/bash
echo "Started deployment"
echo "$KUBERNETES_CLUSTER_CERTIFICATE"
echo $KUBERNETES_CLUSTER_CERTIFICATE
echo "$KUBERNETES_CLUSTER_CERTIFICATE" | base64 --decode > cert.crt
/usr/local/bin/kubectl \
  --kubeconfig=/dev/null \
  --server=$KUBERNETES_SERVER \
  --insecure-skip-tls-verify=true \
  apply -f ./kube/
echo "The build number is ${TRAVIS_BUILD_NUMBER}"
/usr/local/bin/kubectl \
  --kubeconfig=/dev/null \
  --server=$KUBERNETES_SERVER \
  ---insecure-skip-tls-verify=true \
  set image deployment/microservice-python microservice-python=coolsandythombare/microservice-python:${TRAVIS_BUILD_NUMBER} --record
