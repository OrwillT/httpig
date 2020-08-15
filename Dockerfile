FROM golang:alpine AS builder
RUN apk update && apk add --no-cache upx git
WORKDIR /tmp/httpig
COPY . /tmp/httpig/
RUN export GOBIN=$GOPATH/bin && go get && CGO_ENABLED=0 GOOS=linux go build -ldflags "-w -s"
RUN upx -9 --best --ultra-brute httpig

FROM scratch
LABEL maintainer "Orwill Q. Song <orwill@anislet.dev>"
COPY --from=builder /tmp/httpig/httpig /bin/
EXPOSE 8080
ENTRYPOINT [ "httpig" ]
CMD [ "-i", "/var/www/html/" ]