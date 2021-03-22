<kbd>
  <img src="https://github-image-tkaburagi.s3-ap-northeast-1.amazonaws.com/my-github-repo/onecluster-servicemesh.png">
</kbd>

## namespace
```shell script
kc apply -f ns.yaml
```

## helm install
```shell script
helm install -f helm/prometheus-values.yaml prometheus prometheus-community/prometheus --wait -n onecluster-servicemesh

helm install -f helm/grafana-values.yaml grafana grafana/grafana --wait -n onecluster-servicemesh

helm install -f helm/consul-values.yaml consul hashicorp/consul --wait -n onecluster-servicemesh

helm install -f helm/zipkin-values.yaml jaeger-all-in-one jaeger-all-in-one/jaeger-all-in-one --wait -n onecluster-servicemesh
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
consul config write proxy-config/corp-svc-router.hcl
```


## Retrieve Grafana Password
```
kubectl get secret --namespace onecluster-servicemesh grafana -o jsonpath="{.data.admin-password}" | base64 --decode ; echo
```


## Run Jaeger
```
docker run -d --name jaeger \
  -e COLLECTOR_ZIPKIN_HOST_PORT=:9411 \
  -p 5775:5775/udp \
  -p 6831:6831/udp \
  -p 6832:6832/udp \
  -p 5778:5778 \
  -p 16686:16686 \
  -p 14268:14268 \
  -p 14250:14250 \
  -p 9411:9411 \
  jaegertracing/all-in-one:1.22
```