# Kafka Minion Helm Chart

Helm chart for deployment of Kafka Minion

## Intalling helm chart

```
helm repo add kafka-minion https://raw.githubusercontent.com/google-cloud-tools/kafka-minion-helm-chart/master
helm repo update
helm install --name=kafka-minion kafka-minion/kafka-minion
```

## Chart configuration

| Parameter        | Description                                                       | Default   |
| ---------------- | ----------------------------------------------------------------- | --------- |
| `telemetry.host` | Host for prometheus server to to listen on                        | `0.0.0.0` |
| `telemetry.port` | Port for prometheus server to listen on                           | `8080`    |
| `logLevel`       | Logger's log granularity (debug, info, warn, error, fatal, panic) | `info`    |
