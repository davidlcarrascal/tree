 # Go parameters
GOCMD=go
GOBUILD=$(GOCMD) build
GOINSTALL=$(GOCMD) install
BINARY_NAME=tree
BINARY_UNIX=$(BINARY_NAME)_unix

build: 
	$(GOBUILD) -o $(BINARY_NAME) -v
 # Cross compilation
build-linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 $(GOBUILD) -o $(BINARY_UNIX) -v
install: 
	$(GOINSTALL)