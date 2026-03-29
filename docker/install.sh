#!/bin/bash -Eeu

mkdir cdl && cd cdl

go mod init cdl-go-testing

# Dummy test file to pre-compile the stdlib testing package
cat > hiker_test.go << 'EOF'
package hiker
import "testing"
func Test_dummy(t *testing.T) {}
EOF

# Pre-compile into a shared build cache accessible by all users
mkdir /go/build-cache
GOCACHE=/go/build-cache go test ./...
chmod -R 777 /go/build-cache
