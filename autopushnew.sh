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

if [ -z "$file" ]; then
mysqldump --no-tablespaces -u $DBUSER -p$DBPASS $DBNAME > $DBPATH/$DBNAME-$(date +%F-%T).sql


fi





git add .
git pull origin main
varstatus=$(git commit -a -m "$file autoupdated `date +%F-%T`" 2>&1)

git push origin main


#time= $(date +"%H:%M:%S")
#content = git diff
mysql --user=$DBUSER --password=$DBPASS $DBNAME <<EOF
use $DBNAME
INSERT INTO conflicts(id, filename, content, time) VALUES (NULL, "$varstatus", "content", now());
EOF

#INSERT INTO conflicts(id, filename, content, time) VALUES (NULL, 'TEST', 'TEST', now());
