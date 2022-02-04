#!/bin/bash
file= git diff --name-only --cache
echo $file
git add $file
git commit $file
git push origin main
