#! /bin/sh

cd $(dirname $0)
for i in svn/*; do
	! [ -d $i ] && continue

	{ echo +++++; date; cd $i && git svn fetch && git push origin && git gc --aggressive --quiet; } >>logs/$i.log 2>&1
done
