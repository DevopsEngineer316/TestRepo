#!/bin/bash
untrackedfile= git ls-files --others --exclude-standard
git checkout main
git add .
echo $untrackedfile


git commit -a -m " file autoupdated `date +%F-%T`"
if [ -n "$untrackedfile" ]
then
echo "New files are uploaded in gitHub"
git push origin main --force
echo "push completed"
fi
 
