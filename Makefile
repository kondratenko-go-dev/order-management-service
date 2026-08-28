.PHONY: help run test race vet lint fmt vuln tidy check

help:
	@echo "Available commands:"
	@echo "  make run    - run application"
	@echo "  make test   - run tests"
	@echo "  make race   - run tests with race detector"
	@echo "  make vet    - run go vet"
	@echo "  make lint   - run golangci-lint"
	@echo "  make fmt    - format Go code"
	@echo "  make vuln   - check vulnerabilities"
	@echo "  make tidy   - tidy Go modules"
	@echo "  make check  - run project checks"

run:
	go run .

test:
	go test ./...

race:
	go test -race ./...

vet:
	go vet ./...

lint:
	golangci-lint run ./...

fmt:
	gofmt -w .
	goimports -w .

vuln:
	govulncheck ./...

tidy:
	go mod tidy

check: test race vet lint vuln