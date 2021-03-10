#!/bin/sh

go build -v -race -ldflags "-s -w" -o bin/app cmd/main.go

bin/app