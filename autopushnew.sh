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
varstatus_cmt=$(git commit -a -m "$file autoupdated `date +%F-%T`" 2>&1)
#varstatus_push=$(git push origin main 2>&1)


if [ -z "$file" ]; then
mysqldump --no-tablespaces -u $DBUSER -p$DBPASS $DBNAME > $DBPATH/$DBNAME-$(date +%F-%T).sql



#time= $(date +"%H:%M:%S")
#content = git diff
mysql --user=$DBUSER --password=$DBPASS $DBNAME <<EOF
use $DBNAME
INSERT INTO conflicts(id, filename, content, time) VALUES (NULL, "$varstatus_pull $varstatus_cmt ", "content", now());
if
EOF











