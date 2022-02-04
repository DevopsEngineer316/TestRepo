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

merge_conflict=" "

DBUSER=gituser

DBPASS=Gitpassword1!

DBNAME=Testgitdatabase

DBPATH=/var/www/html/gitdatabase

git add .



CONFLICTS=$(git ls-files -u | wc -l)
echo "conf"
echo "$CONFLICTS"
if [ "$CONFLICTS" -gt 0 ] ; then
   echo "There is a merge conflict. Aborting"
   merge_conflict="There is a merge conflict. Aborting"
   git merge --abort
   exit 1
   else
     echo "no prob"
     varstatus_pull=$(git pull origin main 2>&1)
      echo "$varstatus_pull"
     varstatus_cmt=$(git commit -a -m "$file autoupdated `date +%F-%T`" 2>&1)
     varstatus_push=$(git push origin main 2>&1)
     echo "New files are uploaded in gitHub"
     echo "$varstatus_push"
  fi




mysqldump --no-tablespaces -u $DBUSER -p$DBPASS $DBNAME > $DBPATH/$DBNAME-$(date +%F-%T).sql
mysql --user=$DBUSER --password=$DBPASS $DBNAME <<EOF
use $DBNAME
INSERT INTO conflicts(id, filename, content, time) VALUES (NULL, "$varstatus_pull $varstatus_cmt  $merge_conflict", "content", now());
EOF





fi
