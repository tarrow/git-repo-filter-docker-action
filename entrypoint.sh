#!/bin/bash
set

git-filter-repo --path=lib/{includes,tests/phpunit}/{c,C}hanges/ --path lib/packages/wikibase/changes/ --path .mailmap --path-rename=lib/includes/{c,C}hanges:src --path-rename=lib/tests/phpunit/{c,C}hanges:tests --path-rename lib/packages/wikibase/changes/: --message-callback 'return re.sub(b"^changes: ", b"", message)'

git remote add tarrow "https://tarrow:$API_TOKEN_GITHUB@github.com/tarrow/Changes-clone.git"
git push tarrow HEAD:main