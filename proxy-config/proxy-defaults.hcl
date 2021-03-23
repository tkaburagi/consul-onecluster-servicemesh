Kind      = "proxy-defaults"
Name      = "global"
Config {
  protocol = "http"
  envoy_prometheus_bind_addr = "0.0.0.0:9102"
  envoy_extra_static_clusters_json = <<EOL
    {
      "connect_timeout": "3.000s",
      "dns_lookup_family": "V4_ONLY",
      "lb_policy": "ROUND_ROBIN",
      "load_assignment": {
          "cluster_name": "zipkin",
          "endpoints": [
              {
                  "lb_endpoints": [
                      {
                          "endpoint": {
                              "address": {
                                  "socket_address": {
                                      "address": "52.194.140.109",
                                      "port_value": 9411,
                                      "protocol": "TCP"
                                  }
                              }
                          }
                      }
                  ]
              }
          ]
      },
      "name": "zipkin",
      "type": "STRICT_DNS"
    }
  EOL

  envoy_tracing_json = <<EOL
    {
        "http": {
            "name": "envoy.zipkin",
            "config": {
                "collector_cluster": "zipkin",
                "collector_endpoint": "/api/v1/spans",
                "shared_span_context": "false"
            }
        }
    }
  EOL
}