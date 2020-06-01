WORKING_DIR=$(pwd)
CLUSTER_NAME=wp-cluster



kubectl delete -f wordpress-service.yaml
kubectl delete -f wordpress.yaml
kubectl delete -f mysql-service.yaml
kubectl delete -f mysql-secret.yaml
kubectl delete -f mysql.yaml
kubectl delete -f wordpress-volumeclaim.yaml
kubectl delete -f mysql-volumeclaim.yaml
kubectl delete -f namespace.yaml

gcloud container clusters delete $CLUSTER_NAME --region us-west1 -q