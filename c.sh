# create a new K8S cluster with a default node pool (2 nodes)
gcloud container clusters create krudisar-k8s \
--num-nodes=2 \
--zone europe-west1-d \
--cluster-version 1.14.9-gke.23


# crate a GPU enable node pool and assign it to already existing K8S cluster
gcloud container node-pools \
create gpu-pool \
--num-nodes=1 \
--accelerator type=nvidia-tesla-p100,count=1 \
--zone europe-west1-d \
--cluster krudisar-k8s


# get a list of nodes
kubectl get nodes -o wide


# apply NVIDIA installer
kubectl apply -f https://raw.githubusercontent.com/GoogleCloudPlatform/container-engine-accelerators/master/nvidia-driver-installer/cos/daemonset-preloaded.yaml


# ...
echo "Finished!"


