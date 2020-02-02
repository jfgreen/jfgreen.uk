#!/usr/bin/env bash

remote_url=$(git config --get remote.origin.url)

set -ex

rm -rf public
zola build
cd public
git init
git add .
git commit -m "Deploy to github pages"
git remote add origin $remote_url
git push --force origin master:gh-pages
