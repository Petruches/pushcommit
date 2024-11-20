#!/bin/bash
if [ -e ./.git ]; then
    STR=$(cat ./.git/HEAD)
    git add .
    git commit -m "$@"
    git pull -r
    git push origin HEAD:refs/for/${STR:16}
elif [ $# -eq 0 ]; then
    echo "No argument"
    exit 1
else
    echo "You are not in the right directory or there is no branch $@"
    exit 1
fi
