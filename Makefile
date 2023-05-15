#======================================================================
#
# example 'make'
#
# author: chenlong
# date: 2022-05-15
#======================================================================

SHELL := /bin/bash -o pipefail

export BASE_PATH := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

# ----------------------------- variables <-----------------------------
# ----------------------------- variables >-----------------------------

# ----------------------------- local <-----------------------------
#
package:
	GOOS=linux GOARCH=amd64 go build -o ${BASE_PATH}/build/smtp_exporter *.go

#
docker.build:
	docker build -f ${BASE_PATH}/docker/Dockerfile \
		--rm \
		-t "prom/smtp-exporter-linux-amd64:v1.0.0" \
		--build-arg ARCH="amd64" \
		--build-arg OS="linux" \
		${BASE_PATH}

#
#
helm.uninstall:
	helm uninstall prometheus-smtp-exporter -n prometheus

#
helm: package docker.build
	helm upgrade --install \
	  --create-namespace prometheus-smtp-exporter \
	  --namespace prometheus \
	  --version 1.0.0 \
	  ./helm


# ----------------------------- local  >-----------------------------
