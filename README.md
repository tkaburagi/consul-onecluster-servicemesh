kc apply -f ns.yaml
 
helm install -f consul-values.yaml consul hashicorp/consul --version "0.27.0" --wait -n onecluster-servicemesh

helm install -f prometheus-values.yaml prometheus prometheus-community/prometheus --version "11.7.0" --wait -n onecluster-servicemesh

helm install -f grafana-values.yaml grafana grafana/grafana --version "5.3.6" --wait -n onecluster-servicemesh

kc apply -f hashicorpjapan.yaml -n=onecluster-servicemesh
kc apply -f corp.yaml -n=onecluster-servicemesh
kc apply -f hashi.yaml -n=onecluster-servicemesh
kc apply -f japan.yaml -n=onecluster-servicemesh