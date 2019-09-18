.PHONY: linux
linux: ## 构建linux版本
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build
.PHONY: image
image: ## 构建镜像
	docker build -t auxpi:base -f hack/docker/Dockerfile .
	docker build -t ysicing/auxpi .

help: ## help
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {sub("\\\\n",sprintf("\n%22c"," "), $$2);printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
