#!/bin/bash

git diff > autoupdatedfile.txt
file= git diff --name-only



git add .
git commit -a -m "$file autoupdate `date +%F-%T`"
git push origin main
