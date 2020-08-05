#!/bin/bash
set -ex

ssh-keyscan -t rsa github.com >> /etc/ssh/ssh_known_hosts
eval `ssh-agent -s`
ssh-add - <<< "$SSH_PRIVATE_KEY"

echo "$@"

git-filter-repo "$@"

git remote add remotetarget "git@github.com:$TARGET_ORG/$TARGET_REPO.git"
git push remotetarget HEAD:"$TARGET_BRANCH"
