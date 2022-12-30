# From helm to kustomize

[ref](https://www.hoelzel.it/helm/2022/04/16/generate-kustomize-from-helm-chart.html)

./helm/kustomization.yaml
```yaml
apiVersion: kustomize.config.k8s.io/v1beta1
kind: Kustomization
namespace: default
helmCharts:
- name: airflow
  releaseName: airflow
  version: 1.7.0
  repo: https://airflow.apache.org
```

```shell
kubectl kustomize ./helm  --enable-helm >manifest.yaml

kubectl-slice -f manifest.yaml -o ./splited -t '{{.metadata.name}}-{{.kind | lower}}.yaml'

minikube service airflow-webserver
```

from the url

user: admin
pwd: admin


