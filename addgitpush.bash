#!/bin/bash
if [ -e ./.git ]; then
    STR=$(cat ./.git/HEAD)
    git add .
    git commit -m "$1"
    git pull -r
    git push origin HEAD:refs/for/${STR:16}
elif [ $# -eq 0 ]; then
    echo "No argument"
    exit 1
else
    echo "You are not in the right directory or there is no branch $1"
    exit 0
fi
