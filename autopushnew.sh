#!/bin/bash

file= git diff --name-only

echo "$file autoupdated `date +%F-%T`"

## declare mail variables
##email subject
subject="File Verison changed Alert"
##sending mail as
from="root@qoneqt.com"
## sending mail to
to="support@qoneqt.com"

DBUSER=gituser

DBPASS=Gitpassword1!

DBNAME=Testgitdatabase

DBPATH=/var/www/html/gitdatabase

git add .

varstatus_pull=$(git pull origin main 2>&1)

CONFLICTS=$(git ls-files -u | wc -l)
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is a merge conflict. Aborting"
   git merge --abort
   exit 1
f
echo "no prob"


fi
