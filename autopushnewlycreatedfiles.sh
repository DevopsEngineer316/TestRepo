#!/bin/bash

untrackedfile= git ls-files --others --exclude-standard
git add $(git ls-files -o --exclude-standard)
varstatus_commit=$(git commit -a -m "$(git ls-files -o --exclude-standard autoupdated) `date +%F-%T`" 2>&1)
if [ -z "$untrackedfile" ]; then

#varstatus_push=$(git push origin main 2>&1)
git push origin main
echo "New files are uploaded in gitHub"
#echo "$varstatus_push"

fi
