#! /bin/sh

if [ -z "$DEBUG" ]; then
	DEBUG=0;
fi

pr () {
	l=$1; shift
	if [ "$l" -lt "$DEBUG" ]; then
		echo "$@"
	fi
}

cd $(dirname $0)
for i in svn/*; do
	if ! [ -d $i ]; then
		pr 1 "skipping $i"
		continue
	fi
	pr 1 "processing $i"

	( echo +++++ $i ; date; cd $i && git svn fetch && git push origin --mirror; ) >>logs/$i.log 2>&1
done

for i in git/*; do
	! [ -d $i ] && continue
	pr 1 "processing $i"
	( echo +++++ $i ; date; cd $i && git fetch && git push mirror --mirror; ) >>logs/$i.log 2>&1
done
