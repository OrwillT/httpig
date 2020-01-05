FROM golang:alpine AS builder
RUN apk update && apk add --no-cache upx git
WORKDIR /tmp/httpig
COPY . /tmp/httpig/
RUN export GOBIN=$GOPATH/bin && go get && go build -ldflags "-w -s"
RUN upx --ultra-brute httpig

FROM scratch
LABEL maintainer "Orwill Q. Song <orwill@anislet.dev>"
COPY --from=builder /tmp/httpig/httpig /
CMD ["/httpig"]
