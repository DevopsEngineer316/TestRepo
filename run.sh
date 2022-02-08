#!/bin/bash
 
read -p "Enter numeric value: " myvar
 
if [[ -n "$myvar" ]]
then
   git add .
   git commit -m "New file updated"
   git push origin main
   echo "Value is greater than 10"
else
    echo "No input"
fi
