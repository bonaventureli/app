#!/bin/bash
APPNAME=appmain
APPPATCH=001/patch
PATCHFILE1=nogreencolorbackgrand.patch
export export PATH=/usr/local/Trolltech/QtEmbedded-4.8.6-tslib-gfx/bin:$PATH
case ${1} in
    "make")
	rm -rf $APPNAME
	mkdir $APPNAME
	cp 001/appmain/* $APPNAME
	cp $APPPATCH/$PATCHFILE1 $APPNAME
	cp -r 001/img $APPNAME
	cd $APPNAME 	
	sed -i '4i#include <QWSServer>' mainwindow.cpp
	sed -i "9 r $PATCHFILE1" mainwindow.cpp
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

