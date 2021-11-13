#!/bin/bash

echo "Initialize git"
git init

echo "Add gitlab project as remote for the code"
git remote add origin http://192.168.33.9/gitlab/test/engineeringproduct.git

echo "Make initial commit"
git add .
git commit -m "Initial commit"

echo "Push and set remote branch"
git push -u origin master