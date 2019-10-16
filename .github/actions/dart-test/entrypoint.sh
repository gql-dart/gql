#!/bin/bash
set -eu

cd $GITHUB_WORKSPACE

cd $PACKAGE

pub get

dartfmt -n . --set-exit-if-changed

pub run test
