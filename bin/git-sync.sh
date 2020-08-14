#!/usr/bin/env sh

CURRENT_BRANCH=`git br --show-current`
MAIN_BRANCH=$1

git stash
git checkout $MAIN_BRANCH
git fetch --all --prune
git merge
git checkout $CURRENT_BRANCH
git rebase $MAIN_BRANCH

BRANCHES=`git branch --merged | grep -v "\*" | grep -v $MAIN_BRANCH`

if [ ! -z "$BRANCHES" ]; then
  git branch -d $BRANCHES
fi

git stash pop
