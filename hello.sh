#!/bin/bash
untrackedfile= git ls-files --others --exclude-standard
git add .
echo $untrackedfile
git commit -a -m " file autoupdated `date +%F-%T`"
#if [ "$untrackedfile" != NULL ]

#then
#  git push origin main 
#  echo "New files are uploaded in gitHub"
#else
#  echo "No new files"
   
#fi
if [ ! -n "$untrackedfile" ]
then
	echo " NULL"
else
	echo "\$var set and now starting $0 shell script..."
fi
