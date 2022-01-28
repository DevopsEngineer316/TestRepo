#!/bin/bash

file= git diff --name-only

echo $file  


DBUSER=gituser

DBPASS=Gitpassword1!

DBNAME=Testgitdatabase

content= git diff

echo $content

mysql --user=$DBUSER --password=$DBPASS $DBNAME <<EOF
use $DBNAME
INSERT INTO conflicts(id, filename, content, time) VALUES (NULL, '$file', '$content', now());
EOF

git add 
git commit -a -m "$file autoupdated `date +%F-%T`"
git push origin master

