FROM auxpi:base AS builder

RUN make linux

FROM debian:stretch-backports

ENV TZ Asia/Shanghai

COPY --from=builder /go/src/github.com/auxpi/auxpi /opt/go/auxpi

COPY static /opt/go/static

COPY views /opt/go/views

COPY db /opt/go/db

COPY conf /opt/go/conf

COPY hack/run/entrypoint.sh /entrypoint.sh

RUN chmod 777 /opt/go/auxpi

WORKDIR /opt/go

EXPOSE 2333

ENTRYPOINT ["/entrypoint.sh"]