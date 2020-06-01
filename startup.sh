# setup environment
gcloud config set compute/zone us-west1
WORKING_DIR=$(pwd)
CLUSTER_VERSION=$(gcloud container get-server-config --region us-west1 --format='value(validMasterVersions[0])')



# create GKE cluster
CLUSTER_NAME=wp-cluster
gcloud container clusters create $CLUSTER_NAME --region=us-west1 --machine-type=g1-small --num-nodes=1
echo "GKE created"

# create namespace
kubectl apply -f namespace.yaml
kubectl get namespace


# create MySQL and wordpress persistent volume
kubectl apply -f mysql-volumeclaim.yaml
kubectl apply -f wordpress-volumeclaim.yaml

# create MySQL deployment
kubectl apply -f mysql.yaml
kubectl apply -f mysql-secret.yaml

# create MySQL service
kubectl apply -f mysql-service.yaml

# create wordpress deployment
kubectl apply -f wordpress.yaml

# create wordpress service
kubectl apply -f wordpress-service.yaml