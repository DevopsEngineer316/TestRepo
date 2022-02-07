#!/bin/bash

untrackedfile= git ls-files --others --exclude-standard 
git checkout main
git add .
echo $untrackedfile
git commit -a -m " file autoupdated `date +%F-%T`"
if [ -z "$untrackedfile" ]; then
echo "New files are uploaded in gitHub"
git push origin main
echo "push completed"
else
echo "Push Aborted"
fi

