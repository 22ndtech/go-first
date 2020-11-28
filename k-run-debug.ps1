#docker run --rm -v ${PWD}:/src/work -p 9091:9090 -p 2345:2345 --security-opt "seccomp:unconfined" -it jeff22ndtech/go-first:debug
kubectl run go-first --image=22ndtech/go-first:debug --port=9091 --port=2345 --labels app=go-first
kubectl port-forward go-first 9091:9090 2345:2345