#! /bin/sh

cd $(dirname $0)
for i in *; do
	! [ -d $i ] && continue

	{ echo +++++; date; cd $i && git svn rebase && git push --mirror; } >>logs/$i.log 2>&1
done
