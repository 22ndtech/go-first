docker run --rm -v ${PWD}:/src/work -p 9091:9090 -p 2345:2345 --security-opt "seccomp:unconfined" -it --entrypoint /bin/sh 22ndtech/go-first:debug
