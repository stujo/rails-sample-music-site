
# git stash -q --keep-index

bin/rspec

RESULT=$?

# git stash pop -q

[ RESULT -ne 0 ] && exit 1
exit 0
