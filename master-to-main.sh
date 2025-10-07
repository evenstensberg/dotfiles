#!/usr/bin/env bash

git checkout master
git pull origin master
git branch -m master main
git push -u origin main