<kbd>
  <img src="https://github-image-tkaburagi.s3-ap-northeast-1.amazonaws.com/my-github-repo/onecluster-servicemesh.png">
</kbd>

## namespace
```shell script
kc apply -f ns.yaml
```

## helm install
```shell script
helm install -f helm/consul-values.yaml consul hashicorp/consul --version "0.27.0" --wait -n onecluster-servicemesh

helm install -f helm/prometheus-values.yaml prometheus prometheus-community/prometheus --version "11.7.0" --wait -n onecluster-servicemesh

helm install -f helm/grafana-values.yaml grafana grafana/grafana --version "5.3.6" --wait -n onecluster-servicemesh
```


## deploy apps
```shell script
./deploy.sh 0
```

## setup proxy config
```shell script
export CONSUL_HTTP_ADDR=xxx
consul config write proxy-config/country-svc-defaults.hcl
consul config write proxy-config/japan-svc-defaults.hcl
consul config write proxy-config/france-svc-defaults.hcl
consul config write proxy-config/country-svc-router.hcl
```
