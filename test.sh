#!/bin/bash

file= git diff --name-only
echo $file
if [ -n "$file" ]
then


        echo "push completed"
#        git push origin main --force
 #       echo "push completed"


else
echo "conflict occurs"

fi
