#!/bin/sh
#
# 


echo "Calling $0 with commit message $1"


# clean caches because we're going to dump DB

drush cc all

# move current dir to project root

cd `git rev-parse --git-dir`/..

# dump DB

drush sql-dump > dump.sql

# adding it to git ->  git add dump.sql //LEt's add ALL to git

git add .

#commiting

git commit -m "$1"

# return dir

cd -
