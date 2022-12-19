.PHONY: build
build:
	tsc --build tsconfig.json

.PHONY: client
client:
# Generate client
# Checkout https://github.com/OpenAPITools/openapi-generator/releases
	@chmod +x ./openapi-generator
	@rm -rf ./client
	OPENAPI_GENERATOR_VERSION=6.2.1 ./openapi-generator generate -i https://raw.githubusercontent.com/moov-io/ach/v1.26.2/openapi.yaml -g typescript-axios

.PHONY: docs
docs:
	npm install -g typedoc
	typedoc --out docs/ *.ts
