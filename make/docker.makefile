.PHONY: docker-init
docker-init:
	@touch VERSION
	@touch IMAGE

.PHONY: buildx-context
buildx-context:
	docker buildx create --name arm64 --use --platform linux/amd64,linux/arm64

.PHONY: buildx-clear
buildx-clear:
	docker buildx rm arm64

.PHONY: build
build:
	docker buildx build --load . -t $(IMAGE)
	@docker buildx build --load . -t $(IMAGE_LATEST) 

.PHONY: push
push:
	docker buildx build --platform linux/amd64 --push . -t $(IMAGE)
	@docker buildx build --platform linux/amd64 --push . -t $(IMAGE_LATEST)

.PHONY: docker-release
docker-release:
	@git add .
	@git commit -m "Automated release for version $(VERSION)"
	@git tag $(VERSION)
	@make push
