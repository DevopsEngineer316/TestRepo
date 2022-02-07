#!/bin/bash
untrackedfile= git ls-files --others --exclude-standard
git checkout main
git add .
echo $untrackedfile
git commit -a -m " file autoupdated `date +%F-%T`"
#if [ -z "$untrackedfile" ]; then
if [ -z "$untrackedfile" ]; then
#if ["$untrackedfile" -gt 0]; then
git push origin main
echo "New files are uploaded in gitHub"

else
echo "Push aborted"
fi

