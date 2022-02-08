#!/bin/bash
 
read -p "Enter numeric value: " myvar
 
if [[ -n "$myvar" ]]
then
    echo "Value is greater than 10"
else
    echo "No input"
fi
