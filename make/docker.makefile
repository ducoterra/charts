.PHONY: docker-init
docker-init:
	@touch VERSION
	@touch IMAGE

.PHONY: buildx-context
buildx-context:
	docker buildx create --name container-builder --use --platform linux/amd64,linux/arm64

.PHONY: buildx-clear
buildx-clear:
	docker buildx rm container-builder

.PHONY: build
build:
	docker buildx build --load . -t $(IMAGE)
	@docker buildx build --load . -t $(IMAGE_LATEST)

.PHONY: push
push:
	docker buildx build --platform linux/amd64 --push . -t $(IMAGE)
	@docker buildx build --platform linux/amd64 --push . -t $(IMAGE_LATEST)
