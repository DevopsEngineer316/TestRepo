#!/bin/bash
untrackedfile= git ls-files --others --exclude-standard
git add .
echo $untrackedfile
git commit -a -m " file autoupdated `date +%F-%T`"
if [ -z "$untrackedfile" ];
then
  git push --set-upstream origin master 
  echo "New files are uploaded in gitHub"
#else
#  echo "Push aborted"
fi

