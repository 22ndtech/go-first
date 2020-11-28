FROM golang:1.15.4-alpine3.12 AS debug

# installing git
RUN apk update && apk upgrade && \
    apk add --no-cache git \
        dpkg \
        gcc \
        git \
        musl-dev

ENV GOPATH /go
ENV PATH $GOPATH/bin:/usr/local/go/bin:$PATH

RUN go get -u github.com/gorilla/mux
RUN go get github.com/go-delve/delve/cmd/dlv

WORKDIR /src/work
# Marcel's COPY ./src /go/src/work/
COPY . /src/work/
RUN cd /src/work && CGO_ENABLED=0 go build main.go
### Run the Delve debugger ###
COPY ./dlv.sh /
RUN chmod +x /dlv.sh 
ENTRYPOINT [ "/dlv.sh"]
EXPOSE 9090
EXPOSE 2345

FROM debug as prod
# WORKDIR /root/
# COPY --from=debug /src/work/main /root/
# ENTRYPOINT ["/root/main"]
ENTRYPOINT /src/work/main
EXPOSE 9090