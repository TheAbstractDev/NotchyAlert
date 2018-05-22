#!/bin/sh

carthage bootstrap $@ --platform iOS --no-use-binaries || exit $?