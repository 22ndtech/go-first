kubectl run go-first --image=22ndtech/go-first --port=9091 --labels app=go-first
kubectl port-forward go-first 9091:9090