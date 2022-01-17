#!/bin/bash

file= git diff --name-only

echo "$file autoupdated `date +%F-%T`"


git add .
git commit -a -m "$file autoupdated `date +%F-%T`"
git push origin main
