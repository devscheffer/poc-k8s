# Kubernetes

View [Kubernetes Documentation](https://docs.airbyte.io/deploying-airbyte/on-kubernetes)

### Deployment

```shell
kubectl apply -k ./infra/dev/airbyte/overlays/
```

### Web UI

```shell
kubectl port-forward svc/airbyte-webapp-svc 8000:80
```

http://localhost:8000