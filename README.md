# Kafka Minion Helm Chart

Helm chart for deployment of Kafka Minion

## Intalling helm chart

```
helm repo add kafka-minion https://raw.githubusercontent.com/google-cloud-tools/kafka-minion-helm-chart/master
helm repo update
helm install --name=kafka-minion kafka-minion/kafka-minion
```

## Chart configuration

| Parameter                            | Description                                                                                                             | Default   |
| ------------------------------------ | ----------------------------------------------------------------------------------------------------------------------- | --------- |
| `telemetry.host`                     | Host for prometheus server to to listen on                                                                              | `0.0.0.0` |
| `telemetry.port`                     | Port for prometheus server to listen on                                                                                 | `8080`    |
| `logLevel`                           | Logger's log granularity (debug, info, warn, error, fatal, panic)                                                       | `info`    |
| `livenessProbe.initialDelaySeconds`  | Number of seconds after the container has started before liveness or readiness probes are initiated                     | `10`      |
| `livenessProbe.periodSeconds`        | How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1.                                 | `10`      |
| `livenessProbe.timeoutSeconds`       | Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1                             | `5`       |
| `livenessProbe.failureThreshold`     | When a Pod starts and the probe fails, Kubernetes will try failureThreshold times before giving up. Minimum value is 1. | `60`      |
| `readinessProbe.initialDelaySeconds` | Number of seconds after the container has started before liveness or readiness probes are initiated                     | `10`      |
| `readinessProbe.periodSeconds`       | How often (in seconds) to perform the probe. Default to 10 seconds. Minimum value is 1.                                 | `10`      |
| `readinessProbe.timeoutSeconds`      | Number of seconds after which the probe times out. Defaults to 1 second. Minimum value is 1                             | `5`       |
| `readinessProbe.failureThreshold`    | When a Pod starts and the probe fails, Kubernetes will try failureThreshold times before giving up. Minimum value is 1. | `60`      |
| `podSecurityContext.runAsUser`       | UserID to use for the pod                                                                                               | `99`      |
| `podSecurityContext.fsGroup`         | User group to use for the pod                                                                                           | `99`      |
| `containerSecurityContext`           | Security Context for the kafka minion container                                                                         | `{}`      |

readinessProbe:
initialDelaySeconds: 10
timeoutSeconds: 5
failureThreshold: 60 # 60 \* 10s equals 10min
periodSeconds: 10
