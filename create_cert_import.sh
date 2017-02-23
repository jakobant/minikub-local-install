#!/bin/bash


openssl pkcs12 -export -inkey ~/.minikube/apiserver.key -in ~/.minikube/apiserver.crt -out certificate_import_chrome.crt -name "local minikube cert" -certfile ~/.minikube/ca.crt 

