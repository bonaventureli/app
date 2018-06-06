#!/bin/bash
APPNAME=appusart
FROMLIB=001/libusart/src
APPLIB=include
export export PATH=/usr/local/Trolltech/QtEmbedded-4.8.6-ubuntu2/bin:$PATH
export export PATH=/usr/local/Trolltech/QtEmbedded-4.8.6-ubuntu/bin:$PATH
case ${1} in
    "make")
	rm -rf $APPNAME
	mkdir $APPNAME
	mkdir -p $APPNAME/$APPLIB
	cp 001/appusart/* $APPNAME
	cp $FROMLIB/qextserialenumerator.h $APPNAME/$APPLIB
	cp $FROMLIB/qextserialenumerator_p.h $APPNAME/$APPLIB
	cp $FROMLIB/qextserialport.h $APPNAME/$APPLIB
	cp $FROMLIB/qextserialport_global.h $APPNAME/$APPLIB
	cp $FROMLIB/qextserialport_p.h $APPNAME/$APPLIB
	cp $FROMLIB/qextserialenumerator.cpp $APPNAME
	cp $FROMLIB/qextserialenumerator_linux.cpp $APPNAME
	cp $FROMLIB/qextserialport.cpp $APPNAME
	cp $FROMLIB/qextserialport_unix.cpp $APPNAME
	cd $APPNAME 	
	qmake -project
	sed -i '9iunix:!macx: LIBS += -ludev' $APPNAME.pro

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

