#!/bin/bash

BUILDNUMBER=$1
REGEXPR=s/[$]BUILDNUMBER/$BUILDNUMBER/
INVREGEXPR=s/$BUILDNUMBER/\$BUILDNUMBER/

if [ -z "$1" ]
then
	echo "Error: enter build number"
	exit 1
fi

mkdir mypackage

if [ -d mypackage/DEBIAN ]
then
	echo "Exist folder DEBIAN"
	rm -rf mypackage/DEBIAN
fi

if [ -d mypackage/usr ]
then
	echo "rm usr"
	rm -rf mypackage/usr
fi

mkdir -p mypackage/DEBIAN
mkdir -p mypackage/usr/lib
cp control mypackage/DEBIAN/
cp code.py mypackage/usr/lib/
sed -i -e $REGEXPR mypackage/DEBIAN/control

dpkg-deb -b mypackage .
