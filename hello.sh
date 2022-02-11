#!/bin/bash
untrackedfile= git ls-files --others --exclude-standard
git add .
echo $untrackedfile
git commit -a -m " file autoupdated `date +%F-%T`"
#if [ "$untrackedfile" != NULL ]

if [ -z "$untrackedfile" ] && echo "NULL" || echo "Not NULL"
#then
#  git push origin main 
#  echo "New files are uploaded in gitHub"
#else
#  echo "No new files"
   
fi

