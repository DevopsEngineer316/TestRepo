#!/bin/bash
untrackedfile= git ls-files --others --exclude-standard
git checkout Newbranch
git add .
echo $untrackedfile
git commit -a -m " file autoupdated `date +%F-%T`"
#if [[ -z "$untrackedfile" ]]
#then
#  git push origin Newbranch 
#  echo "New files are uploaded in gitHub"
#else
#  echo "Push aborted"
#fi

