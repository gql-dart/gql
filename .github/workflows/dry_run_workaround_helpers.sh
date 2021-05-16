#!/bin/bash

##
## TEMPORARY WORKAROUND HELPERS FOR https://github.com/google/built_value.dart/issues/1032
##
## once built_value_generator is implemented nullsafe this can be deleted
## and the workflow can be reset to just:
## `multipack --only $PACKAGES pub publish --dry-run`
##

# capture the output of a command so it can be retrieved with ret
cap () { tee /tmp/capture.out; }

# return the output of the most recent command that was captured by cap
ret () { cat /tmp/capture.out; }

# ignore err when stdout contains all of the given strings
ignore_err_when_stdout_contains() {
  code=$?
  if [[ "$code" == "0" ]]; then
    return 0
  fi
  output=`ret`
  for search in $@
  do
    if [[ "$output" != *"$search"* ]]; then
      return $code
    fi
  done
}

