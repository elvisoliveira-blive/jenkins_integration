#!/bin/bash
REPO="github.com/elvisoliveira-blive/jenkins_integration.git"
COMMIT="$(hg log --limit 1 | grep summary | cut -d ':' -f 2 | awk '{$1=$1};1')"
USERNAME="elvisoliveira-blive"
PASSWORD="blive%40123"

if [ -d ".git" ]; then
    rm -rf .git
fi

git init
git config user.email elvis.oliveira@blive-ti.com.br
git config user.name "Elvis Oliveira"

echo '.hg' > .gitignore

git remote add origin https://"$REPO"

git add .
git commit -m "$COMMIT"
git push https://"$USERNAME":"$PASSWORD"@"$REPO" --all --force