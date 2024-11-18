#!/bin/bash

# на маке так - read "?Введите ветку: " BRNCH

if [ -e ./.git ]; then
    STR=$(cat ./.git/HEAD)
    #echo ${STR:16}
    #read -p "Enter a comment: " COMMENT
    git add .
    #git commit -m "$COMMENT"
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
