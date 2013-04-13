#! /bin/sh

if [ $# -ne 2 ]; then
	echo "usage: $(basename $0) svn-url store repo-name"
	exit 1
fi

SVN_URL=$1
DIR=$2
NAME=$3
GIT_URL="https://github.com/$GITHUB_USER/$NAME"

. ~/priv/setup.sh

mkdir -p "$2" &&
cd "$2" &&
git init --bare &&
git svn -s init "$SVN_URL" &&
git remote add origin  "$GIT_URL" &&
git config --add remote.origin.push 'refs/remotes/svn/*:refs/heads/*' &&
~/trifles/bin/ghr create "$NAME" &&
git push
