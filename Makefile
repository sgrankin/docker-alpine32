BRANCH := v3.5
VERSION := 3.5.2
PLATFORM := x86

.PHONY: build
build: rootfs.tgz
	docker build -t alpine32 .

rootfs.tgz:
	curl -o $@ https://nl.alpinelinux.org/alpine/$(BRANCH)/releases/x86/alpine-minirootfs-$(VERSION)-x86.tar.gz /

.PHONY: exec
exec: build
	docker run -it --rm alpine32 /bin/sh

.PHONY: run
run: build
	docker run -it --rm alpine32
