#!/bin/bash
APPNAME=${0}.app
LIBV=001
FROMNAME=001/tcpip2
#export export PATH=/usr/local/Trolltech/QtEmbedded-4.8.6-tslib-gfx/bin:$PATH
#export export PATH=/usr/local/Trolltech/QtEmbedded-4.8.6-ubuntu2/bin:$PATH
export export PATH=/usr/local/Trolltech/QtEmbedded-4.8.6-ubuntu/bin:$PATH

case ${1} in
    "make")
	rm -rf $APPNAME
	mkdir $APPNAME
	cp -r $FROMNAME/* $APPNAME
	cd $APPNAME 	
	qmake -project
	sed -i "4iQT += network" $APPNAME.pro
(
cat << EOF
TARGET = $APPNAME
EOF
)>> $APPNAME.pro
	qmake 
	make
	./$APPNAME	
    ;;
    "clean")
	rm -rf $APPNAME
    ;;
    *)
	echo -e "\033[31m you must input ./${0} make/clean \033[0m"
    ;;
esac

