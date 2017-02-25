#minikube start --cpus 4 --memory 10000 --vm-driver kvm --insecure-registry "insecure.registry:5000"
minikube start --cpus 4 --memory 10000 --vm-driver virtualbox --insecure-registry "insecure.registry:5000"
minikube status
sleep 20
minikube addons enable heapster
minikube addons enable ingress
minikube ssh "sudo sysctl -w vm.max_map_count=262144"
minikube ssh "sudo sh -c \"echo "EXTRA_ARGS=' --log-opt labels=io.kubernetes.container.hash,io.kubernetes.container.name,io.kubernetes.pod.name,io.kubernetes.pod.namespace,io.kubernetes.pod.uid'" > /var/lib/boot2docker/profile\" "
minikube ssh "sudo systemctl restart docker"


