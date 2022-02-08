#!/bin/bash
 
#read -p "Enter numeric value: " myvar


untrackedfile= git ls-files --others --exclude-standard
#git checkout main
#git add .
echo $untrackedfile
#git commit -a -m " file autoupdated `date +%F-%T`"
if [[ -z "$untrackedfile" ]];
then
   git add .
   git commit -m "New file updated"
   git push origin main
   echo "Value is greater than 10"
else
    echo "No input"
fi
