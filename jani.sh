#!/bin/bash
file= git diff --name-only
echo $file

git commit -a -m "autoupdate $file `date +%F-%T`"
