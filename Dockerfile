FROM       golang:alpine as builder

RUN apk --no-cache add bash make openssl
COPY . /go/src/github.com/kostian02/php-fpm-exporter
RUN cd /go/src/github.com/kostian02/php-fpm-exporter && ./script/build

FROM scratch
COPY --from=builder /go/src/github.com/kostian02/php-fpm-exporter/php-fpm-exporter.linux.amd64 /php-fpm-exporter

ENTRYPOINT [ "/php-fpm-exporter" ]
