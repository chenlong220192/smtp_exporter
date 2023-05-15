ARG ARCH="amd64"
ARG OS="linux"
FROM quay.io/prometheus/busybox-${OS}-${ARCH}:latest
LABEL maintainer="chenlong220192@gmail.com"

ARG ARCH="amd64"
ARG OS="linux"
COPY ./build/smtp_exporter  /bin/smtp_exporter
COPY ./smtp.yml       /etc/smtp_exporter/smtp.yml

EXPOSE      9125
ENTRYPOINT  [ "/bin/smtp_exporter" ]
CMD         [ "--config.file=/etc/smtp_exporter/smtp.yml" ]
