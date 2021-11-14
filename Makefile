VERSION := $(shell git describe --always --tags)
GOFLAGS := -trimpath -ldflags="-s -w -X main.version=$(VERSION)"
PREFIX=","

install:
	ln -siv -t ~/bin $$PWD/cmd/* $$PWD/bin/*

build: test build-cidr

build-cidr:
	CGO_ENABLED=0 go build $(GOFLAGS) -o bin/$(PREFIX)cidr ./src/cidr

test:
	go test ./...

.PHONY: build build-cidr
