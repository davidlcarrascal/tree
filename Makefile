 # Go parameters
GOCMD=go
GOBUILD=$(GOCMD) build
GOCLEAN=$(GOCMD) clean
GOTEST=$(GOCMD) test
GOGET=$(GOCMD) get
BINARY_NAME=tree
BINARY_UNIX=$(BINARY_NAME)_unix

run: 
	$(GOBUILD) -o $(BINARY_NAME) -v 
	./$(BINARY_NAME) ../bets/
build: 
	$(GOBUILD) -o $(BINARY_NAME) -v
 # Cross compilation
build-linux:
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 $(GOBUILD) -o $(BINARY_UNIX) -v