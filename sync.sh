#! /bin/sh

cd $(dirname $0)
for i in svn/*; do
	! [ -d $i ] && continue

	{ echo +++++; date; cd $i && git svn fetch && git push origin --mirror && git gc --aggressive --quiet; } >>logs/$i.log 2>&1
done

for i in git/*; do
	! [ -d $i ] && continue
	{ echo +++++; date; cd $i && git fetch && git push mirror --mirror && git gc --aggressive --quiet; } >>logs/$i.log 2>&1
done
