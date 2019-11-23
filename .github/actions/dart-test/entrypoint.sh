#!/bin/bash
set -eu

cd $GITHUB_WORKSPACE

cd $PACKAGE

pub get

dartfmt -n . --set-exit-if-changed

if [ ! $SKIP_TEST ]; then
  pub run test
fi
