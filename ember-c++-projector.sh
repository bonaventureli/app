#!/bin/bash
APPNAME=ember-c++-projector
LIBV=001
LIBNAME=C++
FROMNAME=$LIBV/ember-firmware/$LIBNAME
APPLIB=$LIBV/appemberProjector
export export PATH=/usr/local/Trolltech/QtEmbedded-4.8.6-tslib-ubuntu/bin:$PATH
case ${1} in
    "make")
	rm -rf $APPNAME
	mkdir $APPNAME
	cp -r $FROMNAME/* $APPNAME
	cp -r $APPLIB/* $APPNAME
	cd $APPNAME 
	mv Projector.h include	
	mkdir build
	cd build
	cmake -DCMAKE_BUILD_TYPE=Debug ..
	make -j4
	#make install
	#./$APPNAME
    ;;
    "clean")
	rm -rf $APPNAME
    ;;
    *)
	echo -e "\033[31m you must input ./${0} make/clean \033[0m"
    ;;
esac

