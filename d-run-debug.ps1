docker run --rm -v ${PWD}:/src/work -p 9091:9090 -p 2345:2345 --security-opt "seccomp:unconfined" 22ndtech/go-first:debug

#docker run -it -v ${PWD}:/go/src/work -v ${PWD}/golang/configs/:/configs -v ${PWD}/golang/secrets/:/secrets  -p 5001:5000 -p 2345:2345 --security-opt "seccomp:unconfined" aimvector/golang:1.0.0