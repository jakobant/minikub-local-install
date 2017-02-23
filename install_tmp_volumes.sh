#!/bin/bash

if [ $# -eq 0 ]
  then
    echo "No arguments supplied"
    echo "F.E. \"Run $0 20\" will create 20 volumes in minikube for usage "
fi

for a in `seq 1 $1`
do

mkdir -p $HOME/.minikube/data/vol$a
cat << EOF > /tmp/vol.yaml
kind: PersistentVolume
apiVersion: v1
metadata:
  name: task-tmp-pv-volume$a
  labels:
    type: local
spec:
  capacity:
    storage: 200Mi
  accessModes:
    - ReadWriteOnce
  hostPath:
    path: "$HOME/.minikube/data/vol$1"
EOF
kubectl create -f /tmp/vol.yaml
done
