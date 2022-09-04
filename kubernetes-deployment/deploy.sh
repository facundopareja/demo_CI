#! /bin/bash

cmd=$1

if [[ $cmd == "delete" ]]; then
    kubectl delete -f deployment.yaml
elif [[ $cmd == "apply" ]]; then
    kubectl delete -f deployment.yaml
    cd express-app
    docker build -t express-app .
    cd ../react-app
    docker build -t react-app .
    cd ..
    kubectl apply -f deployment.yaml
else
    echo "usage: ./deploy.sh [delete|apply]"
    exit 1
fi
