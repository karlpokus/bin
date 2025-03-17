#!/bin/bash

# This thing tries to add colour to stdout and stderr
# to be able to tell them apart in the output.
#
# stdout is green
# stderr is red

# USAGE:
#
# Run the command passed as arguments and colorize stdout and stderr separately
"$@" 2> >(sed $'s/^/\033[31m/;s/$/\033[0m/' >&2) | sed $'s/^/\033[32m/;s/$/\033[0m/'

