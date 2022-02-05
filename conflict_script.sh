#!/bin/bash
git checkout Newbranch

DBUSER=gituser

DBPASS=Gitpassword1!

DBNAME=Testgitdatabase

DBPATH=/var/www/html/gitdatabase

git add .

varstatus_pull=$(git pull origin main 2>&1)
varstatus_cmt=$(git commit -a -m "$file autoupdated `date +%F-%T`" 2>&1)


if [ -z "$file" ]; then
mysqldump --no-tablespaces -u $DBUSER -p$DBPASS $DBNAME > $DBPATH/$DBNAME-$(date +%F-%T).sql



mysql --user=$DBUSER --password=$DBPASS $DBNAME <<EOF
use $DBNAME
INSERT INTO conflicts(id, filename, content, time) VALUES (NULL, "$varstatus_pull $varstatus_cmt ", "content", now());
EOF


git pull origin main
git checkout main
git merge Newbranch
echo "Conflict occurs"

else

untrackedfile= git ls-files --others --exclude-standard
git checkout main
git add .
echo $untrackedfile
git commit -a -m " autoupdated `date +%F-%T`" $untrackedfile

if [ -z "$untrackedfile" ]; then
git push origin main
echo "New files are uploaded in gitHub"
fi

fi
