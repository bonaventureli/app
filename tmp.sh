#!/bin/bash
APPNAME=${0}.app
LIBV=001
LIBNAME=libusart
FROMNAME=001/B9Creator/Root/B9Creator
export export PATH=/usr/local/Trolltech/QtEmbedded-4.8.6-tslib-gfx/bin:$PATH
export export PATH=/usr/local/Trolltech/QtEmbedded-4.8.6-ubuntu2/bin:$PATH
export export PATH=/usr/local/Trolltech/QtEmbedded-4.8.6-ubuntu/bin:$PATH

case ${1} in
    "make")
	rm -rf $APPNAME
	mkdir $APPNAME
	cp -r $FROMNAME/* $APPNAME
	cp -r $LIBV/$LIBNAME $APPNAME
	cp -r 001/B9Creator-arm/* $APPNAME
	cd $APPNAME 	
	rm -rf qextserialport-1.2beta2
	qmake -project
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

