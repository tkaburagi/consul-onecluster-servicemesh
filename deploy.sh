#!/bin/sh

if [ $1 = 1 ]; then
 kubectl delete -f hashi.yaml -n=onecluster-servicemesh
 kubectl delete -f japan.yaml -n=onecluster-servicemesh
 kubectl delete -f corp.yaml -n=onecluster-servicemesh
 kubectl delete -f france.yaml -n=onecluster-servicemesh
 kubectl delete -f hashicorpx.yaml -n=onecluster-servicemesh
 kubectl get all -n=onecluster-servicemesh
elif [ $1 = 0 ]; then
 kubectl apply -f hashi.yaml -n=onecluster-servicemesh
 kubectl apply -f japan.yaml -n=onecluster-servicemesh
 kubectl apply -f corp.yaml -n=onecluster-servicemesh
 kubectl apply -f france.yaml -n=onecluster-servicemesh
 kubectl apply -f hashicorpx.yaml -n=onecluster-servicemesh
 kubectl get all -n=onecluster-servicemesh
fi
