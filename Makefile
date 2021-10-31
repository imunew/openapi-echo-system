build-api-spec:
	docker-compose run --rm swagger-cli swagger-cli bundle -t yaml -o ./dist/openapi.yaml ./src/index.yaml

open-api-spec: build-api-spec
	docker-compose up swagger-ui

generate-api-client: build-api-spec
	docker-compose run --rm openapi-generator generate -i /openapi/openapi/dist/openapi.yaml -g typescript-axios -o /openapi/client/typescript-axios

run-mock-api: build-api-spec
	docker-compose up prism
