#!/bin/bash

kubectl apply -f manifests/setup/

until kubectl get jaegers --all-namespaces ; do date; sleep 1; echo ""; done
until kubectl get elasticsearch --all-namespaces ; do date; sleep 1; echo ""; done

kubectl apply -f manifests/jaeger/setup/

PASSWORD=""
while [[ $PASSWORD == "" ]];
do
  echo 'Waiting for elastic user auth secret creation'
  PASSWORD=$(kubectl get secret elastic-jaeger-es-elastic-user -o=jsonpath='{.data.elastic}' | base64 --decode)
  sleep 1
done

kubectl delete secret jaeger-secret
kubectl create secret generic jaeger-secret --from-literal=ES_PASSWORD=${PASSWORD} --from-literal=ES_USERNAME=elastic

kubectl apply -f manifests/jaeger/