#!/bin/bash
set -ex

ssh-keyscan -t rsa github.com >> /etc/ssh/ssh_known_hosts
eval `ssh-agent -s`
ssh-add - <<< "$SSH_PRIVATE_KEY"

ssh-add -l

git-filter-repo --path=lib/{includes,tests/phpunit}/{c,C}hanges/ --path lib/packages/wikibase/changes/ --path .mailmap --path-rename=lib/includes/{c,C}hanges:src --path-rename=lib/tests/phpunit/{c,C}hanges:tests --path-rename lib/packages/wikibase/changes/: --message-callback 'return re.sub(b"^changes: ", b"", message)'

git remote add tarrow "git@github.com:tarrow/Changes-clone.git"
git push tarrow HEAD:main