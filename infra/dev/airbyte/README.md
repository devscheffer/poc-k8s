# Kubernetes

View [Kubernetes Documentation](https://docs.airbyte.io/deploying-airbyte/on-kubernetes)

### Deployment

```shell
kubectl apply -k poc-k8s/infra/dev/airbyte/overlays/stable
```

### Web UI

```shell
kubectl port-forward svc/airbyte-webapp-svc 8000:80 
```

http://localhost:8000 