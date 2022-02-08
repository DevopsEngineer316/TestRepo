#!/bin/bash

file= git diff --name-only
echo $file
if [ -n "$file" ]
then


        echo "New files added"
#        git push origin main --force
 #       echo "push completed"


else
echo "Conflict occurs"

fi
