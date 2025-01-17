# Prometheus smtp Exporter

Prometheus exporter for smtp testing

Learn more: [https://github.com/prometheus/smtp_exporter](https://github.com/prometheus/smtp_exporter)

This chart creates a smtp-Exporter deployment on a [Kubernetes](http://kubernetes.io) cluster using the [Helm](https://helm.sh) package manager.

## Prerequisites

- Kubernetes 1.8+ with Beta APIs enabled
- Helm >= 3.0

## Get Repository Info

```console
helm repo add prometheus-community https://prometheus-community.github.io/helm-charts
helm repo update
```

_See [`helm repo`](https://helm.sh/docs/helm/helm_repo/) for command documentation._

## Install Chart

```console
helm install [RELEASE_NAME] prometheus-community/prometheus-smtp-exporter
```

_See [configuration](#configuration) below._

_See [helm install](https://helm.sh/docs/helm/helm_install/) for command documentation._

## Uninstall Chart

```console
helm uninstall [RELEASE_NAME]
```

This removes all the Kubernetes components associated with the chart and deletes the release.

_See [helm uninstall](https://helm.sh/docs/helm/helm_uninstall/) for command documentation._

## Upgrading Chart

```console
helm upgrade [RELEASE_NAME] [CHART] --install
```

_See [helm upgrade](https://helm.sh/docs/helm/helm_upgrade/) for command documentation._

### To 7.0.0

This version introduces the `securityContext` and `podSecurityContext` and removes `allowICMP`option.

All previous values are setup as default. In case that you want to enable previous functionality for `allowICMP` you need to explicit enabled with the following configuration:

```yaml
securityContext:
  readOnlyRootFilesystem: true
  allowPrivilegeEscalation: false
  capabilities:
    add: ["NET_RAW"]
```

### To 6.0.0

This version introduces the relabeling field for the ServiceMonitor.
All values in the list `additionalRelabeling` will now appear under `relabelings` instead of `metricRelabelings`.

### To 5.0.0

This version removes Helm 2 support. Also the ingress config has changed, so you have to adapt to the example in the values.yaml.

### To 4.0.0

This version create the service account by default and introduce pod security policy, it can be enabled by setting `pspEnabled: true`.

### To 2.0.0

This version removes the `podDisruptionBudget.enabled` parameter and changes the default value of `podDisruptionBudget` to `{}`, in order to fix Helm 3 compatibility.

In order to upgrade, please remove `podDisruptionBudget.enabled` from your custom values.yaml file and set the content of `podDisruptionBudget`, for example:

```yaml
podDisruptionBudget:
  maxUnavailable: 0
```

### To 1.0.0

This version introduce the new recommended labels.

In order to upgrade, delete the Deployment before upgrading:

```bash
kubectl delete deployment [RELEASE_NAME]-prometheus-smtp-exporter
```

Note that this will cause downtime of the smtp.

## Configuration

See [Customizing the Chart Before Installing](https://helm.sh/docs/intro/using_helm/#customizing-the-chart-before-installing). To see all configurable options with detailed comments, visit the chart's [values.yaml](./values.yaml), or run these configuration commands:

```console
helm show values prometheus-community/prometheus-smtp-exporter
```
