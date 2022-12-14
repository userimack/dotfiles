function ksn
    kubectl get namespace $1 > /dev/null
    if [ $? -eq 1 ]
        then return $?
    fi
    kubectl config set-context $(kubectl config current-context) --namespace=$1
    echo "Namespace: $1"
end
