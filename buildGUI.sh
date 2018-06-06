#!/bin/bash
APPNAME=GUI
LIBV=001
LIBNAME=GUI
FROMNAME=001/GUI
#export export PATH=/usr/local/Trolltech/QtEmbedded-4.8.6-tslib-gfx/bin:$PATH
export export PATH=/usr/local/Trolltech/QtEmbedded-4.8.6-ubuntu2/bin:$PATH
export export PATH=/usr/local/Trolltech/QtEmbedded-4.8.6-ubuntu/bin:$PATH

case ${1} in
    "make")
	rm -rf $APPNAME
	mkdir $APPNAME
	cp -r $FROMNAME/* $APPNAME
	cd $APPNAME 	
	qmake LCr4500.pro
	#qmake -project
	qmake 
	make
	sed -i '/setCurrentText/d' ui_mainwindow.h
	make
	./LightCrafter4500
    ;;
    "clean")
	rm -rf $APPNAME
    ;;
    *)
	echo -e "\033[31m you must input ./${0} make/clean \033[0m"
    ;;
esac

