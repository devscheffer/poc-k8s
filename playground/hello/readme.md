https://www.section.io/engineering-education/deploy-docker-container-to-kubernetes-cluster/

```shell
eval $(minikube docker-env)

docker build -t hello:v1 .

kubectl apply -k .

minikube tunnel
```
