### Start minikube cluster:
```shell
minikube start
```
<br> 

### Mount volume in minikube cluster: 

<br>In a separated WSL2 shell, from `poc-k8s/infra/dev/airflow/` :

```shell
minikube mount ./infra/dev/airflow/dags/:/mnt/airflow/dags
```

### Deployment:

```shell
kubectl apply -k ./infra/dev/airflow/overlays
```
<br>

### Access airflow-webserver:

__1.__ first forward a port in a separated WSL2 terminal: 
```shell
kubectl port-forward svc/airflow-webserver 8080:8080 -n default
```

__2.__ run service: 
```shell 
minikube service airflow-webserver
```