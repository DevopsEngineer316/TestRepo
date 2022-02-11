#!/bin/bash

file= git diff --name-only

echo "$file autoupdated `date +%F-%T`"
echo $file
## declare mail variables
##email subject
subject="File Verison changed Alert"
##sending mail as
from="root@qoneqt.com"
## sending mail to
to="support@qoneqt.com"

git checkout backup

DBUSER=gituser

DBPASS=Gitpassword1!

DBNAME=Testgitdatabase

DBPATH=/var/www/html/gitdatabase

git add .
git commit -m "New line updated  "



varstatus_pull=$(git pull origin main 2>&1)
varstatus_cmt=$(git commit -a -m "$file autoupdated `date +%F-%T`" 2>&1)
#varstatus_push=$(git push origin main 2>&1)


if [ -z "$file" ] 
then

git checkout main

echo "========================================"
git pull origin main
echo "==========PULL Completed================"
git merge backup
echo "==========MERGE Completed==============="
git push origin  main



echo "Either New files are uploaded in gitHub or no new files"

else


mysqldump --no-tablespaces -u $DBUSER -p$DBPASS $DBNAME > $DBPATH/$DBNAME-$(date +%F-%T).sql



#time= $(date +"%H:%M:%S")
#content = git diff

git checkout main
git pull origin main
git merge backup 

mysql --user=$DBUSER --password=$DBPASS $DBNAME <<EOF
use $DBNAME
INSERT INTO conflicts(id, filename, content, time) VALUES (NULL, "$varstatus_pull $varstatus_cmt ", "content", now());
EOF

echo "New edited file added in Database"
#else

#untrackedfile= git ls-files --others --exclude-standard
#echo $untrackedfile
#git commit -a -m " autoupdated `date +%F-%T`" 
#if [ -z "$untrackedfile" ]; then

#varstatus_push=$(git push origin main 2>&1)
#git push origin  main
#echo "Either New files are uploaded in gitHub or no new files"
#echo "$varstatus_push"
#fi

fi
