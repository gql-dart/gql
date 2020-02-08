#!/bin/bash
set -eu

cd $GITHUB_WORKSPACE

cd $PACKAGE

[ ! -d ./test ] && exit 0

pub get

dartfmt -n . --set-exit-if-changed

pub run test
