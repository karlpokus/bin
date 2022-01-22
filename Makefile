VERSION := $(shell git describe --always --tags)
GOFLAGS := -trimpath -ldflags="-s -w -X main.version=$(VERSION)"
PREFIX=","

install:
	ln -siv -t ~/bin $$PWD/bin/*

build: test build-cidr build-clip build-cut

build-cidr:
	CGO_ENABLED=0 go build $(GOFLAGS) -o bin/$(PREFIX)cidr ./src/cidr

build-clip:
	cp src/clip bin/,clip
	sed -i '/VERSION=/c\VERSION='$(VERSION)'' bin/,clip

build-cut:
	cp src/cut bin/,cut
	sed -i '/VERSION=/c\VERSION='$(VERSION)'' bin/,cut

test:
	go test ./...

.PHONY: build build-cidr build-clip build-cut
