#!/bin/sh

# git stash -q --keep-index
echo "Running RSpec"

bin/rspec

RESULT=$?

# git stash pop -q

[ RESULT -ne 1 ] && exit 1

echo "RSpec Passed"
exit 0
