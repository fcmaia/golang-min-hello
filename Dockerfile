FROM golang:alpine as builder

RUN apk add gcc

COPY ./hello.go /go/src

WORKDIR /go/src

RUN go build -ldflags "-s -w" --buildmode=exe -o hello

FROM hello-world

COPY --from=builder /go/src/hello ./

ENTRYPOINT ["/hello"]

