ci: lint test test-cover test-race

lint: setup-lint vendor
	golangci-lint run

run: vendor
	go run ./cmd/go-coverage-threshold/main.go

setup-lint:
	wget -O - -q https://raw.githubusercontent.com/golangci/golangci-lint/master/install.sh| sh -s v1.21.0

test: vendor
	go test ./...

test-cover: vendor
	go run ./cmd/go-coverage-threshold/main.go

test-race: vendor
	go test -race ./...

vendor:
	go mod vendor

.DO_NOT_CACHE: lint test test-cover test-race
