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

DBPATH= /var/www/html/gitdatabase/

if [ file != git diff --name-only ]; then
mysqldump -u $DBUSER -p$DBPASS $DBNAME > $DBPATH/$DBNAME.sql


fi


#time= $(date +"%H:%M:%S")
content = git diff

INSERT INTO conflicts(id, filename, content, time) VALUES (NULL, $file, $content, now());


git add .
git commit -a -m "$file autoupdated `date +%F-%T`"
git push origin main

