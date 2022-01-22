#!/bin/bash

#file= git diff --name-only

#echo "$file autoupdated `date +%F-%T`"
file= git diff --name-only
echo $file
DBUSER=gituser

DBPASS=Gitpassword1!

DBNAME=Testgitdatabase



#time= $(date +"%H:%M:%S")
#conflicts_content = git diff

mysql --user=$DBUSER --password=$DBPASS $DBNAME <<EOF
use $DBNAME
INSERT INTO conflicts(id, filename, content, time) VALUES (NULL, '$file' , "test", now());
EOF

git add .
git commit -a -m "$file autoupdated `date +%F-%T`"
git push origin main

