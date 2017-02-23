minikube ssh "sudo sysctl -w vm.max_map_count=262144"
minikube ssh "sudo sh -c \"echo "EXTRA_ARGS=' --log-opt labels=io.kubernetes.container.hash,io.kubernetes.container.name,io.kubernetes.pod.name,io.kubernetes.pod.namespace,io.kubernetes.pod.uid'" > /var/lib/boot2docker/profile\" "
minikube ssh "sudo systemctl restart docker"

