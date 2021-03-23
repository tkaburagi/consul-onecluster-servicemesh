#!/bin/sh

if [ $1 = delete ]; then
 kubectl delete -f hashi.yaml -n=onecluster-servicemesh
 kubectl delete -f japan.yaml -n=onecluster-servicemesh
 kubectl delete -f corp.yaml -n=onecluster-servicemesh
 kubectl delete -f france.yaml -n=onecluster-servicemesh
 kubectl delete -f hashicorpx.yaml -n=onecluster-servicemesh
 kubectl get all -n=onecluster-servicemesh
elif [ $1 = create ]; then
 kubectl apply -f hashi.yaml -n=onecluster-servicemesh
 kubectl apply -f japan.yaml -n=onecluster-servicemesh
 kubectl apply -f corp.yaml -n=onecluster-servicemesh
 kubectl apply -f france.yaml -n=onecluster-servicemesh
 kubectl apply -f hashicorpx.yaml -n=onecluster-servicemesh
 sleep 15
 kubectl get all -n=onecluster-servicemesh
elif [ $1 = recreate ]; then
 kubectl replace --force -f hashi.yaml -n=onecluster-servicemesh
 kubectl replace --force -f japan.yaml -n=onecluster-servicemesh
 kubectl replace --force -f corp.yaml -n=onecluster-servicemesh
 kubectl replace --force -f france.yaml -n=onecluster-servicemesh
 kubectl replace --force -f hashicorpx.yaml -n=onecluster-servicemesh
 sleep 15
 kubectl get all -n=onecluster-servicemesh
fi