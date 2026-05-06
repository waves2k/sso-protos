# Путь к 
GO_GEN_PATH = gen/go

# Путь генерации .pb файлов
PKG_PROTO_PATH = $(CURDIR)/$(GO_GEN_PATH)

# Название пакета
PACKAGE_NAME = github.com/waves2k/sso-service

# Путь до protobuf файлов
PROTOBUFF_PATH = $(CURDIR)/proto/*.proto

.PHONY: all

all: protoc-generate

.PHONY: protoc-generate
protoc-generate:
	@mkdir -p $(PKG_PROTO_PATH)

	@protoc \
			--proto_path=$(CURDIR) \
			--go_out=$(PKG_PROTO_PATH) \
			--go_opt=module=$(PACKAGE_NAME) \
			--go-grpc_out=$(PKG_PROTO_PATH) \
			--go-grpc_opt=module=$(PACKAGE_NAME) \
			$(PROTOBUFF_PATH)