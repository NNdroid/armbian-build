#!/bin/bash
git pull origin main
git checkout --orphan latest_branch
git add -A
git commit -m "Initial commit"
git branch -D main
git branch -m main
git push -f origin main
