helm repo add apache-airflow https://airflow.apache.org
helm upgrade --install airflow apache-airflow/airflow --namespace airflow --create-namespace
helm template airflow apache-airflow/airflow --output-dir manifests/airflow