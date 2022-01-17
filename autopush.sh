#!/bin/bash

git diff > autoupdatedfile.txt

git add .
git commit -a -m "autoupdate `date +%F-%T`"
git push origin main
