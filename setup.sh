#! /bin/sh

if [ $# -ne 2 ]; then
	echo "usage: $(basename $0) svn-url repo-name"
	exit 1
fi

URL=$1
NAME=$2
git svn -s clone "$URL" "$NAME" &&
cd "$NAME" &&
. ~/priv/setup.sh &&
~/trifles/bin/ghr create "$NAME"
git remote add origin "https://github.com/$GITHUB_USER/$NAME"
git push --mirror
