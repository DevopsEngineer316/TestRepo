#!/bin/bash
git diff



git add .

#echo 'Enter the commit message:'
#read commitMessage

read date

git commit -m "$date"

#echo 'Enter the name of the branch:'
#read branch

git push origin main


