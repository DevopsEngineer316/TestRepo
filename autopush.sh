#!/bin/bash

file= git diff --name-only
read file


git add .
git commit -a -m "$file autoupdate `date +%F-%T`"
git push origin main
