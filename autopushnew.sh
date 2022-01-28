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

#if [ $file != NULL ]; then
mysqldump --no-tablespaces -u $DBUSER -p$DBPASS $DBNAME > $DBPATH/$DBNAME_$(date +%F-%T).sql


#fi


#time= $(date +"%H:%M:%S")
#content = git diff
mysql --user=$DBUSER --password=$DBPASS $DBNAME <<EOF
use $DBNAME
INSERT INTO conflicts(id, filename, content, time) VALUES (NULL, "file", "content", now());
EOF

#INSERT INTO conflicts(id, filename, content, time) VALUES (NULL, 'TEST', 'TEST', now());


git add .
git commit -a -m "$file autoupdated `date +%F-%T`"
git push origin main

