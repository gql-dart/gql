#/bin/bash

set -e

PACKAGE=$1

# Check pubspec
multipack --only $PACKAGE pubspec clean
multipack --only $PACKAGE exec git diff --exit-code pubspec.yaml

# Override local dependencies
multipack pubspec hard_override

multipack --only $PACKAGE pub get

# Check formatting
echo ""
echo "A list of incorrectly formatted files may follow:"
echo ""
multipack --only $PACKAGE fmt -n . --set-exit-if-changed
echo ""

# Analyze package
multipack --only $PACKAGE analyze --version
multipack --only $PACKAGE analyze --fatal-warnings --no-hints .

# Run tests
# mockito requires build runner now
multipack --only $PACKAGE pub run build_runner build --delete-conflicting-outputs
multipack --only $PACKAGE exec [ ! -d ./test ] && exit 0
multipack --only $PACKAGE pub run test
