#Creates cluster
minikube start

#Exports variables
export NAMESPACE=example-namespace
export RELEASE_NAME=example-release

#Creates namespaces
minikube kubectl -- create namespace $NAMESPACE
minikube kubectl -- create namespace keda

#Installs mysql
kubectl apply -f ./mysql/mysql-deployment.yaml --namespace=$NAMESPACE  

#Installs KEDA for autoscalling
helm install keda kedacore/keda \
    --namespace keda \
    --version "v2.0.0"


#Create git ssh secret
minikube kubectl -- create secret generic airflow-ssh-git-secret --from-file=gitSshKey=id_ed25519 -n $NAMESPACE

docker build --network=host -t airflow-custom:1.0.0 .

minikube image load airflow-custom:1.0.0

#Upgrade helm repo, override all values and installs
helm upgrade --install $RELEASE_NAME apache-airflow/airflow -f override-values.yaml --namespace $NAMESPACE

#Redirects port
minikube kubectl -- port-forward svc/$RELEASE_NAME-webserver 8080:8080 --namespace $NAMESPACE